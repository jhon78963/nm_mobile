// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectorModalState {

 bool get isOpen; Product? get product; bool get isEditing; CartItem? get editingCartItem;
/// Create a copy of SelectorModalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectorModalStateCopyWith<SelectorModalState> get copyWith => _$SelectorModalStateCopyWithImpl<SelectorModalState>(this as SelectorModalState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectorModalState&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.product, product) || other.product == product)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.editingCartItem, editingCartItem) || other.editingCartItem == editingCartItem));
}


@override
int get hashCode => Object.hash(runtimeType,isOpen,product,isEditing,editingCartItem);

@override
String toString() {
  return 'SelectorModalState(isOpen: $isOpen, product: $product, isEditing: $isEditing, editingCartItem: $editingCartItem)';
}


}

/// @nodoc
abstract mixin class $SelectorModalStateCopyWith<$Res>  {
  factory $SelectorModalStateCopyWith(SelectorModalState value, $Res Function(SelectorModalState) _then) = _$SelectorModalStateCopyWithImpl;
@useResult
$Res call({
 bool isOpen, Product? product, bool isEditing, CartItem? editingCartItem
});


$ProductCopyWith<$Res>? get product;$CartItemCopyWith<$Res>? get editingCartItem;

}
/// @nodoc
class _$SelectorModalStateCopyWithImpl<$Res>
    implements $SelectorModalStateCopyWith<$Res> {
  _$SelectorModalStateCopyWithImpl(this._self, this._then);

  final SelectorModalState _self;
  final $Res Function(SelectorModalState) _then;

/// Create a copy of SelectorModalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isOpen = null,Object? product = freezed,Object? isEditing = null,Object? editingCartItem = freezed,}) {
  return _then(_self.copyWith(
isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product?,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,editingCartItem: freezed == editingCartItem ? _self.editingCartItem : editingCartItem // ignore: cast_nullable_to_non_nullable
as CartItem?,
  ));
}
/// Create a copy of SelectorModalState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of SelectorModalState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartItemCopyWith<$Res>? get editingCartItem {
    if (_self.editingCartItem == null) {
    return null;
  }

  return $CartItemCopyWith<$Res>(_self.editingCartItem!, (value) {
    return _then(_self.copyWith(editingCartItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [SelectorModalState].
extension SelectorModalStatePatterns on SelectorModalState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectorModalState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectorModalState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectorModalState value)  $default,){
final _that = this;
switch (_that) {
case _SelectorModalState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectorModalState value)?  $default,){
final _that = this;
switch (_that) {
case _SelectorModalState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isOpen,  Product? product,  bool isEditing,  CartItem? editingCartItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectorModalState() when $default != null:
return $default(_that.isOpen,_that.product,_that.isEditing,_that.editingCartItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isOpen,  Product? product,  bool isEditing,  CartItem? editingCartItem)  $default,) {final _that = this;
switch (_that) {
case _SelectorModalState():
return $default(_that.isOpen,_that.product,_that.isEditing,_that.editingCartItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isOpen,  Product? product,  bool isEditing,  CartItem? editingCartItem)?  $default,) {final _that = this;
switch (_that) {
case _SelectorModalState() when $default != null:
return $default(_that.isOpen,_that.product,_that.isEditing,_that.editingCartItem);case _:
  return null;

}
}

}

/// @nodoc


class _SelectorModalState implements SelectorModalState {
  const _SelectorModalState({this.isOpen = false, this.product, this.isEditing = false, this.editingCartItem});
  

@override@JsonKey() final  bool isOpen;
@override final  Product? product;
@override@JsonKey() final  bool isEditing;
@override final  CartItem? editingCartItem;

/// Create a copy of SelectorModalState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectorModalStateCopyWith<_SelectorModalState> get copyWith => __$SelectorModalStateCopyWithImpl<_SelectorModalState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectorModalState&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.product, product) || other.product == product)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.editingCartItem, editingCartItem) || other.editingCartItem == editingCartItem));
}


@override
int get hashCode => Object.hash(runtimeType,isOpen,product,isEditing,editingCartItem);

@override
String toString() {
  return 'SelectorModalState(isOpen: $isOpen, product: $product, isEditing: $isEditing, editingCartItem: $editingCartItem)';
}


}

/// @nodoc
abstract mixin class _$SelectorModalStateCopyWith<$Res> implements $SelectorModalStateCopyWith<$Res> {
  factory _$SelectorModalStateCopyWith(_SelectorModalState value, $Res Function(_SelectorModalState) _then) = __$SelectorModalStateCopyWithImpl;
@override @useResult
$Res call({
 bool isOpen, Product? product, bool isEditing, CartItem? editingCartItem
});


@override $ProductCopyWith<$Res>? get product;@override $CartItemCopyWith<$Res>? get editingCartItem;

}
/// @nodoc
class __$SelectorModalStateCopyWithImpl<$Res>
    implements _$SelectorModalStateCopyWith<$Res> {
  __$SelectorModalStateCopyWithImpl(this._self, this._then);

  final _SelectorModalState _self;
  final $Res Function(_SelectorModalState) _then;

/// Create a copy of SelectorModalState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isOpen = null,Object? product = freezed,Object? isEditing = null,Object? editingCartItem = freezed,}) {
  return _then(_SelectorModalState(
isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product?,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,editingCartItem: freezed == editingCartItem ? _self.editingCartItem : editingCartItem // ignore: cast_nullable_to_non_nullable
as CartItem?,
  ));
}

/// Create a copy of SelectorModalState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of SelectorModalState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartItemCopyWith<$Res>? get editingCartItem {
    if (_self.editingCartItem == null) {
    return null;
  }

  return $CartItemCopyWith<$Res>(_self.editingCartItem!, (value) {
    return _then(_self.copyWith(editingCartItem: value));
  });
}
}

/// @nodoc
mixin _$PosState {

 List<CartItem> get cart; PosCustomer? get customer; DocumentType get documentType; bool get isLoading; String? get toastMessage; int? get lastSaleId; SelectorModalState get selectorModal;
/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosStateCopyWith<PosState> get copyWith => _$PosStateCopyWithImpl<PosState>(this as PosState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosState&&const DeepCollectionEquality().equals(other.cart, cart)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.toastMessage, toastMessage) || other.toastMessage == toastMessage)&&(identical(other.lastSaleId, lastSaleId) || other.lastSaleId == lastSaleId)&&(identical(other.selectorModal, selectorModal) || other.selectorModal == selectorModal));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cart),customer,documentType,isLoading,toastMessage,lastSaleId,selectorModal);

@override
String toString() {
  return 'PosState(cart: $cart, customer: $customer, documentType: $documentType, isLoading: $isLoading, toastMessage: $toastMessage, lastSaleId: $lastSaleId, selectorModal: $selectorModal)';
}


}

/// @nodoc
abstract mixin class $PosStateCopyWith<$Res>  {
  factory $PosStateCopyWith(PosState value, $Res Function(PosState) _then) = _$PosStateCopyWithImpl;
@useResult
$Res call({
 List<CartItem> cart, PosCustomer? customer, DocumentType documentType, bool isLoading, String? toastMessage, int? lastSaleId, SelectorModalState selectorModal
});


$PosCustomerCopyWith<$Res>? get customer;$SelectorModalStateCopyWith<$Res> get selectorModal;

}
/// @nodoc
class _$PosStateCopyWithImpl<$Res>
    implements $PosStateCopyWith<$Res> {
  _$PosStateCopyWithImpl(this._self, this._then);

  final PosState _self;
  final $Res Function(PosState) _then;

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cart = null,Object? customer = freezed,Object? documentType = null,Object? isLoading = null,Object? toastMessage = freezed,Object? lastSaleId = freezed,Object? selectorModal = null,}) {
  return _then(_self.copyWith(
cart: null == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as List<CartItem>,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as PosCustomer?,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,toastMessage: freezed == toastMessage ? _self.toastMessage : toastMessage // ignore: cast_nullable_to_non_nullable
as String?,lastSaleId: freezed == lastSaleId ? _self.lastSaleId : lastSaleId // ignore: cast_nullable_to_non_nullable
as int?,selectorModal: null == selectorModal ? _self.selectorModal : selectorModal // ignore: cast_nullable_to_non_nullable
as SelectorModalState,
  ));
}
/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PosCustomerCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $PosCustomerCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectorModalStateCopyWith<$Res> get selectorModal {
  
  return $SelectorModalStateCopyWith<$Res>(_self.selectorModal, (value) {
    return _then(_self.copyWith(selectorModal: value));
  });
}
}


/// Adds pattern-matching-related methods to [PosState].
extension PosStatePatterns on PosState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PosState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PosState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PosState value)  $default,){
final _that = this;
switch (_that) {
case _PosState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PosState value)?  $default,){
final _that = this;
switch (_that) {
case _PosState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CartItem> cart,  PosCustomer? customer,  DocumentType documentType,  bool isLoading,  String? toastMessage,  int? lastSaleId,  SelectorModalState selectorModal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosState() when $default != null:
return $default(_that.cart,_that.customer,_that.documentType,_that.isLoading,_that.toastMessage,_that.lastSaleId,_that.selectorModal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CartItem> cart,  PosCustomer? customer,  DocumentType documentType,  bool isLoading,  String? toastMessage,  int? lastSaleId,  SelectorModalState selectorModal)  $default,) {final _that = this;
switch (_that) {
case _PosState():
return $default(_that.cart,_that.customer,_that.documentType,_that.isLoading,_that.toastMessage,_that.lastSaleId,_that.selectorModal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CartItem> cart,  PosCustomer? customer,  DocumentType documentType,  bool isLoading,  String? toastMessage,  int? lastSaleId,  SelectorModalState selectorModal)?  $default,) {final _that = this;
switch (_that) {
case _PosState() when $default != null:
return $default(_that.cart,_that.customer,_that.documentType,_that.isLoading,_that.toastMessage,_that.lastSaleId,_that.selectorModal);case _:
  return null;

}
}

}

/// @nodoc


class _PosState extends PosState {
  const _PosState({final  List<CartItem> cart = const [], this.customer, this.documentType = DocumentType.ticketInterno, this.isLoading = false, this.toastMessage, this.lastSaleId, this.selectorModal = const SelectorModalState()}): _cart = cart,super._();
  

 final  List<CartItem> _cart;
@override@JsonKey() List<CartItem> get cart {
  if (_cart is EqualUnmodifiableListView) return _cart;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cart);
}

@override final  PosCustomer? customer;
@override@JsonKey() final  DocumentType documentType;
@override@JsonKey() final  bool isLoading;
@override final  String? toastMessage;
@override final  int? lastSaleId;
@override@JsonKey() final  SelectorModalState selectorModal;

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PosStateCopyWith<_PosState> get copyWith => __$PosStateCopyWithImpl<_PosState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosState&&const DeepCollectionEquality().equals(other._cart, _cart)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.toastMessage, toastMessage) || other.toastMessage == toastMessage)&&(identical(other.lastSaleId, lastSaleId) || other.lastSaleId == lastSaleId)&&(identical(other.selectorModal, selectorModal) || other.selectorModal == selectorModal));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cart),customer,documentType,isLoading,toastMessage,lastSaleId,selectorModal);

@override
String toString() {
  return 'PosState(cart: $cart, customer: $customer, documentType: $documentType, isLoading: $isLoading, toastMessage: $toastMessage, lastSaleId: $lastSaleId, selectorModal: $selectorModal)';
}


}

/// @nodoc
abstract mixin class _$PosStateCopyWith<$Res> implements $PosStateCopyWith<$Res> {
  factory _$PosStateCopyWith(_PosState value, $Res Function(_PosState) _then) = __$PosStateCopyWithImpl;
@override @useResult
$Res call({
 List<CartItem> cart, PosCustomer? customer, DocumentType documentType, bool isLoading, String? toastMessage, int? lastSaleId, SelectorModalState selectorModal
});


@override $PosCustomerCopyWith<$Res>? get customer;@override $SelectorModalStateCopyWith<$Res> get selectorModal;

}
/// @nodoc
class __$PosStateCopyWithImpl<$Res>
    implements _$PosStateCopyWith<$Res> {
  __$PosStateCopyWithImpl(this._self, this._then);

  final _PosState _self;
  final $Res Function(_PosState) _then;

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cart = null,Object? customer = freezed,Object? documentType = null,Object? isLoading = null,Object? toastMessage = freezed,Object? lastSaleId = freezed,Object? selectorModal = null,}) {
  return _then(_PosState(
cart: null == cart ? _self._cart : cart // ignore: cast_nullable_to_non_nullable
as List<CartItem>,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as PosCustomer?,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,toastMessage: freezed == toastMessage ? _self.toastMessage : toastMessage // ignore: cast_nullable_to_non_nullable
as String?,lastSaleId: freezed == lastSaleId ? _self.lastSaleId : lastSaleId // ignore: cast_nullable_to_non_nullable
as int?,selectorModal: null == selectorModal ? _self.selectorModal : selectorModal // ignore: cast_nullable_to_non_nullable
as SelectorModalState,
  ));
}

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PosCustomerCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $PosCustomerCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectorModalStateCopyWith<$Res> get selectorModal {
  
  return $SelectorModalStateCopyWith<$Res>(_self.selectorModal, (value) {
    return _then(_self.copyWith(selectorModal: value));
  });
}
}

// dart format on
