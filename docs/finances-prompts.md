# Prompts — Módulo Finanzas (nm_mobile)

Orden de implementación: **Layout → POS → Ventas → Caja**

Referencia Angular: `nm-frontend-v2/src/app/features/finances`  
Referencia Backend: `nm-backend/app/Finance`  
Reglas: `nm_mobile/.cursorrules`

---

## Prompt 0 — Contexto (pegar al inicio de cada sesión si hace falta)

```
Lee @nm_mobile/.cursorrules

Stack: Flutter + Riverpod (@riverpod) + GoRouter + Dio + Freezed + json_serializable.
Arquitectura: Clean Architecture + DDD, feature-first.
API base: https://api.novedadesmaritex.net.pe/api/ (ver ApiConstants).
Referencia UI/lógica: @nm-frontend-v2/src/app/features/finances
Referencia APIs: @nm-backend/app/Finance
Prioridad de diseño: responsive mobile (<600px) y tablet (≥600px).
Al final recuerda: dart run build_runner build --delete-conflicting-outputs
```

---

## Prompt 1 — Layout principal + navegación post-login

```
Lee @nm_mobile/.cursorrules

Actualmente el login funciona pero no navega a ningún lado. Necesito el shell/layout principal de la app post-autenticación, inspirado en @nm-frontend-v2/src/app/layouts/main-layout pero adaptado a Flutter mobile/tablet.

Implementa:

1. **core/routing/app_router.dart**
   - Ruta `/login` (pública)
   - Shell route `/` con redirect guard: si no hay sesión → `/login`, si hay sesión → `/finances/pos`
   - Rutas hijas placeholder (por ahora pantallas vacías con título):
     - `/finances/pos` → POS
     - `/finances/sales` → Ventas
     - `/finances/cash-movements` → Caja

2. **features/shell/** (nuevo feature)
   - `presentation/pages/app_shell_page.dart`: layout con:
     - **Mobile (<600px):** `NavigationBar` inferior (POS, Ventas, Caja) + AppBar con nombre usuario y botón logout
     - **Tablet (≥600px):** sidebar fijo izquierdo (como main-layout Angular) + área de contenido
   - Mostrar solo ítems según permisos del User autenticado (igual que Angular):
     - POS → `pos.checkout`
     - Ventas → `sale.getAll` o `sale.get`
     - Caja → `cashflow.getDaily`
   - Header: iniciales, nombre, rol del usuario logueado
   - Logout llama a AuthNotifier.logout() y redirige a `/login`

3. **LoginPage**
   - Al `AuthState.authenticated`, navegar con `context.go('/finances/pos')`

4. **Persistencia de sesión (opcional pero recomendado)**
   - Al abrir la app, si `hasActiveSession()` es true, restaurar usuario vía GET `auth/me` o mantener estado

Estilo: minimalista, fondo claro, acento azul `#1565C0` (consistente con login). Usar GoRouter `ShellRoute`.

No implementes aún la lógica de POS/Ventas/Caja — solo el layout y rutas.
```

---

## Prompt 2 — Feature POS (Punto de Venta)

```
Lee @nm_mobile/.cursorrules

Implementa el feature completo `features/pos/` siguiendo Clean Architecture. Réplica funcional de @nm-frontend-v2/src/app/features/finances/pos conectado al backend @nm-backend/app/Finance/Sale.

### APIs (prefijo ApiConstants.apiUrl)
| Método | Endpoint | Permiso |
|--------|----------|---------|
| GET | `pos/products?sku={sku}` | pos.searchProduct |
| GET | `pos/customers?dni={dni}` | pos.searchCustomer |
| POST | `pos/checkout` | pos.checkout |
| GET | `pos/sales/{saleId}/ticket` (HTML) | sale.get \| pos.checkout |

### Domain
- Entidades: Product, Variant, CartItem, Customer, PaymentEntry, DocumentType, CheckoutResult
- Repositorio abstracto: PosRepository (searchProduct, searchCustomer, checkout)

### Data
- DTOs con @JsonSerializable mapeando camelCase ↔ snake_case del API Laravel
- PosRemoteDataSource + PosRepositoryImpl usando Dio
- Providers Riverpod para inyección

### Presentation
- `@riverpod` PosNotifier con estado: cart, customer, documentType, loading, toastMessage, lastSaleId
- Lógica de carrito igual que PosService Angular (add/update/remove, stock máximo, totales)
- **PosPage** responsive inspirada en pos.component.html:
  - Header: título, contador ítems, total S/
  - Búsqueda cliente por DNI
  - Input SKU/código de barras (autofocus, Enter para buscar)
  - Lista del carrito con editar/eliminar cantidad
  - Selector tipo documento: TICKET_INTERNO | BOLETA | FACTURA
  - Footer: total + botón Cobrar
  - Modal bottom sheet para elegir talla/color al agregar producto (pos-selector)
  - Modal de pagos múltiples (CASH, YAPE, CARD) antes del checkout
  - Banner si user.warehouseId == null ("Sin almacén asignado")
  - SnackBar/toast para feedback

### Impresión (fase 1 — sin Bluetooth aún)
- Tras checkout exitoso, guardar saleId
- Botón "Imprimir ticket" que obtiene HTML de `pos/sales/{id}/ticket`
- Mostrar preview en WebView o dialog (no imprimir Bluetooth todavía — dejar TODO en domain para core/services)

Payload checkout igual que Angular pos.service.ts (document_type, serie, customer.id, total, payments, items con color/inventory).

Conecta la ruta `/finances/pos` al PosPage real.
```

---

## Prompt 3 — Feature Ventas (Sales list + detalle/edición)

```
Lee @nm_mobile/.cursorrules

Implementa `features/sales/` — listado y gestión de ventas, réplica de @nm-frontend-v2/src/app/features/finances/sales/lists conectado a @nm-backend/app/Finance/Sale/Routes/api.php.

### APIs
| Método | Endpoint | Permiso |
|--------|----------|---------|
| GET | `sales?limit=&page=&search=` | sale.getAll |
| GET | `sales/{id}` | sale.get |
| PATCH | `sales/{id}` | sale.update |
| DELETE | `sales/{id}` | sale.delete |
| GET | `pos/sales/{id}/ticket` (HTML preview) | sale.get |

### Domain
- Entidades: Sale, SaleDetail, SaleItem, SalePayment, SaleListPage (data + paginate)
- SaleRepository: getAll, getOne, update, cancel

### Data
- DTOs + adapters (soportar respuesta directa o `{ data: ... }` como sale.adapter.ts Angular)
- SaleRemoteDataSource + SaleRepositoryImpl

### Presentation
- `@riverpod` SalesListNotifier: paginación, búsqueda con debounce, estados loading/error/empty
- **SalesListPage** inspirada en sales-list.component.html:
  - Título "Ventas" + botón "Nueva venta" → navega a `/finances/pos`
  - Campo búsqueda (código, cliente, comprobante)
  - Lista/cards responsive: código, cliente, total, fecha, estado, tipo documento, SUNAT status
  - Paginación (anterior/siguiente)
  - Tap en venta → bottom sheet o página de detalle
  - Acciones según permisos: ver ticket, editar (sale.update), anular (sale.delete) con confirmación
- **SaleDetailPage** o sheet: ítems, pagos, totales; formulario edición si sale.update
- Diálogo confirmación para anular ("devolverá stock al inventario")

Estados visuales: ACTIVE, CANCELED. Formatear montos S/ y fechas en locale es-PE.

Conecta `/finances/sales` al SalesListPage.
```

---

## Prompt 4 — Feature Caja (Cash Movements)

```
Lee @nm_mobile/.cursorrules

Implementa `features/cash_movements/` — control de caja diaria, réplica de @nm-frontend-v2/src/app/features/finances/cash-movements conectado a @nm-backend/app/Finance/CashMovement/Routes/api.php.

### APIs
| Método | Endpoint | Permiso |
|--------|----------|---------|
| GET | `cash-flow/daily?date={YYYY-MM-DD}&filters[]=CASH&filters[]=YAPE&filters[]=CARD` | cashflow.getDaily |
| POST | `cash-flow` (FormData/multipart) | cashflow.store |
| PUT | `cash-flow/{id}` (FormData con _method=PUT vía POST si hace falta) | cashflow.update |
| DELETE | `cash-flow/{id}` | cashflow.update |

### Domain
- Entidades: CashDailyReport, CashDailySummary, CashMovementItem, MovementPayload, PaymentMethod, MovementType, MovementCategory
- CashMovementRepository: loadDailyReport, registerMovement, updateMovement, deleteMovement

### Data
- DTOs mapeando cash-movement.model.ts y cash-movement.adapter.ts Angular
- Enviar FormData como Angular (type, category, amount, description, date, payment_method)
- CashMovementRemoteDataSource + RepositoryImpl

### Presentation
- `@riverpod` CashRegisterNotifier: fecha seleccionada, report, loading, error
- **CashRegisterPage** inspirada en cash-register.component.html:
  - Header "Control de Caja" + indicador "Caja abierta"
  - Navegación de fecha (solo admin puede cambiar día — usar user.role o permissions)
  - Cards resumen: saldo inicial, ventas, ingresos, egresos, saldo final
  - 3 secciones con listas: Ventas del día, Ingresos, Egresos
  - FAB o botones: "+ Ingreso" / "+ Egreso" → MovementFormSheet
  - Presets rápidos egreso: Pasaje S/4, Almuerzo S/10, Vigilancia S/1 (QUICK_EXPENSE_PRESETS)
  - Editar/eliminar movimiento con confirmación
- **MovementFormSheet**: descripción, monto, fecha, método pago (CASH/YAPE/CARD)

Mobile: layout en columna, cards apiladas. Tablet: grid 2 columnas para resumen.

Conecta `/finances/cash-movements` al CashRegisterPage.
```

---

## Prompt 5 — Integración final (opcional)

```
Revisa el módulo finances completo en @nm_mobile:

1. Verifica que todas las rutas del shell funcionen y respeten permisos
2. Deep links: desde Ventas "Nueva venta" → POS; desde POS post-venta opción "Ver en ventas"
3. Manejo global de 401: interceptor Dio que haga logout y redirija a /login
4. flutter analyze lib sin errores
5. Prueba en mobile y tablet (LayoutBuilder breakpoint 600px)

Recuerda: dart run build_runner build --delete-conflicting-outputs
```

---

## Notas técnicas

- **Permisos:** vienen en `User.permissions` del login — filtrar menú y acciones
- **Warehouse:** POS requiere `user.warehouseId`; mostrar banner si es null
- **Impresión térmica:** fase 2 — interfaz en domain, impl en `core/services` (regla .cursorrules §7)
- **APK release:** permiso INTERNET ya está en main AndroidManifest
