// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash_register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CashRegisterState {

 DateTime get selectedDate; CashDailyReport get report; PaymentMethodFilter get paymentFilters; bool get isLoading; String? get errorMessage; String? get toastMessage;
/// Create a copy of CashRegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashRegisterStateCopyWith<CashRegisterState> get copyWith => _$CashRegisterStateCopyWithImpl<CashRegisterState>(this as CashRegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashRegisterState&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.report, report) || other.report == report)&&(identical(other.paymentFilters, paymentFilters) || other.paymentFilters == paymentFilters)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.toastMessage, toastMessage) || other.toastMessage == toastMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDate,report,paymentFilters,isLoading,errorMessage,toastMessage);

@override
String toString() {
  return 'CashRegisterState(selectedDate: $selectedDate, report: $report, paymentFilters: $paymentFilters, isLoading: $isLoading, errorMessage: $errorMessage, toastMessage: $toastMessage)';
}


}

/// @nodoc
abstract mixin class $CashRegisterStateCopyWith<$Res>  {
  factory $CashRegisterStateCopyWith(CashRegisterState value, $Res Function(CashRegisterState) _then) = _$CashRegisterStateCopyWithImpl;
@useResult
$Res call({
 DateTime selectedDate, CashDailyReport report, PaymentMethodFilter paymentFilters, bool isLoading, String? errorMessage, String? toastMessage
});


$CashDailyReportCopyWith<$Res> get report;$PaymentMethodFilterCopyWith<$Res> get paymentFilters;

}
/// @nodoc
class _$CashRegisterStateCopyWithImpl<$Res>
    implements $CashRegisterStateCopyWith<$Res> {
  _$CashRegisterStateCopyWithImpl(this._self, this._then);

  final CashRegisterState _self;
  final $Res Function(CashRegisterState) _then;

/// Create a copy of CashRegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedDate = null,Object? report = null,Object? paymentFilters = null,Object? isLoading = null,Object? errorMessage = freezed,Object? toastMessage = freezed,}) {
  return _then(_self.copyWith(
selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as CashDailyReport,paymentFilters: null == paymentFilters ? _self.paymentFilters : paymentFilters // ignore: cast_nullable_to_non_nullable
as PaymentMethodFilter,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,toastMessage: freezed == toastMessage ? _self.toastMessage : toastMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CashRegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashDailyReportCopyWith<$Res> get report {
  
  return $CashDailyReportCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}/// Create a copy of CashRegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentMethodFilterCopyWith<$Res> get paymentFilters {
  
  return $PaymentMethodFilterCopyWith<$Res>(_self.paymentFilters, (value) {
    return _then(_self.copyWith(paymentFilters: value));
  });
}
}


/// Adds pattern-matching-related methods to [CashRegisterState].
extension CashRegisterStatePatterns on CashRegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashRegisterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashRegisterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashRegisterState value)  $default,){
final _that = this;
switch (_that) {
case _CashRegisterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashRegisterState value)?  $default,){
final _that = this;
switch (_that) {
case _CashRegisterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime selectedDate,  CashDailyReport report,  PaymentMethodFilter paymentFilters,  bool isLoading,  String? errorMessage,  String? toastMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashRegisterState() when $default != null:
return $default(_that.selectedDate,_that.report,_that.paymentFilters,_that.isLoading,_that.errorMessage,_that.toastMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime selectedDate,  CashDailyReport report,  PaymentMethodFilter paymentFilters,  bool isLoading,  String? errorMessage,  String? toastMessage)  $default,) {final _that = this;
switch (_that) {
case _CashRegisterState():
return $default(_that.selectedDate,_that.report,_that.paymentFilters,_that.isLoading,_that.errorMessage,_that.toastMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime selectedDate,  CashDailyReport report,  PaymentMethodFilter paymentFilters,  bool isLoading,  String? errorMessage,  String? toastMessage)?  $default,) {final _that = this;
switch (_that) {
case _CashRegisterState() when $default != null:
return $default(_that.selectedDate,_that.report,_that.paymentFilters,_that.isLoading,_that.errorMessage,_that.toastMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CashRegisterState implements CashRegisterState {
  const _CashRegisterState({required this.selectedDate, this.report = CashDailyReport.empty, this.paymentFilters = const PaymentMethodFilter(), this.isLoading = false, this.errorMessage, this.toastMessage});
  

@override final  DateTime selectedDate;
@override@JsonKey() final  CashDailyReport report;
@override@JsonKey() final  PaymentMethodFilter paymentFilters;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override final  String? toastMessage;

/// Create a copy of CashRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashRegisterStateCopyWith<_CashRegisterState> get copyWith => __$CashRegisterStateCopyWithImpl<_CashRegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashRegisterState&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.report, report) || other.report == report)&&(identical(other.paymentFilters, paymentFilters) || other.paymentFilters == paymentFilters)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.toastMessage, toastMessage) || other.toastMessage == toastMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDate,report,paymentFilters,isLoading,errorMessage,toastMessage);

@override
String toString() {
  return 'CashRegisterState(selectedDate: $selectedDate, report: $report, paymentFilters: $paymentFilters, isLoading: $isLoading, errorMessage: $errorMessage, toastMessage: $toastMessage)';
}


}

/// @nodoc
abstract mixin class _$CashRegisterStateCopyWith<$Res> implements $CashRegisterStateCopyWith<$Res> {
  factory _$CashRegisterStateCopyWith(_CashRegisterState value, $Res Function(_CashRegisterState) _then) = __$CashRegisterStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime selectedDate, CashDailyReport report, PaymentMethodFilter paymentFilters, bool isLoading, String? errorMessage, String? toastMessage
});


@override $CashDailyReportCopyWith<$Res> get report;@override $PaymentMethodFilterCopyWith<$Res> get paymentFilters;

}
/// @nodoc
class __$CashRegisterStateCopyWithImpl<$Res>
    implements _$CashRegisterStateCopyWith<$Res> {
  __$CashRegisterStateCopyWithImpl(this._self, this._then);

  final _CashRegisterState _self;
  final $Res Function(_CashRegisterState) _then;

/// Create a copy of CashRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedDate = null,Object? report = null,Object? paymentFilters = null,Object? isLoading = null,Object? errorMessage = freezed,Object? toastMessage = freezed,}) {
  return _then(_CashRegisterState(
selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as CashDailyReport,paymentFilters: null == paymentFilters ? _self.paymentFilters : paymentFilters // ignore: cast_nullable_to_non_nullable
as PaymentMethodFilter,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,toastMessage: freezed == toastMessage ? _self.toastMessage : toastMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CashRegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashDailyReportCopyWith<$Res> get report {
  
  return $CashDailyReportCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}/// Create a copy of CashRegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentMethodFilterCopyWith<$Res> get paymentFilters {
  
  return $PaymentMethodFilterCopyWith<$Res>(_self.paymentFilters, (value) {
    return _then(_self.copyWith(paymentFilters: value));
  });
}
}

// dart format on
