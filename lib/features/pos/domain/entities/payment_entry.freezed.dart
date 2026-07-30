// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentEntry {

 PaymentMethod get method; double get amount;
/// Create a copy of PaymentEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentEntryCopyWith<PaymentEntry> get copyWith => _$PaymentEntryCopyWithImpl<PaymentEntry>(this as PaymentEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentEntry&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,method,amount);

@override
String toString() {
  return 'PaymentEntry(method: $method, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $PaymentEntryCopyWith<$Res>  {
  factory $PaymentEntryCopyWith(PaymentEntry value, $Res Function(PaymentEntry) _then) = _$PaymentEntryCopyWithImpl;
@useResult
$Res call({
 PaymentMethod method, double amount
});




}
/// @nodoc
class _$PaymentEntryCopyWithImpl<$Res>
    implements $PaymentEntryCopyWith<$Res> {
  _$PaymentEntryCopyWithImpl(this._self, this._then);

  final PaymentEntry _self;
  final $Res Function(PaymentEntry) _then;

/// Create a copy of PaymentEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? amount = null,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentEntry].
extension PaymentEntryPatterns on PaymentEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentEntry value)  $default,){
final _that = this;
switch (_that) {
case _PaymentEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentEntry value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaymentMethod method,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentEntry() when $default != null:
return $default(_that.method,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaymentMethod method,  double amount)  $default,) {final _that = this;
switch (_that) {
case _PaymentEntry():
return $default(_that.method,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaymentMethod method,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _PaymentEntry() when $default != null:
return $default(_that.method,_that.amount);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentEntry implements PaymentEntry {
  const _PaymentEntry({required this.method, required this.amount});
  

@override final  PaymentMethod method;
@override final  double amount;

/// Create a copy of PaymentEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentEntryCopyWith<_PaymentEntry> get copyWith => __$PaymentEntryCopyWithImpl<_PaymentEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentEntry&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,method,amount);

@override
String toString() {
  return 'PaymentEntry(method: $method, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$PaymentEntryCopyWith<$Res> implements $PaymentEntryCopyWith<$Res> {
  factory _$PaymentEntryCopyWith(_PaymentEntry value, $Res Function(_PaymentEntry) _then) = __$PaymentEntryCopyWithImpl;
@override @useResult
$Res call({
 PaymentMethod method, double amount
});




}
/// @nodoc
class __$PaymentEntryCopyWithImpl<$Res>
    implements _$PaymentEntryCopyWith<$Res> {
  __$PaymentEntryCopyWithImpl(this._self, this._then);

  final _PaymentEntry _self;
  final $Res Function(_PaymentEntry) _then;

/// Create a copy of PaymentEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? amount = null,}) {
  return _then(_PaymentEntry(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
