// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductVariantInventory {

 int get availableQuantity; int get warehouseId;
/// Create a copy of ProductVariantInventory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductVariantInventoryCopyWith<ProductVariantInventory> get copyWith => _$ProductVariantInventoryCopyWithImpl<ProductVariantInventory>(this as ProductVariantInventory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductVariantInventory&&(identical(other.availableQuantity, availableQuantity) || other.availableQuantity == availableQuantity)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId));
}


@override
int get hashCode => Object.hash(runtimeType,availableQuantity,warehouseId);

@override
String toString() {
  return 'ProductVariantInventory(availableQuantity: $availableQuantity, warehouseId: $warehouseId)';
}


}

/// @nodoc
abstract mixin class $ProductVariantInventoryCopyWith<$Res>  {
  factory $ProductVariantInventoryCopyWith(ProductVariantInventory value, $Res Function(ProductVariantInventory) _then) = _$ProductVariantInventoryCopyWithImpl;
@useResult
$Res call({
 int availableQuantity, int warehouseId
});




}
/// @nodoc
class _$ProductVariantInventoryCopyWithImpl<$Res>
    implements $ProductVariantInventoryCopyWith<$Res> {
  _$ProductVariantInventoryCopyWithImpl(this._self, this._then);

  final ProductVariantInventory _self;
  final $Res Function(ProductVariantInventory) _then;

/// Create a copy of ProductVariantInventory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableQuantity = null,Object? warehouseId = null,}) {
  return _then(_self.copyWith(
availableQuantity: null == availableQuantity ? _self.availableQuantity : availableQuantity // ignore: cast_nullable_to_non_nullable
as int,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductVariantInventory].
extension ProductVariantInventoryPatterns on ProductVariantInventory {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductVariantInventory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductVariantInventory() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductVariantInventory value)  $default,){
final _that = this;
switch (_that) {
case _ProductVariantInventory():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductVariantInventory value)?  $default,){
final _that = this;
switch (_that) {
case _ProductVariantInventory() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int availableQuantity,  int warehouseId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductVariantInventory() when $default != null:
return $default(_that.availableQuantity,_that.warehouseId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int availableQuantity,  int warehouseId)  $default,) {final _that = this;
switch (_that) {
case _ProductVariantInventory():
return $default(_that.availableQuantity,_that.warehouseId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int availableQuantity,  int warehouseId)?  $default,) {final _that = this;
switch (_that) {
case _ProductVariantInventory() when $default != null:
return $default(_that.availableQuantity,_that.warehouseId);case _:
  return null;

}
}

}

/// @nodoc


class _ProductVariantInventory implements ProductVariantInventory {
  const _ProductVariantInventory({required this.availableQuantity, required this.warehouseId});
  

@override final  int availableQuantity;
@override final  int warehouseId;

/// Create a copy of ProductVariantInventory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductVariantInventoryCopyWith<_ProductVariantInventory> get copyWith => __$ProductVariantInventoryCopyWithImpl<_ProductVariantInventory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductVariantInventory&&(identical(other.availableQuantity, availableQuantity) || other.availableQuantity == availableQuantity)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId));
}


@override
int get hashCode => Object.hash(runtimeType,availableQuantity,warehouseId);

@override
String toString() {
  return 'ProductVariantInventory(availableQuantity: $availableQuantity, warehouseId: $warehouseId)';
}


}

/// @nodoc
abstract mixin class _$ProductVariantInventoryCopyWith<$Res> implements $ProductVariantInventoryCopyWith<$Res> {
  factory _$ProductVariantInventoryCopyWith(_ProductVariantInventory value, $Res Function(_ProductVariantInventory) _then) = __$ProductVariantInventoryCopyWithImpl;
@override @useResult
$Res call({
 int availableQuantity, int warehouseId
});




}
/// @nodoc
class __$ProductVariantInventoryCopyWithImpl<$Res>
    implements _$ProductVariantInventoryCopyWith<$Res> {
  __$ProductVariantInventoryCopyWithImpl(this._self, this._then);

  final _ProductVariantInventory _self;
  final $Res Function(_ProductVariantInventory) _then;

/// Create a copy of ProductVariantInventory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableQuantity = null,Object? warehouseId = null,}) {
  return _then(_ProductVariantInventory(
availableQuantity: null == availableQuantity ? _self.availableQuantity : availableQuantity // ignore: cast_nullable_to_non_nullable
as int,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Variant {

 int get productSizeId; int get colorId; String get colorName; String get hex; ProductVariantInventory? get inventory; double get price; String? get sku;
/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariantCopyWith<Variant> get copyWith => _$VariantCopyWithImpl<Variant>(this as Variant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Variant&&(identical(other.productSizeId, productSizeId) || other.productSizeId == productSizeId)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.inventory, inventory) || other.inventory == inventory)&&(identical(other.price, price) || other.price == price)&&(identical(other.sku, sku) || other.sku == sku));
}


@override
int get hashCode => Object.hash(runtimeType,productSizeId,colorId,colorName,hex,inventory,price,sku);

@override
String toString() {
  return 'Variant(productSizeId: $productSizeId, colorId: $colorId, colorName: $colorName, hex: $hex, inventory: $inventory, price: $price, sku: $sku)';
}


}

/// @nodoc
abstract mixin class $VariantCopyWith<$Res>  {
  factory $VariantCopyWith(Variant value, $Res Function(Variant) _then) = _$VariantCopyWithImpl;
@useResult
$Res call({
 int productSizeId, int colorId, String colorName, String hex, ProductVariantInventory? inventory, double price, String? sku
});


$ProductVariantInventoryCopyWith<$Res>? get inventory;

}
/// @nodoc
class _$VariantCopyWithImpl<$Res>
    implements $VariantCopyWith<$Res> {
  _$VariantCopyWithImpl(this._self, this._then);

  final Variant _self;
  final $Res Function(Variant) _then;

/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productSizeId = null,Object? colorId = null,Object? colorName = null,Object? hex = null,Object? inventory = freezed,Object? price = null,Object? sku = freezed,}) {
  return _then(_self.copyWith(
productSizeId: null == productSizeId ? _self.productSizeId : productSizeId // ignore: cast_nullable_to_non_nullable
as int,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as int,colorName: null == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String,hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,inventory: freezed == inventory ? _self.inventory : inventory // ignore: cast_nullable_to_non_nullable
as ProductVariantInventory?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductVariantInventoryCopyWith<$Res>? get inventory {
    if (_self.inventory == null) {
    return null;
  }

  return $ProductVariantInventoryCopyWith<$Res>(_self.inventory!, (value) {
    return _then(_self.copyWith(inventory: value));
  });
}
}


/// Adds pattern-matching-related methods to [Variant].
extension VariantPatterns on Variant {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Variant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Variant() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Variant value)  $default,){
final _that = this;
switch (_that) {
case _Variant():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Variant value)?  $default,){
final _that = this;
switch (_that) {
case _Variant() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int productSizeId,  int colorId,  String colorName,  String hex,  ProductVariantInventory? inventory,  double price,  String? sku)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Variant() when $default != null:
return $default(_that.productSizeId,_that.colorId,_that.colorName,_that.hex,_that.inventory,_that.price,_that.sku);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int productSizeId,  int colorId,  String colorName,  String hex,  ProductVariantInventory? inventory,  double price,  String? sku)  $default,) {final _that = this;
switch (_that) {
case _Variant():
return $default(_that.productSizeId,_that.colorId,_that.colorName,_that.hex,_that.inventory,_that.price,_that.sku);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int productSizeId,  int colorId,  String colorName,  String hex,  ProductVariantInventory? inventory,  double price,  String? sku)?  $default,) {final _that = this;
switch (_that) {
case _Variant() when $default != null:
return $default(_that.productSizeId,_that.colorId,_that.colorName,_that.hex,_that.inventory,_that.price,_that.sku);case _:
  return null;

}
}

}

/// @nodoc


class _Variant implements Variant {
  const _Variant({required this.productSizeId, required this.colorId, required this.colorName, required this.hex, this.inventory, required this.price, this.sku});
  

@override final  int productSizeId;
@override final  int colorId;
@override final  String colorName;
@override final  String hex;
@override final  ProductVariantInventory? inventory;
@override final  double price;
@override final  String? sku;

/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariantCopyWith<_Variant> get copyWith => __$VariantCopyWithImpl<_Variant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Variant&&(identical(other.productSizeId, productSizeId) || other.productSizeId == productSizeId)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.inventory, inventory) || other.inventory == inventory)&&(identical(other.price, price) || other.price == price)&&(identical(other.sku, sku) || other.sku == sku));
}


@override
int get hashCode => Object.hash(runtimeType,productSizeId,colorId,colorName,hex,inventory,price,sku);

@override
String toString() {
  return 'Variant(productSizeId: $productSizeId, colorId: $colorId, colorName: $colorName, hex: $hex, inventory: $inventory, price: $price, sku: $sku)';
}


}

/// @nodoc
abstract mixin class _$VariantCopyWith<$Res> implements $VariantCopyWith<$Res> {
  factory _$VariantCopyWith(_Variant value, $Res Function(_Variant) _then) = __$VariantCopyWithImpl;
@override @useResult
$Res call({
 int productSizeId, int colorId, String colorName, String hex, ProductVariantInventory? inventory, double price, String? sku
});


@override $ProductVariantInventoryCopyWith<$Res>? get inventory;

}
/// @nodoc
class __$VariantCopyWithImpl<$Res>
    implements _$VariantCopyWith<$Res> {
  __$VariantCopyWithImpl(this._self, this._then);

  final _Variant _self;
  final $Res Function(_Variant) _then;

/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productSizeId = null,Object? colorId = null,Object? colorName = null,Object? hex = null,Object? inventory = freezed,Object? price = null,Object? sku = freezed,}) {
  return _then(_Variant(
productSizeId: null == productSizeId ? _self.productSizeId : productSizeId // ignore: cast_nullable_to_non_nullable
as int,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as int,colorName: null == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String,hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,inventory: freezed == inventory ? _self.inventory : inventory // ignore: cast_nullable_to_non_nullable
as ProductVariantInventory?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductVariantInventoryCopyWith<$Res>? get inventory {
    if (_self.inventory == null) {
    return null;
  }

  return $ProductVariantInventoryCopyWith<$Res>(_self.inventory!, (value) {
    return _then(_self.copyWith(inventory: value));
  });
}
}

/// @nodoc
mixin _$Product {

 String get id; String get sku; String get name; double get basePrice; Map<String, List<Variant>> get variants;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&const DeepCollectionEquality().equals(other.variants, variants));
}


@override
int get hashCode => Object.hash(runtimeType,id,sku,name,basePrice,const DeepCollectionEquality().hash(variants));

@override
String toString() {
  return 'Product(id: $id, sku: $sku, name: $name, basePrice: $basePrice, variants: $variants)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String id, String sku, String name, double basePrice, Map<String, List<Variant>> variants
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? basePrice = null,Object? variants = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as Map<String, List<Variant>>,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sku,  String name,  double basePrice,  Map<String, List<Variant>> variants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.basePrice,_that.variants);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sku,  String name,  double basePrice,  Map<String, List<Variant>> variants)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.sku,_that.name,_that.basePrice,_that.variants);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sku,  String name,  double basePrice,  Map<String, List<Variant>> variants)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.basePrice,_that.variants);case _:
  return null;

}
}

}

/// @nodoc


class _Product implements Product {
  const _Product({required this.id, required this.sku, required this.name, required this.basePrice, required final  Map<String, List<Variant>> variants}): _variants = variants;
  

@override final  String id;
@override final  String sku;
@override final  String name;
@override final  double basePrice;
 final  Map<String, List<Variant>> _variants;
@override Map<String, List<Variant>> get variants {
  if (_variants is EqualUnmodifiableMapView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_variants);
}


/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&const DeepCollectionEquality().equals(other._variants, _variants));
}


@override
int get hashCode => Object.hash(runtimeType,id,sku,name,basePrice,const DeepCollectionEquality().hash(_variants));

@override
String toString() {
  return 'Product(id: $id, sku: $sku, name: $name, basePrice: $basePrice, variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String sku, String name, double basePrice, Map<String, List<Variant>> variants
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? basePrice = null,Object? variants = null,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as Map<String, List<Variant>>,
  ));
}


}

// dart format on
