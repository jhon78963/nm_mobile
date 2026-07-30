// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash_movement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CashMovementItem {

 int get id; String get time; String get description; String get method; double get amount; String? get date; CashPaymentMethod? get paymentMethod;
/// Create a copy of CashMovementItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashMovementItemCopyWith<CashMovementItem> get copyWith => _$CashMovementItemCopyWithImpl<CashMovementItem>(this as CashMovementItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashMovementItem&&(identical(other.id, id) || other.id == id)&&(identical(other.time, time) || other.time == time)&&(identical(other.description, description) || other.description == description)&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}


@override
int get hashCode => Object.hash(runtimeType,id,time,description,method,amount,date,paymentMethod);

@override
String toString() {
  return 'CashMovementItem(id: $id, time: $time, description: $description, method: $method, amount: $amount, date: $date, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class $CashMovementItemCopyWith<$Res>  {
  factory $CashMovementItemCopyWith(CashMovementItem value, $Res Function(CashMovementItem) _then) = _$CashMovementItemCopyWithImpl;
@useResult
$Res call({
 int id, String time, String description, String method, double amount, String? date, CashPaymentMethod? paymentMethod
});




}
/// @nodoc
class _$CashMovementItemCopyWithImpl<$Res>
    implements $CashMovementItemCopyWith<$Res> {
  _$CashMovementItemCopyWithImpl(this._self, this._then);

  final CashMovementItem _self;
  final $Res Function(CashMovementItem) _then;

/// Create a copy of CashMovementItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? time = null,Object? description = null,Object? method = null,Object? amount = null,Object? date = freezed,Object? paymentMethod = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as CashPaymentMethod?,
  ));
}

}


/// Adds pattern-matching-related methods to [CashMovementItem].
extension CashMovementItemPatterns on CashMovementItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashMovementItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashMovementItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashMovementItem value)  $default,){
final _that = this;
switch (_that) {
case _CashMovementItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashMovementItem value)?  $default,){
final _that = this;
switch (_that) {
case _CashMovementItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String time,  String description,  String method,  double amount,  String? date,  CashPaymentMethod? paymentMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashMovementItem() when $default != null:
return $default(_that.id,_that.time,_that.description,_that.method,_that.amount,_that.date,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String time,  String description,  String method,  double amount,  String? date,  CashPaymentMethod? paymentMethod)  $default,) {final _that = this;
switch (_that) {
case _CashMovementItem():
return $default(_that.id,_that.time,_that.description,_that.method,_that.amount,_that.date,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String time,  String description,  String method,  double amount,  String? date,  CashPaymentMethod? paymentMethod)?  $default,) {final _that = this;
switch (_that) {
case _CashMovementItem() when $default != null:
return $default(_that.id,_that.time,_that.description,_that.method,_that.amount,_that.date,_that.paymentMethod);case _:
  return null;

}
}

}

/// @nodoc


class _CashMovementItem implements CashMovementItem {
  const _CashMovementItem({required this.id, required this.time, required this.description, required this.method, required this.amount, this.date, this.paymentMethod});
  

@override final  int id;
@override final  String time;
@override final  String description;
@override final  String method;
@override final  double amount;
@override final  String? date;
@override final  CashPaymentMethod? paymentMethod;

/// Create a copy of CashMovementItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashMovementItemCopyWith<_CashMovementItem> get copyWith => __$CashMovementItemCopyWithImpl<_CashMovementItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashMovementItem&&(identical(other.id, id) || other.id == id)&&(identical(other.time, time) || other.time == time)&&(identical(other.description, description) || other.description == description)&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}


@override
int get hashCode => Object.hash(runtimeType,id,time,description,method,amount,date,paymentMethod);

@override
String toString() {
  return 'CashMovementItem(id: $id, time: $time, description: $description, method: $method, amount: $amount, date: $date, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class _$CashMovementItemCopyWith<$Res> implements $CashMovementItemCopyWith<$Res> {
  factory _$CashMovementItemCopyWith(_CashMovementItem value, $Res Function(_CashMovementItem) _then) = __$CashMovementItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String time, String description, String method, double amount, String? date, CashPaymentMethod? paymentMethod
});




}
/// @nodoc
class __$CashMovementItemCopyWithImpl<$Res>
    implements _$CashMovementItemCopyWith<$Res> {
  __$CashMovementItemCopyWithImpl(this._self, this._then);

  final _CashMovementItem _self;
  final $Res Function(_CashMovementItem) _then;

/// Create a copy of CashMovementItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? time = null,Object? description = null,Object? method = null,Object? amount = null,Object? date = freezed,Object? paymentMethod = freezed,}) {
  return _then(_CashMovementItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as CashPaymentMethod?,
  ));
}


}

/// @nodoc
mixin _$CashDailySummary {

 double get openingBalance; double get finalBalance; double get totalSales; double get totalIncomes; double get totalExpenses;
/// Create a copy of CashDailySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashDailySummaryCopyWith<CashDailySummary> get copyWith => _$CashDailySummaryCopyWithImpl<CashDailySummary>(this as CashDailySummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashDailySummary&&(identical(other.openingBalance, openingBalance) || other.openingBalance == openingBalance)&&(identical(other.finalBalance, finalBalance) || other.finalBalance == finalBalance)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalIncomes, totalIncomes) || other.totalIncomes == totalIncomes)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses));
}


@override
int get hashCode => Object.hash(runtimeType,openingBalance,finalBalance,totalSales,totalIncomes,totalExpenses);

@override
String toString() {
  return 'CashDailySummary(openingBalance: $openingBalance, finalBalance: $finalBalance, totalSales: $totalSales, totalIncomes: $totalIncomes, totalExpenses: $totalExpenses)';
}


}

/// @nodoc
abstract mixin class $CashDailySummaryCopyWith<$Res>  {
  factory $CashDailySummaryCopyWith(CashDailySummary value, $Res Function(CashDailySummary) _then) = _$CashDailySummaryCopyWithImpl;
@useResult
$Res call({
 double openingBalance, double finalBalance, double totalSales, double totalIncomes, double totalExpenses
});




}
/// @nodoc
class _$CashDailySummaryCopyWithImpl<$Res>
    implements $CashDailySummaryCopyWith<$Res> {
  _$CashDailySummaryCopyWithImpl(this._self, this._then);

  final CashDailySummary _self;
  final $Res Function(CashDailySummary) _then;

/// Create a copy of CashDailySummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? openingBalance = null,Object? finalBalance = null,Object? totalSales = null,Object? totalIncomes = null,Object? totalExpenses = null,}) {
  return _then(_self.copyWith(
openingBalance: null == openingBalance ? _self.openingBalance : openingBalance // ignore: cast_nullable_to_non_nullable
as double,finalBalance: null == finalBalance ? _self.finalBalance : finalBalance // ignore: cast_nullable_to_non_nullable
as double,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalIncomes: null == totalIncomes ? _self.totalIncomes : totalIncomes // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CashDailySummary].
extension CashDailySummaryPatterns on CashDailySummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashDailySummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashDailySummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashDailySummary value)  $default,){
final _that = this;
switch (_that) {
case _CashDailySummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashDailySummary value)?  $default,){
final _that = this;
switch (_that) {
case _CashDailySummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double openingBalance,  double finalBalance,  double totalSales,  double totalIncomes,  double totalExpenses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashDailySummary() when $default != null:
return $default(_that.openingBalance,_that.finalBalance,_that.totalSales,_that.totalIncomes,_that.totalExpenses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double openingBalance,  double finalBalance,  double totalSales,  double totalIncomes,  double totalExpenses)  $default,) {final _that = this;
switch (_that) {
case _CashDailySummary():
return $default(_that.openingBalance,_that.finalBalance,_that.totalSales,_that.totalIncomes,_that.totalExpenses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double openingBalance,  double finalBalance,  double totalSales,  double totalIncomes,  double totalExpenses)?  $default,) {final _that = this;
switch (_that) {
case _CashDailySummary() when $default != null:
return $default(_that.openingBalance,_that.finalBalance,_that.totalSales,_that.totalIncomes,_that.totalExpenses);case _:
  return null;

}
}

}

/// @nodoc


class _CashDailySummary implements CashDailySummary {
  const _CashDailySummary({this.openingBalance = 0, this.finalBalance = 0, this.totalSales = 0, this.totalIncomes = 0, this.totalExpenses = 0});
  

@override@JsonKey() final  double openingBalance;
@override@JsonKey() final  double finalBalance;
@override@JsonKey() final  double totalSales;
@override@JsonKey() final  double totalIncomes;
@override@JsonKey() final  double totalExpenses;

/// Create a copy of CashDailySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashDailySummaryCopyWith<_CashDailySummary> get copyWith => __$CashDailySummaryCopyWithImpl<_CashDailySummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashDailySummary&&(identical(other.openingBalance, openingBalance) || other.openingBalance == openingBalance)&&(identical(other.finalBalance, finalBalance) || other.finalBalance == finalBalance)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalIncomes, totalIncomes) || other.totalIncomes == totalIncomes)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses));
}


@override
int get hashCode => Object.hash(runtimeType,openingBalance,finalBalance,totalSales,totalIncomes,totalExpenses);

@override
String toString() {
  return 'CashDailySummary(openingBalance: $openingBalance, finalBalance: $finalBalance, totalSales: $totalSales, totalIncomes: $totalIncomes, totalExpenses: $totalExpenses)';
}


}

/// @nodoc
abstract mixin class _$CashDailySummaryCopyWith<$Res> implements $CashDailySummaryCopyWith<$Res> {
  factory _$CashDailySummaryCopyWith(_CashDailySummary value, $Res Function(_CashDailySummary) _then) = __$CashDailySummaryCopyWithImpl;
@override @useResult
$Res call({
 double openingBalance, double finalBalance, double totalSales, double totalIncomes, double totalExpenses
});




}
/// @nodoc
class __$CashDailySummaryCopyWithImpl<$Res>
    implements _$CashDailySummaryCopyWith<$Res> {
  __$CashDailySummaryCopyWithImpl(this._self, this._then);

  final _CashDailySummary _self;
  final $Res Function(_CashDailySummary) _then;

/// Create a copy of CashDailySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? openingBalance = null,Object? finalBalance = null,Object? totalSales = null,Object? totalIncomes = null,Object? totalExpenses = null,}) {
  return _then(_CashDailySummary(
openingBalance: null == openingBalance ? _self.openingBalance : openingBalance // ignore: cast_nullable_to_non_nullable
as double,finalBalance: null == finalBalance ? _self.finalBalance : finalBalance // ignore: cast_nullable_to_non_nullable
as double,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalIncomes: null == totalIncomes ? _self.totalIncomes : totalIncomes // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$CashDailyLists {

 List<CashMovementItem> get sales; List<CashMovementItem> get incomes; List<CashMovementItem> get expenses;
/// Create a copy of CashDailyLists
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashDailyListsCopyWith<CashDailyLists> get copyWith => _$CashDailyListsCopyWithImpl<CashDailyLists>(this as CashDailyLists, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashDailyLists&&const DeepCollectionEquality().equals(other.sales, sales)&&const DeepCollectionEquality().equals(other.incomes, incomes)&&const DeepCollectionEquality().equals(other.expenses, expenses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sales),const DeepCollectionEquality().hash(incomes),const DeepCollectionEquality().hash(expenses));

@override
String toString() {
  return 'CashDailyLists(sales: $sales, incomes: $incomes, expenses: $expenses)';
}


}

/// @nodoc
abstract mixin class $CashDailyListsCopyWith<$Res>  {
  factory $CashDailyListsCopyWith(CashDailyLists value, $Res Function(CashDailyLists) _then) = _$CashDailyListsCopyWithImpl;
@useResult
$Res call({
 List<CashMovementItem> sales, List<CashMovementItem> incomes, List<CashMovementItem> expenses
});




}
/// @nodoc
class _$CashDailyListsCopyWithImpl<$Res>
    implements $CashDailyListsCopyWith<$Res> {
  _$CashDailyListsCopyWithImpl(this._self, this._then);

  final CashDailyLists _self;
  final $Res Function(CashDailyLists) _then;

/// Create a copy of CashDailyLists
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sales = null,Object? incomes = null,Object? expenses = null,}) {
  return _then(_self.copyWith(
sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as List<CashMovementItem>,incomes: null == incomes ? _self.incomes : incomes // ignore: cast_nullable_to_non_nullable
as List<CashMovementItem>,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<CashMovementItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [CashDailyLists].
extension CashDailyListsPatterns on CashDailyLists {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashDailyLists value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashDailyLists() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashDailyLists value)  $default,){
final _that = this;
switch (_that) {
case _CashDailyLists():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashDailyLists value)?  $default,){
final _that = this;
switch (_that) {
case _CashDailyLists() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CashMovementItem> sales,  List<CashMovementItem> incomes,  List<CashMovementItem> expenses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashDailyLists() when $default != null:
return $default(_that.sales,_that.incomes,_that.expenses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CashMovementItem> sales,  List<CashMovementItem> incomes,  List<CashMovementItem> expenses)  $default,) {final _that = this;
switch (_that) {
case _CashDailyLists():
return $default(_that.sales,_that.incomes,_that.expenses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CashMovementItem> sales,  List<CashMovementItem> incomes,  List<CashMovementItem> expenses)?  $default,) {final _that = this;
switch (_that) {
case _CashDailyLists() when $default != null:
return $default(_that.sales,_that.incomes,_that.expenses);case _:
  return null;

}
}

}

/// @nodoc


class _CashDailyLists implements CashDailyLists {
  const _CashDailyLists({final  List<CashMovementItem> sales = const [], final  List<CashMovementItem> incomes = const [], final  List<CashMovementItem> expenses = const []}): _sales = sales,_incomes = incomes,_expenses = expenses;
  

 final  List<CashMovementItem> _sales;
@override@JsonKey() List<CashMovementItem> get sales {
  if (_sales is EqualUnmodifiableListView) return _sales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sales);
}

 final  List<CashMovementItem> _incomes;
@override@JsonKey() List<CashMovementItem> get incomes {
  if (_incomes is EqualUnmodifiableListView) return _incomes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incomes);
}

 final  List<CashMovementItem> _expenses;
@override@JsonKey() List<CashMovementItem> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}


/// Create a copy of CashDailyLists
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashDailyListsCopyWith<_CashDailyLists> get copyWith => __$CashDailyListsCopyWithImpl<_CashDailyLists>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashDailyLists&&const DeepCollectionEquality().equals(other._sales, _sales)&&const DeepCollectionEquality().equals(other._incomes, _incomes)&&const DeepCollectionEquality().equals(other._expenses, _expenses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sales),const DeepCollectionEquality().hash(_incomes),const DeepCollectionEquality().hash(_expenses));

@override
String toString() {
  return 'CashDailyLists(sales: $sales, incomes: $incomes, expenses: $expenses)';
}


}

/// @nodoc
abstract mixin class _$CashDailyListsCopyWith<$Res> implements $CashDailyListsCopyWith<$Res> {
  factory _$CashDailyListsCopyWith(_CashDailyLists value, $Res Function(_CashDailyLists) _then) = __$CashDailyListsCopyWithImpl;
@override @useResult
$Res call({
 List<CashMovementItem> sales, List<CashMovementItem> incomes, List<CashMovementItem> expenses
});




}
/// @nodoc
class __$CashDailyListsCopyWithImpl<$Res>
    implements _$CashDailyListsCopyWith<$Res> {
  __$CashDailyListsCopyWithImpl(this._self, this._then);

  final _CashDailyLists _self;
  final $Res Function(_CashDailyLists) _then;

/// Create a copy of CashDailyLists
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sales = null,Object? incomes = null,Object? expenses = null,}) {
  return _then(_CashDailyLists(
sales: null == sales ? _self._sales : sales // ignore: cast_nullable_to_non_nullable
as List<CashMovementItem>,incomes: null == incomes ? _self._incomes : incomes // ignore: cast_nullable_to_non_nullable
as List<CashMovementItem>,expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<CashMovementItem>,
  ));
}


}

/// @nodoc
mixin _$CashDailyReport {

 CashDailyLists get lists; CashDailySummary get summary;
/// Create a copy of CashDailyReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashDailyReportCopyWith<CashDailyReport> get copyWith => _$CashDailyReportCopyWithImpl<CashDailyReport>(this as CashDailyReport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashDailyReport&&(identical(other.lists, lists) || other.lists == lists)&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode => Object.hash(runtimeType,lists,summary);

@override
String toString() {
  return 'CashDailyReport(lists: $lists, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $CashDailyReportCopyWith<$Res>  {
  factory $CashDailyReportCopyWith(CashDailyReport value, $Res Function(CashDailyReport) _then) = _$CashDailyReportCopyWithImpl;
@useResult
$Res call({
 CashDailyLists lists, CashDailySummary summary
});


$CashDailyListsCopyWith<$Res> get lists;$CashDailySummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$CashDailyReportCopyWithImpl<$Res>
    implements $CashDailyReportCopyWith<$Res> {
  _$CashDailyReportCopyWithImpl(this._self, this._then);

  final CashDailyReport _self;
  final $Res Function(CashDailyReport) _then;

/// Create a copy of CashDailyReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lists = null,Object? summary = null,}) {
  return _then(_self.copyWith(
lists: null == lists ? _self.lists : lists // ignore: cast_nullable_to_non_nullable
as CashDailyLists,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as CashDailySummary,
  ));
}
/// Create a copy of CashDailyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashDailyListsCopyWith<$Res> get lists {
  
  return $CashDailyListsCopyWith<$Res>(_self.lists, (value) {
    return _then(_self.copyWith(lists: value));
  });
}/// Create a copy of CashDailyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashDailySummaryCopyWith<$Res> get summary {
  
  return $CashDailySummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [CashDailyReport].
extension CashDailyReportPatterns on CashDailyReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashDailyReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashDailyReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashDailyReport value)  $default,){
final _that = this;
switch (_that) {
case _CashDailyReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashDailyReport value)?  $default,){
final _that = this;
switch (_that) {
case _CashDailyReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CashDailyLists lists,  CashDailySummary summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashDailyReport() when $default != null:
return $default(_that.lists,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CashDailyLists lists,  CashDailySummary summary)  $default,) {final _that = this;
switch (_that) {
case _CashDailyReport():
return $default(_that.lists,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CashDailyLists lists,  CashDailySummary summary)?  $default,) {final _that = this;
switch (_that) {
case _CashDailyReport() when $default != null:
return $default(_that.lists,_that.summary);case _:
  return null;

}
}

}

/// @nodoc


class _CashDailyReport implements CashDailyReport {
  const _CashDailyReport({required this.lists, required this.summary});
  

@override final  CashDailyLists lists;
@override final  CashDailySummary summary;

/// Create a copy of CashDailyReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashDailyReportCopyWith<_CashDailyReport> get copyWith => __$CashDailyReportCopyWithImpl<_CashDailyReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashDailyReport&&(identical(other.lists, lists) || other.lists == lists)&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode => Object.hash(runtimeType,lists,summary);

@override
String toString() {
  return 'CashDailyReport(lists: $lists, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$CashDailyReportCopyWith<$Res> implements $CashDailyReportCopyWith<$Res> {
  factory _$CashDailyReportCopyWith(_CashDailyReport value, $Res Function(_CashDailyReport) _then) = __$CashDailyReportCopyWithImpl;
@override @useResult
$Res call({
 CashDailyLists lists, CashDailySummary summary
});


@override $CashDailyListsCopyWith<$Res> get lists;@override $CashDailySummaryCopyWith<$Res> get summary;

}
/// @nodoc
class __$CashDailyReportCopyWithImpl<$Res>
    implements _$CashDailyReportCopyWith<$Res> {
  __$CashDailyReportCopyWithImpl(this._self, this._then);

  final _CashDailyReport _self;
  final $Res Function(_CashDailyReport) _then;

/// Create a copy of CashDailyReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lists = null,Object? summary = null,}) {
  return _then(_CashDailyReport(
lists: null == lists ? _self.lists : lists // ignore: cast_nullable_to_non_nullable
as CashDailyLists,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as CashDailySummary,
  ));
}

/// Create a copy of CashDailyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashDailyListsCopyWith<$Res> get lists {
  
  return $CashDailyListsCopyWith<$Res>(_self.lists, (value) {
    return _then(_self.copyWith(lists: value));
  });
}/// Create a copy of CashDailyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashDailySummaryCopyWith<$Res> get summary {
  
  return $CashDailySummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

/// @nodoc
mixin _$MovementPayload {

 MovementType get type; MovementCategory get category; double get amount; String get description; String get date; CashPaymentMethod get paymentMethod;
/// Create a copy of MovementPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovementPayloadCopyWith<MovementPayload> get copyWith => _$MovementPayloadCopyWithImpl<MovementPayload>(this as MovementPayload, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovementPayload&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}


@override
int get hashCode => Object.hash(runtimeType,type,category,amount,description,date,paymentMethod);

@override
String toString() {
  return 'MovementPayload(type: $type, category: $category, amount: $amount, description: $description, date: $date, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class $MovementPayloadCopyWith<$Res>  {
  factory $MovementPayloadCopyWith(MovementPayload value, $Res Function(MovementPayload) _then) = _$MovementPayloadCopyWithImpl;
@useResult
$Res call({
 MovementType type, MovementCategory category, double amount, String description, String date, CashPaymentMethod paymentMethod
});




}
/// @nodoc
class _$MovementPayloadCopyWithImpl<$Res>
    implements $MovementPayloadCopyWith<$Res> {
  _$MovementPayloadCopyWithImpl(this._self, this._then);

  final MovementPayload _self;
  final $Res Function(MovementPayload) _then;

/// Create a copy of MovementPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? category = null,Object? amount = null,Object? description = null,Object? date = null,Object? paymentMethod = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MovementType,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as MovementCategory,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as CashPaymentMethod,
  ));
}

}


/// Adds pattern-matching-related methods to [MovementPayload].
extension MovementPayloadPatterns on MovementPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovementPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovementPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovementPayload value)  $default,){
final _that = this;
switch (_that) {
case _MovementPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovementPayload value)?  $default,){
final _that = this;
switch (_that) {
case _MovementPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MovementType type,  MovementCategory category,  double amount,  String description,  String date,  CashPaymentMethod paymentMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovementPayload() when $default != null:
return $default(_that.type,_that.category,_that.amount,_that.description,_that.date,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MovementType type,  MovementCategory category,  double amount,  String description,  String date,  CashPaymentMethod paymentMethod)  $default,) {final _that = this;
switch (_that) {
case _MovementPayload():
return $default(_that.type,_that.category,_that.amount,_that.description,_that.date,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MovementType type,  MovementCategory category,  double amount,  String description,  String date,  CashPaymentMethod paymentMethod)?  $default,) {final _that = this;
switch (_that) {
case _MovementPayload() when $default != null:
return $default(_that.type,_that.category,_that.amount,_that.description,_that.date,_that.paymentMethod);case _:
  return null;

}
}

}

/// @nodoc


class _MovementPayload implements MovementPayload {
  const _MovementPayload({required this.type, required this.category, required this.amount, required this.description, required this.date, required this.paymentMethod});
  

@override final  MovementType type;
@override final  MovementCategory category;
@override final  double amount;
@override final  String description;
@override final  String date;
@override final  CashPaymentMethod paymentMethod;

/// Create a copy of MovementPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovementPayloadCopyWith<_MovementPayload> get copyWith => __$MovementPayloadCopyWithImpl<_MovementPayload>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovementPayload&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}


@override
int get hashCode => Object.hash(runtimeType,type,category,amount,description,date,paymentMethod);

@override
String toString() {
  return 'MovementPayload(type: $type, category: $category, amount: $amount, description: $description, date: $date, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class _$MovementPayloadCopyWith<$Res> implements $MovementPayloadCopyWith<$Res> {
  factory _$MovementPayloadCopyWith(_MovementPayload value, $Res Function(_MovementPayload) _then) = __$MovementPayloadCopyWithImpl;
@override @useResult
$Res call({
 MovementType type, MovementCategory category, double amount, String description, String date, CashPaymentMethod paymentMethod
});




}
/// @nodoc
class __$MovementPayloadCopyWithImpl<$Res>
    implements _$MovementPayloadCopyWith<$Res> {
  __$MovementPayloadCopyWithImpl(this._self, this._then);

  final _MovementPayload _self;
  final $Res Function(_MovementPayload) _then;

/// Create a copy of MovementPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? category = null,Object? amount = null,Object? description = null,Object? date = null,Object? paymentMethod = null,}) {
  return _then(_MovementPayload(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MovementType,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as MovementCategory,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as CashPaymentMethod,
  ));
}


}

/// @nodoc
mixin _$PaymentMethodFilter {

 bool get cash; bool get yape; bool get card;
/// Create a copy of PaymentMethodFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodFilterCopyWith<PaymentMethodFilter> get copyWith => _$PaymentMethodFilterCopyWithImpl<PaymentMethodFilter>(this as PaymentMethodFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodFilter&&(identical(other.cash, cash) || other.cash == cash)&&(identical(other.yape, yape) || other.yape == yape)&&(identical(other.card, card) || other.card == card));
}


@override
int get hashCode => Object.hash(runtimeType,cash,yape,card);

@override
String toString() {
  return 'PaymentMethodFilter(cash: $cash, yape: $yape, card: $card)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodFilterCopyWith<$Res>  {
  factory $PaymentMethodFilterCopyWith(PaymentMethodFilter value, $Res Function(PaymentMethodFilter) _then) = _$PaymentMethodFilterCopyWithImpl;
@useResult
$Res call({
 bool cash, bool yape, bool card
});




}
/// @nodoc
class _$PaymentMethodFilterCopyWithImpl<$Res>
    implements $PaymentMethodFilterCopyWith<$Res> {
  _$PaymentMethodFilterCopyWithImpl(this._self, this._then);

  final PaymentMethodFilter _self;
  final $Res Function(PaymentMethodFilter) _then;

/// Create a copy of PaymentMethodFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cash = null,Object? yape = null,Object? card = null,}) {
  return _then(_self.copyWith(
cash: null == cash ? _self.cash : cash // ignore: cast_nullable_to_non_nullable
as bool,yape: null == yape ? _self.yape : yape // ignore: cast_nullable_to_non_nullable
as bool,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethodFilter].
extension PaymentMethodFilterPatterns on PaymentMethodFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodFilter value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodFilter value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool cash,  bool yape,  bool card)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodFilter() when $default != null:
return $default(_that.cash,_that.yape,_that.card);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool cash,  bool yape,  bool card)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodFilter():
return $default(_that.cash,_that.yape,_that.card);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool cash,  bool yape,  bool card)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodFilter() when $default != null:
return $default(_that.cash,_that.yape,_that.card);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentMethodFilter implements PaymentMethodFilter {
  const _PaymentMethodFilter({this.cash = true, this.yape = true, this.card = true});
  

@override@JsonKey() final  bool cash;
@override@JsonKey() final  bool yape;
@override@JsonKey() final  bool card;

/// Create a copy of PaymentMethodFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodFilterCopyWith<_PaymentMethodFilter> get copyWith => __$PaymentMethodFilterCopyWithImpl<_PaymentMethodFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodFilter&&(identical(other.cash, cash) || other.cash == cash)&&(identical(other.yape, yape) || other.yape == yape)&&(identical(other.card, card) || other.card == card));
}


@override
int get hashCode => Object.hash(runtimeType,cash,yape,card);

@override
String toString() {
  return 'PaymentMethodFilter(cash: $cash, yape: $yape, card: $card)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodFilterCopyWith<$Res> implements $PaymentMethodFilterCopyWith<$Res> {
  factory _$PaymentMethodFilterCopyWith(_PaymentMethodFilter value, $Res Function(_PaymentMethodFilter) _then) = __$PaymentMethodFilterCopyWithImpl;
@override @useResult
$Res call({
 bool cash, bool yape, bool card
});




}
/// @nodoc
class __$PaymentMethodFilterCopyWithImpl<$Res>
    implements _$PaymentMethodFilterCopyWith<$Res> {
  __$PaymentMethodFilterCopyWithImpl(this._self, this._then);

  final _PaymentMethodFilter _self;
  final $Res Function(_PaymentMethodFilter) _then;

/// Create a copy of PaymentMethodFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cash = null,Object? yape = null,Object? card = null,}) {
  return _then(_PaymentMethodFilter(
cash: null == cash ? _self.cash : cash // ignore: cast_nullable_to_non_nullable
as bool,yape: null == yape ? _self.yape : yape // ignore: cast_nullable_to_non_nullable
as bool,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
