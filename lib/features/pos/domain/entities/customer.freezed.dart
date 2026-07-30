// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PosCustomer {

 int get id; String get dni; String get name; String? get documentType; String? get documentNumber;
/// Create a copy of PosCustomer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosCustomerCopyWith<PosCustomer> get copyWith => _$PosCustomerCopyWithImpl<PosCustomer>(this as PosCustomer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosCustomer&&(identical(other.id, id) || other.id == id)&&(identical(other.dni, dni) || other.dni == dni)&&(identical(other.name, name) || other.name == name)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.documentNumber, documentNumber) || other.documentNumber == documentNumber));
}


@override
int get hashCode => Object.hash(runtimeType,id,dni,name,documentType,documentNumber);

@override
String toString() {
  return 'PosCustomer(id: $id, dni: $dni, name: $name, documentType: $documentType, documentNumber: $documentNumber)';
}


}

/// @nodoc
abstract mixin class $PosCustomerCopyWith<$Res>  {
  factory $PosCustomerCopyWith(PosCustomer value, $Res Function(PosCustomer) _then) = _$PosCustomerCopyWithImpl;
@useResult
$Res call({
 int id, String dni, String name, String? documentType, String? documentNumber
});




}
/// @nodoc
class _$PosCustomerCopyWithImpl<$Res>
    implements $PosCustomerCopyWith<$Res> {
  _$PosCustomerCopyWithImpl(this._self, this._then);

  final PosCustomer _self;
  final $Res Function(PosCustomer) _then;

/// Create a copy of PosCustomer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dni = null,Object? name = null,Object? documentType = freezed,Object? documentNumber = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dni: null == dni ? _self.dni : dni // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String?,documentNumber: freezed == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PosCustomer].
extension PosCustomerPatterns on PosCustomer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PosCustomer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PosCustomer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PosCustomer value)  $default,){
final _that = this;
switch (_that) {
case _PosCustomer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PosCustomer value)?  $default,){
final _that = this;
switch (_that) {
case _PosCustomer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String dni,  String name,  String? documentType,  String? documentNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosCustomer() when $default != null:
return $default(_that.id,_that.dni,_that.name,_that.documentType,_that.documentNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String dni,  String name,  String? documentType,  String? documentNumber)  $default,) {final _that = this;
switch (_that) {
case _PosCustomer():
return $default(_that.id,_that.dni,_that.name,_that.documentType,_that.documentNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String dni,  String name,  String? documentType,  String? documentNumber)?  $default,) {final _that = this;
switch (_that) {
case _PosCustomer() when $default != null:
return $default(_that.id,_that.dni,_that.name,_that.documentType,_that.documentNumber);case _:
  return null;

}
}

}

/// @nodoc


class _PosCustomer implements PosCustomer {
  const _PosCustomer({required this.id, required this.dni, required this.name, this.documentType, this.documentNumber});
  

@override final  int id;
@override final  String dni;
@override final  String name;
@override final  String? documentType;
@override final  String? documentNumber;

/// Create a copy of PosCustomer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PosCustomerCopyWith<_PosCustomer> get copyWith => __$PosCustomerCopyWithImpl<_PosCustomer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosCustomer&&(identical(other.id, id) || other.id == id)&&(identical(other.dni, dni) || other.dni == dni)&&(identical(other.name, name) || other.name == name)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.documentNumber, documentNumber) || other.documentNumber == documentNumber));
}


@override
int get hashCode => Object.hash(runtimeType,id,dni,name,documentType,documentNumber);

@override
String toString() {
  return 'PosCustomer(id: $id, dni: $dni, name: $name, documentType: $documentType, documentNumber: $documentNumber)';
}


}

/// @nodoc
abstract mixin class _$PosCustomerCopyWith<$Res> implements $PosCustomerCopyWith<$Res> {
  factory _$PosCustomerCopyWith(_PosCustomer value, $Res Function(_PosCustomer) _then) = __$PosCustomerCopyWithImpl;
@override @useResult
$Res call({
 int id, String dni, String name, String? documentType, String? documentNumber
});




}
/// @nodoc
class __$PosCustomerCopyWithImpl<$Res>
    implements _$PosCustomerCopyWith<$Res> {
  __$PosCustomerCopyWithImpl(this._self, this._then);

  final _PosCustomer _self;
  final $Res Function(_PosCustomer) _then;

/// Create a copy of PosCustomer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dni = null,Object? name = null,Object? documentType = freezed,Object? documentNumber = freezed,}) {
  return _then(_PosCustomer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dni: null == dni ? _self.dni : dni // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String?,documentNumber: freezed == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
