// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sale {

 int get id; String get code; String get creationTime; double get total; String get status; String get paymentMethod; String get customer; SaleDocumentType? get documentType; String? get fullInvoiceNumber; String? get serie; int? get correlativo; double? get taxableBase; double? get igvAmount; SunatStatus? get sunatStatus;
/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleCopyWith<Sale> get copyWith => _$SaleCopyWithImpl<Sale>(this as Sale, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sale&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.fullInvoiceNumber, fullInvoiceNumber) || other.fullInvoiceNumber == fullInvoiceNumber)&&(identical(other.serie, serie) || other.serie == serie)&&(identical(other.correlativo, correlativo) || other.correlativo == correlativo)&&(identical(other.taxableBase, taxableBase) || other.taxableBase == taxableBase)&&(identical(other.igvAmount, igvAmount) || other.igvAmount == igvAmount)&&(identical(other.sunatStatus, sunatStatus) || other.sunatStatus == sunatStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,code,creationTime,total,status,paymentMethod,customer,documentType,fullInvoiceNumber,serie,correlativo,taxableBase,igvAmount,sunatStatus);

@override
String toString() {
  return 'Sale(id: $id, code: $code, creationTime: $creationTime, total: $total, status: $status, paymentMethod: $paymentMethod, customer: $customer, documentType: $documentType, fullInvoiceNumber: $fullInvoiceNumber, serie: $serie, correlativo: $correlativo, taxableBase: $taxableBase, igvAmount: $igvAmount, sunatStatus: $sunatStatus)';
}


}

/// @nodoc
abstract mixin class $SaleCopyWith<$Res>  {
  factory $SaleCopyWith(Sale value, $Res Function(Sale) _then) = _$SaleCopyWithImpl;
@useResult
$Res call({
 int id, String code, String creationTime, double total, String status, String paymentMethod, String customer, SaleDocumentType? documentType, String? fullInvoiceNumber, String? serie, int? correlativo, double? taxableBase, double? igvAmount, SunatStatus? sunatStatus
});




}
/// @nodoc
class _$SaleCopyWithImpl<$Res>
    implements $SaleCopyWith<$Res> {
  _$SaleCopyWithImpl(this._self, this._then);

  final Sale _self;
  final $Res Function(Sale) _then;

/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? creationTime = null,Object? total = null,Object? status = null,Object? paymentMethod = null,Object? customer = null,Object? documentType = freezed,Object? fullInvoiceNumber = freezed,Object? serie = freezed,Object? correlativo = freezed,Object? taxableBase = freezed,Object? igvAmount = freezed,Object? sunatStatus = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as SaleDocumentType?,fullInvoiceNumber: freezed == fullInvoiceNumber ? _self.fullInvoiceNumber : fullInvoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,serie: freezed == serie ? _self.serie : serie // ignore: cast_nullable_to_non_nullable
as String?,correlativo: freezed == correlativo ? _self.correlativo : correlativo // ignore: cast_nullable_to_non_nullable
as int?,taxableBase: freezed == taxableBase ? _self.taxableBase : taxableBase // ignore: cast_nullable_to_non_nullable
as double?,igvAmount: freezed == igvAmount ? _self.igvAmount : igvAmount // ignore: cast_nullable_to_non_nullable
as double?,sunatStatus: freezed == sunatStatus ? _self.sunatStatus : sunatStatus // ignore: cast_nullable_to_non_nullable
as SunatStatus?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sale].
extension SalePatterns on Sale {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sale value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sale() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sale value)  $default,){
final _that = this;
switch (_that) {
case _Sale():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sale value)?  $default,){
final _that = this;
switch (_that) {
case _Sale() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  String creationTime,  double total,  String status,  String paymentMethod,  String customer,  SaleDocumentType? documentType,  String? fullInvoiceNumber,  String? serie,  int? correlativo,  double? taxableBase,  double? igvAmount,  SunatStatus? sunatStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sale() when $default != null:
return $default(_that.id,_that.code,_that.creationTime,_that.total,_that.status,_that.paymentMethod,_that.customer,_that.documentType,_that.fullInvoiceNumber,_that.serie,_that.correlativo,_that.taxableBase,_that.igvAmount,_that.sunatStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  String creationTime,  double total,  String status,  String paymentMethod,  String customer,  SaleDocumentType? documentType,  String? fullInvoiceNumber,  String? serie,  int? correlativo,  double? taxableBase,  double? igvAmount,  SunatStatus? sunatStatus)  $default,) {final _that = this;
switch (_that) {
case _Sale():
return $default(_that.id,_that.code,_that.creationTime,_that.total,_that.status,_that.paymentMethod,_that.customer,_that.documentType,_that.fullInvoiceNumber,_that.serie,_that.correlativo,_that.taxableBase,_that.igvAmount,_that.sunatStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  String creationTime,  double total,  String status,  String paymentMethod,  String customer,  SaleDocumentType? documentType,  String? fullInvoiceNumber,  String? serie,  int? correlativo,  double? taxableBase,  double? igvAmount,  SunatStatus? sunatStatus)?  $default,) {final _that = this;
switch (_that) {
case _Sale() when $default != null:
return $default(_that.id,_that.code,_that.creationTime,_that.total,_that.status,_that.paymentMethod,_that.customer,_that.documentType,_that.fullInvoiceNumber,_that.serie,_that.correlativo,_that.taxableBase,_that.igvAmount,_that.sunatStatus);case _:
  return null;

}
}

}

/// @nodoc


class _Sale implements Sale {
  const _Sale({required this.id, required this.code, required this.creationTime, required this.total, this.status = 'ACTIVE', this.paymentMethod = '', this.customer = '', this.documentType, this.fullInvoiceNumber, this.serie, this.correlativo, this.taxableBase, this.igvAmount, this.sunatStatus});
  

@override final  int id;
@override final  String code;
@override final  String creationTime;
@override final  double total;
@override@JsonKey() final  String status;
@override@JsonKey() final  String paymentMethod;
@override@JsonKey() final  String customer;
@override final  SaleDocumentType? documentType;
@override final  String? fullInvoiceNumber;
@override final  String? serie;
@override final  int? correlativo;
@override final  double? taxableBase;
@override final  double? igvAmount;
@override final  SunatStatus? sunatStatus;

/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleCopyWith<_Sale> get copyWith => __$SaleCopyWithImpl<_Sale>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sale&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.fullInvoiceNumber, fullInvoiceNumber) || other.fullInvoiceNumber == fullInvoiceNumber)&&(identical(other.serie, serie) || other.serie == serie)&&(identical(other.correlativo, correlativo) || other.correlativo == correlativo)&&(identical(other.taxableBase, taxableBase) || other.taxableBase == taxableBase)&&(identical(other.igvAmount, igvAmount) || other.igvAmount == igvAmount)&&(identical(other.sunatStatus, sunatStatus) || other.sunatStatus == sunatStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,code,creationTime,total,status,paymentMethod,customer,documentType,fullInvoiceNumber,serie,correlativo,taxableBase,igvAmount,sunatStatus);

@override
String toString() {
  return 'Sale(id: $id, code: $code, creationTime: $creationTime, total: $total, status: $status, paymentMethod: $paymentMethod, customer: $customer, documentType: $documentType, fullInvoiceNumber: $fullInvoiceNumber, serie: $serie, correlativo: $correlativo, taxableBase: $taxableBase, igvAmount: $igvAmount, sunatStatus: $sunatStatus)';
}


}

/// @nodoc
abstract mixin class _$SaleCopyWith<$Res> implements $SaleCopyWith<$Res> {
  factory _$SaleCopyWith(_Sale value, $Res Function(_Sale) _then) = __$SaleCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String creationTime, double total, String status, String paymentMethod, String customer, SaleDocumentType? documentType, String? fullInvoiceNumber, String? serie, int? correlativo, double? taxableBase, double? igvAmount, SunatStatus? sunatStatus
});




}
/// @nodoc
class __$SaleCopyWithImpl<$Res>
    implements _$SaleCopyWith<$Res> {
  __$SaleCopyWithImpl(this._self, this._then);

  final _Sale _self;
  final $Res Function(_Sale) _then;

/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? creationTime = null,Object? total = null,Object? status = null,Object? paymentMethod = null,Object? customer = null,Object? documentType = freezed,Object? fullInvoiceNumber = freezed,Object? serie = freezed,Object? correlativo = freezed,Object? taxableBase = freezed,Object? igvAmount = freezed,Object? sunatStatus = freezed,}) {
  return _then(_Sale(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as SaleDocumentType?,fullInvoiceNumber: freezed == fullInvoiceNumber ? _self.fullInvoiceNumber : fullInvoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,serie: freezed == serie ? _self.serie : serie // ignore: cast_nullable_to_non_nullable
as String?,correlativo: freezed == correlativo ? _self.correlativo : correlativo // ignore: cast_nullable_to_non_nullable
as int?,taxableBase: freezed == taxableBase ? _self.taxableBase : taxableBase // ignore: cast_nullable_to_non_nullable
as double?,igvAmount: freezed == igvAmount ? _self.igvAmount : igvAmount // ignore: cast_nullable_to_non_nullable
as double?,sunatStatus: freezed == sunatStatus ? _self.sunatStatus : sunatStatus // ignore: cast_nullable_to_non_nullable
as SunatStatus?,
  ));
}


}

/// @nodoc
mixin _$SalePagination {

 int get total; int get pages;
/// Create a copy of SalePagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalePaginationCopyWith<SalePagination> get copyWith => _$SalePaginationCopyWithImpl<SalePagination>(this as SalePagination, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalePagination&&(identical(other.total, total) || other.total == total)&&(identical(other.pages, pages) || other.pages == pages));
}


@override
int get hashCode => Object.hash(runtimeType,total,pages);

@override
String toString() {
  return 'SalePagination(total: $total, pages: $pages)';
}


}

/// @nodoc
abstract mixin class $SalePaginationCopyWith<$Res>  {
  factory $SalePaginationCopyWith(SalePagination value, $Res Function(SalePagination) _then) = _$SalePaginationCopyWithImpl;
@useResult
$Res call({
 int total, int pages
});




}
/// @nodoc
class _$SalePaginationCopyWithImpl<$Res>
    implements $SalePaginationCopyWith<$Res> {
  _$SalePaginationCopyWithImpl(this._self, this._then);

  final SalePagination _self;
  final $Res Function(SalePagination) _then;

/// Create a copy of SalePagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? pages = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SalePagination].
extension SalePaginationPatterns on SalePagination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalePagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalePagination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalePagination value)  $default,){
final _that = this;
switch (_that) {
case _SalePagination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalePagination value)?  $default,){
final _that = this;
switch (_that) {
case _SalePagination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int pages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalePagination() when $default != null:
return $default(_that.total,_that.pages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int pages)  $default,) {final _that = this;
switch (_that) {
case _SalePagination():
return $default(_that.total,_that.pages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int pages)?  $default,) {final _that = this;
switch (_that) {
case _SalePagination() when $default != null:
return $default(_that.total,_that.pages);case _:
  return null;

}
}

}

/// @nodoc


class _SalePagination implements SalePagination {
  const _SalePagination({required this.total, this.pages = 1});
  

@override final  int total;
@override@JsonKey() final  int pages;

/// Create a copy of SalePagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalePaginationCopyWith<_SalePagination> get copyWith => __$SalePaginationCopyWithImpl<_SalePagination>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalePagination&&(identical(other.total, total) || other.total == total)&&(identical(other.pages, pages) || other.pages == pages));
}


@override
int get hashCode => Object.hash(runtimeType,total,pages);

@override
String toString() {
  return 'SalePagination(total: $total, pages: $pages)';
}


}

/// @nodoc
abstract mixin class _$SalePaginationCopyWith<$Res> implements $SalePaginationCopyWith<$Res> {
  factory _$SalePaginationCopyWith(_SalePagination value, $Res Function(_SalePagination) _then) = __$SalePaginationCopyWithImpl;
@override @useResult
$Res call({
 int total, int pages
});




}
/// @nodoc
class __$SalePaginationCopyWithImpl<$Res>
    implements _$SalePaginationCopyWith<$Res> {
  __$SalePaginationCopyWithImpl(this._self, this._then);

  final _SalePagination _self;
  final $Res Function(_SalePagination) _then;

/// Create a copy of SalePagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? pages = null,}) {
  return _then(_SalePagination(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$SaleListPage {

 List<Sale> get data; SalePagination get paginate;
/// Create a copy of SaleListPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleListPageCopyWith<SaleListPage> get copyWith => _$SaleListPageCopyWithImpl<SaleListPage>(this as SaleListPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleListPage&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.paginate, paginate) || other.paginate == paginate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),paginate);

@override
String toString() {
  return 'SaleListPage(data: $data, paginate: $paginate)';
}


}

/// @nodoc
abstract mixin class $SaleListPageCopyWith<$Res>  {
  factory $SaleListPageCopyWith(SaleListPage value, $Res Function(SaleListPage) _then) = _$SaleListPageCopyWithImpl;
@useResult
$Res call({
 List<Sale> data, SalePagination paginate
});


$SalePaginationCopyWith<$Res> get paginate;

}
/// @nodoc
class _$SaleListPageCopyWithImpl<$Res>
    implements $SaleListPageCopyWith<$Res> {
  _$SaleListPageCopyWithImpl(this._self, this._then);

  final SaleListPage _self;
  final $Res Function(SaleListPage) _then;

/// Create a copy of SaleListPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? paginate = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Sale>,paginate: null == paginate ? _self.paginate : paginate // ignore: cast_nullable_to_non_nullable
as SalePagination,
  ));
}
/// Create a copy of SaleListPage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalePaginationCopyWith<$Res> get paginate {
  
  return $SalePaginationCopyWith<$Res>(_self.paginate, (value) {
    return _then(_self.copyWith(paginate: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaleListPage].
extension SaleListPagePatterns on SaleListPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleListPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleListPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleListPage value)  $default,){
final _that = this;
switch (_that) {
case _SaleListPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleListPage value)?  $default,){
final _that = this;
switch (_that) {
case _SaleListPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sale> data,  SalePagination paginate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleListPage() when $default != null:
return $default(_that.data,_that.paginate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sale> data,  SalePagination paginate)  $default,) {final _that = this;
switch (_that) {
case _SaleListPage():
return $default(_that.data,_that.paginate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sale> data,  SalePagination paginate)?  $default,) {final _that = this;
switch (_that) {
case _SaleListPage() when $default != null:
return $default(_that.data,_that.paginate);case _:
  return null;

}
}

}

/// @nodoc


class _SaleListPage implements SaleListPage {
  const _SaleListPage({required final  List<Sale> data, required this.paginate}): _data = data;
  

 final  List<Sale> _data;
@override List<Sale> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  SalePagination paginate;

/// Create a copy of SaleListPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleListPageCopyWith<_SaleListPage> get copyWith => __$SaleListPageCopyWithImpl<_SaleListPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleListPage&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.paginate, paginate) || other.paginate == paginate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),paginate);

@override
String toString() {
  return 'SaleListPage(data: $data, paginate: $paginate)';
}


}

/// @nodoc
abstract mixin class _$SaleListPageCopyWith<$Res> implements $SaleListPageCopyWith<$Res> {
  factory _$SaleListPageCopyWith(_SaleListPage value, $Res Function(_SaleListPage) _then) = __$SaleListPageCopyWithImpl;
@override @useResult
$Res call({
 List<Sale> data, SalePagination paginate
});


@override $SalePaginationCopyWith<$Res> get paginate;

}
/// @nodoc
class __$SaleListPageCopyWithImpl<$Res>
    implements _$SaleListPageCopyWith<$Res> {
  __$SaleListPageCopyWithImpl(this._self, this._then);

  final _SaleListPage _self;
  final $Res Function(_SaleListPage) _then;

/// Create a copy of SaleListPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? paginate = null,}) {
  return _then(_SaleListPage(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Sale>,paginate: null == paginate ? _self.paginate : paginate // ignore: cast_nullable_to_non_nullable
as SalePagination,
  ));
}

/// Create a copy of SaleListPage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalePaginationCopyWith<$Res> get paginate {
  
  return $SalePaginationCopyWith<$Res>(_self.paginate, (value) {
    return _then(_self.copyWith(paginate: value));
  });
}
}

/// @nodoc
mixin _$SaleItem {

 int? get id; String get productName; String get descriptionFull; int get quantity; double get unitPrice; double get subtotal; int? get productSizeId; int? get colorId;
/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleItemCopyWith<SaleItem> get copyWith => _$SaleItemCopyWithImpl<SaleItem>(this as SaleItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.descriptionFull, descriptionFull) || other.descriptionFull == descriptionFull)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.productSizeId, productSizeId) || other.productSizeId == productSizeId)&&(identical(other.colorId, colorId) || other.colorId == colorId));
}


@override
int get hashCode => Object.hash(runtimeType,id,productName,descriptionFull,quantity,unitPrice,subtotal,productSizeId,colorId);

@override
String toString() {
  return 'SaleItem(id: $id, productName: $productName, descriptionFull: $descriptionFull, quantity: $quantity, unitPrice: $unitPrice, subtotal: $subtotal, productSizeId: $productSizeId, colorId: $colorId)';
}


}

/// @nodoc
abstract mixin class $SaleItemCopyWith<$Res>  {
  factory $SaleItemCopyWith(SaleItem value, $Res Function(SaleItem) _then) = _$SaleItemCopyWithImpl;
@useResult
$Res call({
 int? id, String productName, String descriptionFull, int quantity, double unitPrice, double subtotal, int? productSizeId, int? colorId
});




}
/// @nodoc
class _$SaleItemCopyWithImpl<$Res>
    implements $SaleItemCopyWith<$Res> {
  _$SaleItemCopyWithImpl(this._self, this._then);

  final SaleItem _self;
  final $Res Function(SaleItem) _then;

/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? productName = null,Object? descriptionFull = null,Object? quantity = null,Object? unitPrice = null,Object? subtotal = null,Object? productSizeId = freezed,Object? colorId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,descriptionFull: null == descriptionFull ? _self.descriptionFull : descriptionFull // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,productSizeId: freezed == productSizeId ? _self.productSizeId : productSizeId // ignore: cast_nullable_to_non_nullable
as int?,colorId: freezed == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleItem].
extension SaleItemPatterns on SaleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleItem value)  $default,){
final _that = this;
switch (_that) {
case _SaleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleItem value)?  $default,){
final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String productName,  String descriptionFull,  int quantity,  double unitPrice,  double subtotal,  int? productSizeId,  int? colorId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
return $default(_that.id,_that.productName,_that.descriptionFull,_that.quantity,_that.unitPrice,_that.subtotal,_that.productSizeId,_that.colorId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String productName,  String descriptionFull,  int quantity,  double unitPrice,  double subtotal,  int? productSizeId,  int? colorId)  $default,) {final _that = this;
switch (_that) {
case _SaleItem():
return $default(_that.id,_that.productName,_that.descriptionFull,_that.quantity,_that.unitPrice,_that.subtotal,_that.productSizeId,_that.colorId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String productName,  String descriptionFull,  int quantity,  double unitPrice,  double subtotal,  int? productSizeId,  int? colorId)?  $default,) {final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
return $default(_that.id,_that.productName,_that.descriptionFull,_that.quantity,_that.unitPrice,_that.subtotal,_that.productSizeId,_that.colorId);case _:
  return null;

}
}

}

/// @nodoc


class _SaleItem implements SaleItem {
  const _SaleItem({this.id, required this.productName, required this.descriptionFull, required this.quantity, required this.unitPrice, required this.subtotal, this.productSizeId, this.colorId});
  

@override final  int? id;
@override final  String productName;
@override final  String descriptionFull;
@override final  int quantity;
@override final  double unitPrice;
@override final  double subtotal;
@override final  int? productSizeId;
@override final  int? colorId;

/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleItemCopyWith<_SaleItem> get copyWith => __$SaleItemCopyWithImpl<_SaleItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.descriptionFull, descriptionFull) || other.descriptionFull == descriptionFull)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.productSizeId, productSizeId) || other.productSizeId == productSizeId)&&(identical(other.colorId, colorId) || other.colorId == colorId));
}


@override
int get hashCode => Object.hash(runtimeType,id,productName,descriptionFull,quantity,unitPrice,subtotal,productSizeId,colorId);

@override
String toString() {
  return 'SaleItem(id: $id, productName: $productName, descriptionFull: $descriptionFull, quantity: $quantity, unitPrice: $unitPrice, subtotal: $subtotal, productSizeId: $productSizeId, colorId: $colorId)';
}


}

/// @nodoc
abstract mixin class _$SaleItemCopyWith<$Res> implements $SaleItemCopyWith<$Res> {
  factory _$SaleItemCopyWith(_SaleItem value, $Res Function(_SaleItem) _then) = __$SaleItemCopyWithImpl;
@override @useResult
$Res call({
 int? id, String productName, String descriptionFull, int quantity, double unitPrice, double subtotal, int? productSizeId, int? colorId
});




}
/// @nodoc
class __$SaleItemCopyWithImpl<$Res>
    implements _$SaleItemCopyWith<$Res> {
  __$SaleItemCopyWithImpl(this._self, this._then);

  final _SaleItem _self;
  final $Res Function(_SaleItem) _then;

/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? productName = null,Object? descriptionFull = null,Object? quantity = null,Object? unitPrice = null,Object? subtotal = null,Object? productSizeId = freezed,Object? colorId = freezed,}) {
  return _then(_SaleItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,descriptionFull: null == descriptionFull ? _self.descriptionFull : descriptionFull // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,productSizeId: freezed == productSizeId ? _self.productSizeId : productSizeId // ignore: cast_nullable_to_non_nullable
as int?,colorId: freezed == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$SalePayment {

 SalePaymentMethod get method; double get amount;
/// Create a copy of SalePayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalePaymentCopyWith<SalePayment> get copyWith => _$SalePaymentCopyWithImpl<SalePayment>(this as SalePayment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalePayment&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,method,amount);

@override
String toString() {
  return 'SalePayment(method: $method, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $SalePaymentCopyWith<$Res>  {
  factory $SalePaymentCopyWith(SalePayment value, $Res Function(SalePayment) _then) = _$SalePaymentCopyWithImpl;
@useResult
$Res call({
 SalePaymentMethod method, double amount
});




}
/// @nodoc
class _$SalePaymentCopyWithImpl<$Res>
    implements $SalePaymentCopyWith<$Res> {
  _$SalePaymentCopyWithImpl(this._self, this._then);

  final SalePayment _self;
  final $Res Function(SalePayment) _then;

/// Create a copy of SalePayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? amount = null,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as SalePaymentMethod,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SalePayment].
extension SalePaymentPatterns on SalePayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalePayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalePayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalePayment value)  $default,){
final _that = this;
switch (_that) {
case _SalePayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalePayment value)?  $default,){
final _that = this;
switch (_that) {
case _SalePayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SalePaymentMethod method,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalePayment() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SalePaymentMethod method,  double amount)  $default,) {final _that = this;
switch (_that) {
case _SalePayment():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SalePaymentMethod method,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _SalePayment() when $default != null:
return $default(_that.method,_that.amount);case _:
  return null;

}
}

}

/// @nodoc


class _SalePayment implements SalePayment {
  const _SalePayment({required this.method, required this.amount});
  

@override final  SalePaymentMethod method;
@override final  double amount;

/// Create a copy of SalePayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalePaymentCopyWith<_SalePayment> get copyWith => __$SalePaymentCopyWithImpl<_SalePayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalePayment&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,method,amount);

@override
String toString() {
  return 'SalePayment(method: $method, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$SalePaymentCopyWith<$Res> implements $SalePaymentCopyWith<$Res> {
  factory _$SalePaymentCopyWith(_SalePayment value, $Res Function(_SalePayment) _then) = __$SalePaymentCopyWithImpl;
@override @useResult
$Res call({
 SalePaymentMethod method, double amount
});




}
/// @nodoc
class __$SalePaymentCopyWithImpl<$Res>
    implements _$SalePaymentCopyWith<$Res> {
  __$SalePaymentCopyWithImpl(this._self, this._then);

  final _SalePayment _self;
  final $Res Function(_SalePayment) _then;

/// Create a copy of SalePayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? amount = null,}) {
  return _then(_SalePayment(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as SalePaymentMethod,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$SaleDetail {

 int get id; String get code; String get creationTime; double get total; String get status; String get paymentMethod; String get customer; SaleDocumentType? get documentType; String? get fullInvoiceNumber; String? get serie; int? get correlativo; double? get taxableBase; double? get igvAmount; SunatStatus? get sunatStatus; String? get datetimeIso; List<SaleItem> get items; List<SalePayment> get payments;
/// Create a copy of SaleDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleDetailCopyWith<SaleDetail> get copyWith => _$SaleDetailCopyWithImpl<SaleDetail>(this as SaleDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.fullInvoiceNumber, fullInvoiceNumber) || other.fullInvoiceNumber == fullInvoiceNumber)&&(identical(other.serie, serie) || other.serie == serie)&&(identical(other.correlativo, correlativo) || other.correlativo == correlativo)&&(identical(other.taxableBase, taxableBase) || other.taxableBase == taxableBase)&&(identical(other.igvAmount, igvAmount) || other.igvAmount == igvAmount)&&(identical(other.sunatStatus, sunatStatus) || other.sunatStatus == sunatStatus)&&(identical(other.datetimeIso, datetimeIso) || other.datetimeIso == datetimeIso)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.payments, payments));
}


@override
int get hashCode => Object.hash(runtimeType,id,code,creationTime,total,status,paymentMethod,customer,documentType,fullInvoiceNumber,serie,correlativo,taxableBase,igvAmount,sunatStatus,datetimeIso,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(payments));

@override
String toString() {
  return 'SaleDetail(id: $id, code: $code, creationTime: $creationTime, total: $total, status: $status, paymentMethod: $paymentMethod, customer: $customer, documentType: $documentType, fullInvoiceNumber: $fullInvoiceNumber, serie: $serie, correlativo: $correlativo, taxableBase: $taxableBase, igvAmount: $igvAmount, sunatStatus: $sunatStatus, datetimeIso: $datetimeIso, items: $items, payments: $payments)';
}


}

/// @nodoc
abstract mixin class $SaleDetailCopyWith<$Res>  {
  factory $SaleDetailCopyWith(SaleDetail value, $Res Function(SaleDetail) _then) = _$SaleDetailCopyWithImpl;
@useResult
$Res call({
 int id, String code, String creationTime, double total, String status, String paymentMethod, String customer, SaleDocumentType? documentType, String? fullInvoiceNumber, String? serie, int? correlativo, double? taxableBase, double? igvAmount, SunatStatus? sunatStatus, String? datetimeIso, List<SaleItem> items, List<SalePayment> payments
});




}
/// @nodoc
class _$SaleDetailCopyWithImpl<$Res>
    implements $SaleDetailCopyWith<$Res> {
  _$SaleDetailCopyWithImpl(this._self, this._then);

  final SaleDetail _self;
  final $Res Function(SaleDetail) _then;

/// Create a copy of SaleDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? creationTime = null,Object? total = null,Object? status = null,Object? paymentMethod = null,Object? customer = null,Object? documentType = freezed,Object? fullInvoiceNumber = freezed,Object? serie = freezed,Object? correlativo = freezed,Object? taxableBase = freezed,Object? igvAmount = freezed,Object? sunatStatus = freezed,Object? datetimeIso = freezed,Object? items = null,Object? payments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as SaleDocumentType?,fullInvoiceNumber: freezed == fullInvoiceNumber ? _self.fullInvoiceNumber : fullInvoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,serie: freezed == serie ? _self.serie : serie // ignore: cast_nullable_to_non_nullable
as String?,correlativo: freezed == correlativo ? _self.correlativo : correlativo // ignore: cast_nullable_to_non_nullable
as int?,taxableBase: freezed == taxableBase ? _self.taxableBase : taxableBase // ignore: cast_nullable_to_non_nullable
as double?,igvAmount: freezed == igvAmount ? _self.igvAmount : igvAmount // ignore: cast_nullable_to_non_nullable
as double?,sunatStatus: freezed == sunatStatus ? _self.sunatStatus : sunatStatus // ignore: cast_nullable_to_non_nullable
as SunatStatus?,datetimeIso: freezed == datetimeIso ? _self.datetimeIso : datetimeIso // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SaleItem>,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<SalePayment>,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleDetail].
extension SaleDetailPatterns on SaleDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleDetail value)  $default,){
final _that = this;
switch (_that) {
case _SaleDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleDetail value)?  $default,){
final _that = this;
switch (_that) {
case _SaleDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  String creationTime,  double total,  String status,  String paymentMethod,  String customer,  SaleDocumentType? documentType,  String? fullInvoiceNumber,  String? serie,  int? correlativo,  double? taxableBase,  double? igvAmount,  SunatStatus? sunatStatus,  String? datetimeIso,  List<SaleItem> items,  List<SalePayment> payments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleDetail() when $default != null:
return $default(_that.id,_that.code,_that.creationTime,_that.total,_that.status,_that.paymentMethod,_that.customer,_that.documentType,_that.fullInvoiceNumber,_that.serie,_that.correlativo,_that.taxableBase,_that.igvAmount,_that.sunatStatus,_that.datetimeIso,_that.items,_that.payments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  String creationTime,  double total,  String status,  String paymentMethod,  String customer,  SaleDocumentType? documentType,  String? fullInvoiceNumber,  String? serie,  int? correlativo,  double? taxableBase,  double? igvAmount,  SunatStatus? sunatStatus,  String? datetimeIso,  List<SaleItem> items,  List<SalePayment> payments)  $default,) {final _that = this;
switch (_that) {
case _SaleDetail():
return $default(_that.id,_that.code,_that.creationTime,_that.total,_that.status,_that.paymentMethod,_that.customer,_that.documentType,_that.fullInvoiceNumber,_that.serie,_that.correlativo,_that.taxableBase,_that.igvAmount,_that.sunatStatus,_that.datetimeIso,_that.items,_that.payments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  String creationTime,  double total,  String status,  String paymentMethod,  String customer,  SaleDocumentType? documentType,  String? fullInvoiceNumber,  String? serie,  int? correlativo,  double? taxableBase,  double? igvAmount,  SunatStatus? sunatStatus,  String? datetimeIso,  List<SaleItem> items,  List<SalePayment> payments)?  $default,) {final _that = this;
switch (_that) {
case _SaleDetail() when $default != null:
return $default(_that.id,_that.code,_that.creationTime,_that.total,_that.status,_that.paymentMethod,_that.customer,_that.documentType,_that.fullInvoiceNumber,_that.serie,_that.correlativo,_that.taxableBase,_that.igvAmount,_that.sunatStatus,_that.datetimeIso,_that.items,_that.payments);case _:
  return null;

}
}

}

/// @nodoc


class _SaleDetail implements SaleDetail {
  const _SaleDetail({required this.id, required this.code, required this.creationTime, required this.total, this.status = 'ACTIVE', this.paymentMethod = '', this.customer = '', this.documentType, this.fullInvoiceNumber, this.serie, this.correlativo, this.taxableBase, this.igvAmount, this.sunatStatus, this.datetimeIso, final  List<SaleItem> items = const [], final  List<SalePayment> payments = const []}): _items = items,_payments = payments;
  

@override final  int id;
@override final  String code;
@override final  String creationTime;
@override final  double total;
@override@JsonKey() final  String status;
@override@JsonKey() final  String paymentMethod;
@override@JsonKey() final  String customer;
@override final  SaleDocumentType? documentType;
@override final  String? fullInvoiceNumber;
@override final  String? serie;
@override final  int? correlativo;
@override final  double? taxableBase;
@override final  double? igvAmount;
@override final  SunatStatus? sunatStatus;
@override final  String? datetimeIso;
 final  List<SaleItem> _items;
@override@JsonKey() List<SaleItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<SalePayment> _payments;
@override@JsonKey() List<SalePayment> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
}


/// Create a copy of SaleDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleDetailCopyWith<_SaleDetail> get copyWith => __$SaleDetailCopyWithImpl<_SaleDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.fullInvoiceNumber, fullInvoiceNumber) || other.fullInvoiceNumber == fullInvoiceNumber)&&(identical(other.serie, serie) || other.serie == serie)&&(identical(other.correlativo, correlativo) || other.correlativo == correlativo)&&(identical(other.taxableBase, taxableBase) || other.taxableBase == taxableBase)&&(identical(other.igvAmount, igvAmount) || other.igvAmount == igvAmount)&&(identical(other.sunatStatus, sunatStatus) || other.sunatStatus == sunatStatus)&&(identical(other.datetimeIso, datetimeIso) || other.datetimeIso == datetimeIso)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._payments, _payments));
}


@override
int get hashCode => Object.hash(runtimeType,id,code,creationTime,total,status,paymentMethod,customer,documentType,fullInvoiceNumber,serie,correlativo,taxableBase,igvAmount,sunatStatus,datetimeIso,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_payments));

@override
String toString() {
  return 'SaleDetail(id: $id, code: $code, creationTime: $creationTime, total: $total, status: $status, paymentMethod: $paymentMethod, customer: $customer, documentType: $documentType, fullInvoiceNumber: $fullInvoiceNumber, serie: $serie, correlativo: $correlativo, taxableBase: $taxableBase, igvAmount: $igvAmount, sunatStatus: $sunatStatus, datetimeIso: $datetimeIso, items: $items, payments: $payments)';
}


}

/// @nodoc
abstract mixin class _$SaleDetailCopyWith<$Res> implements $SaleDetailCopyWith<$Res> {
  factory _$SaleDetailCopyWith(_SaleDetail value, $Res Function(_SaleDetail) _then) = __$SaleDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String creationTime, double total, String status, String paymentMethod, String customer, SaleDocumentType? documentType, String? fullInvoiceNumber, String? serie, int? correlativo, double? taxableBase, double? igvAmount, SunatStatus? sunatStatus, String? datetimeIso, List<SaleItem> items, List<SalePayment> payments
});




}
/// @nodoc
class __$SaleDetailCopyWithImpl<$Res>
    implements _$SaleDetailCopyWith<$Res> {
  __$SaleDetailCopyWithImpl(this._self, this._then);

  final _SaleDetail _self;
  final $Res Function(_SaleDetail) _then;

/// Create a copy of SaleDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? creationTime = null,Object? total = null,Object? status = null,Object? paymentMethod = null,Object? customer = null,Object? documentType = freezed,Object? fullInvoiceNumber = freezed,Object? serie = freezed,Object? correlativo = freezed,Object? taxableBase = freezed,Object? igvAmount = freezed,Object? sunatStatus = freezed,Object? datetimeIso = freezed,Object? items = null,Object? payments = null,}) {
  return _then(_SaleDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as SaleDocumentType?,fullInvoiceNumber: freezed == fullInvoiceNumber ? _self.fullInvoiceNumber : fullInvoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,serie: freezed == serie ? _self.serie : serie // ignore: cast_nullable_to_non_nullable
as String?,correlativo: freezed == correlativo ? _self.correlativo : correlativo // ignore: cast_nullable_to_non_nullable
as int?,taxableBase: freezed == taxableBase ? _self.taxableBase : taxableBase // ignore: cast_nullable_to_non_nullable
as double?,igvAmount: freezed == igvAmount ? _self.igvAmount : igvAmount // ignore: cast_nullable_to_non_nullable
as double?,sunatStatus: freezed == sunatStatus ? _self.sunatStatus : sunatStatus // ignore: cast_nullable_to_non_nullable
as SunatStatus?,datetimeIso: freezed == datetimeIso ? _self.datetimeIso : datetimeIso // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SaleItem>,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<SalePayment>,
  ));
}


}

/// @nodoc
mixin _$SaleUpdatePayload {

 int get id; String get code; double get total; String get status; String get creationTime; List<SaleUpdateItem> get items; List<SaleUpdatePayment> get payments;
/// Create a copy of SaleUpdatePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleUpdatePayloadCopyWith<SaleUpdatePayload> get copyWith => _$SaleUpdatePayloadCopyWithImpl<SaleUpdatePayload>(this as SaleUpdatePayload, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleUpdatePayload&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.payments, payments));
}


@override
int get hashCode => Object.hash(runtimeType,id,code,total,status,creationTime,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(payments));

@override
String toString() {
  return 'SaleUpdatePayload(id: $id, code: $code, total: $total, status: $status, creationTime: $creationTime, items: $items, payments: $payments)';
}


}

/// @nodoc
abstract mixin class $SaleUpdatePayloadCopyWith<$Res>  {
  factory $SaleUpdatePayloadCopyWith(SaleUpdatePayload value, $Res Function(SaleUpdatePayload) _then) = _$SaleUpdatePayloadCopyWithImpl;
@useResult
$Res call({
 int id, String code, double total, String status, String creationTime, List<SaleUpdateItem> items, List<SaleUpdatePayment> payments
});




}
/// @nodoc
class _$SaleUpdatePayloadCopyWithImpl<$Res>
    implements $SaleUpdatePayloadCopyWith<$Res> {
  _$SaleUpdatePayloadCopyWithImpl(this._self, this._then);

  final SaleUpdatePayload _self;
  final $Res Function(SaleUpdatePayload) _then;

/// Create a copy of SaleUpdatePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? total = null,Object? status = null,Object? creationTime = null,Object? items = null,Object? payments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SaleUpdateItem>,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<SaleUpdatePayment>,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleUpdatePayload].
extension SaleUpdatePayloadPatterns on SaleUpdatePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleUpdatePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleUpdatePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleUpdatePayload value)  $default,){
final _that = this;
switch (_that) {
case _SaleUpdatePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleUpdatePayload value)?  $default,){
final _that = this;
switch (_that) {
case _SaleUpdatePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  double total,  String status,  String creationTime,  List<SaleUpdateItem> items,  List<SaleUpdatePayment> payments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleUpdatePayload() when $default != null:
return $default(_that.id,_that.code,_that.total,_that.status,_that.creationTime,_that.items,_that.payments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  double total,  String status,  String creationTime,  List<SaleUpdateItem> items,  List<SaleUpdatePayment> payments)  $default,) {final _that = this;
switch (_that) {
case _SaleUpdatePayload():
return $default(_that.id,_that.code,_that.total,_that.status,_that.creationTime,_that.items,_that.payments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  double total,  String status,  String creationTime,  List<SaleUpdateItem> items,  List<SaleUpdatePayment> payments)?  $default,) {final _that = this;
switch (_that) {
case _SaleUpdatePayload() when $default != null:
return $default(_that.id,_that.code,_that.total,_that.status,_that.creationTime,_that.items,_that.payments);case _:
  return null;

}
}

}

/// @nodoc


class _SaleUpdatePayload implements SaleUpdatePayload {
  const _SaleUpdatePayload({required this.id, required this.code, required this.total, required this.status, required this.creationTime, required final  List<SaleUpdateItem> items, required final  List<SaleUpdatePayment> payments}): _items = items,_payments = payments;
  

@override final  int id;
@override final  String code;
@override final  double total;
@override final  String status;
@override final  String creationTime;
 final  List<SaleUpdateItem> _items;
@override List<SaleUpdateItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<SaleUpdatePayment> _payments;
@override List<SaleUpdatePayment> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
}


/// Create a copy of SaleUpdatePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleUpdatePayloadCopyWith<_SaleUpdatePayload> get copyWith => __$SaleUpdatePayloadCopyWithImpl<_SaleUpdatePayload>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleUpdatePayload&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._payments, _payments));
}


@override
int get hashCode => Object.hash(runtimeType,id,code,total,status,creationTime,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_payments));

@override
String toString() {
  return 'SaleUpdatePayload(id: $id, code: $code, total: $total, status: $status, creationTime: $creationTime, items: $items, payments: $payments)';
}


}

/// @nodoc
abstract mixin class _$SaleUpdatePayloadCopyWith<$Res> implements $SaleUpdatePayloadCopyWith<$Res> {
  factory _$SaleUpdatePayloadCopyWith(_SaleUpdatePayload value, $Res Function(_SaleUpdatePayload) _then) = __$SaleUpdatePayloadCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, double total, String status, String creationTime, List<SaleUpdateItem> items, List<SaleUpdatePayment> payments
});




}
/// @nodoc
class __$SaleUpdatePayloadCopyWithImpl<$Res>
    implements _$SaleUpdatePayloadCopyWith<$Res> {
  __$SaleUpdatePayloadCopyWithImpl(this._self, this._then);

  final _SaleUpdatePayload _self;
  final $Res Function(_SaleUpdatePayload) _then;

/// Create a copy of SaleUpdatePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? total = null,Object? status = null,Object? creationTime = null,Object? items = null,Object? payments = null,}) {
  return _then(_SaleUpdatePayload(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SaleUpdateItem>,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<SaleUpdatePayment>,
  ));
}


}

/// @nodoc
mixin _$SaleUpdateItem {

 int? get id; int get quantity; double get unitPrice; int? get productSizeId; int? get colorId;
/// Create a copy of SaleUpdateItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleUpdateItemCopyWith<SaleUpdateItem> get copyWith => _$SaleUpdateItemCopyWithImpl<SaleUpdateItem>(this as SaleUpdateItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleUpdateItem&&(identical(other.id, id) || other.id == id)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.productSizeId, productSizeId) || other.productSizeId == productSizeId)&&(identical(other.colorId, colorId) || other.colorId == colorId));
}


@override
int get hashCode => Object.hash(runtimeType,id,quantity,unitPrice,productSizeId,colorId);

@override
String toString() {
  return 'SaleUpdateItem(id: $id, quantity: $quantity, unitPrice: $unitPrice, productSizeId: $productSizeId, colorId: $colorId)';
}


}

/// @nodoc
abstract mixin class $SaleUpdateItemCopyWith<$Res>  {
  factory $SaleUpdateItemCopyWith(SaleUpdateItem value, $Res Function(SaleUpdateItem) _then) = _$SaleUpdateItemCopyWithImpl;
@useResult
$Res call({
 int? id, int quantity, double unitPrice, int? productSizeId, int? colorId
});




}
/// @nodoc
class _$SaleUpdateItemCopyWithImpl<$Res>
    implements $SaleUpdateItemCopyWith<$Res> {
  _$SaleUpdateItemCopyWithImpl(this._self, this._then);

  final SaleUpdateItem _self;
  final $Res Function(SaleUpdateItem) _then;

/// Create a copy of SaleUpdateItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? quantity = null,Object? unitPrice = null,Object? productSizeId = freezed,Object? colorId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,productSizeId: freezed == productSizeId ? _self.productSizeId : productSizeId // ignore: cast_nullable_to_non_nullable
as int?,colorId: freezed == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleUpdateItem].
extension SaleUpdateItemPatterns on SaleUpdateItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleUpdateItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleUpdateItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleUpdateItem value)  $default,){
final _that = this;
switch (_that) {
case _SaleUpdateItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleUpdateItem value)?  $default,){
final _that = this;
switch (_that) {
case _SaleUpdateItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int quantity,  double unitPrice,  int? productSizeId,  int? colorId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleUpdateItem() when $default != null:
return $default(_that.id,_that.quantity,_that.unitPrice,_that.productSizeId,_that.colorId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int quantity,  double unitPrice,  int? productSizeId,  int? colorId)  $default,) {final _that = this;
switch (_that) {
case _SaleUpdateItem():
return $default(_that.id,_that.quantity,_that.unitPrice,_that.productSizeId,_that.colorId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int quantity,  double unitPrice,  int? productSizeId,  int? colorId)?  $default,) {final _that = this;
switch (_that) {
case _SaleUpdateItem() when $default != null:
return $default(_that.id,_that.quantity,_that.unitPrice,_that.productSizeId,_that.colorId);case _:
  return null;

}
}

}

/// @nodoc


class _SaleUpdateItem implements SaleUpdateItem {
  const _SaleUpdateItem({this.id, required this.quantity, required this.unitPrice, this.productSizeId, this.colorId});
  

@override final  int? id;
@override final  int quantity;
@override final  double unitPrice;
@override final  int? productSizeId;
@override final  int? colorId;

/// Create a copy of SaleUpdateItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleUpdateItemCopyWith<_SaleUpdateItem> get copyWith => __$SaleUpdateItemCopyWithImpl<_SaleUpdateItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleUpdateItem&&(identical(other.id, id) || other.id == id)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.productSizeId, productSizeId) || other.productSizeId == productSizeId)&&(identical(other.colorId, colorId) || other.colorId == colorId));
}


@override
int get hashCode => Object.hash(runtimeType,id,quantity,unitPrice,productSizeId,colorId);

@override
String toString() {
  return 'SaleUpdateItem(id: $id, quantity: $quantity, unitPrice: $unitPrice, productSizeId: $productSizeId, colorId: $colorId)';
}


}

/// @nodoc
abstract mixin class _$SaleUpdateItemCopyWith<$Res> implements $SaleUpdateItemCopyWith<$Res> {
  factory _$SaleUpdateItemCopyWith(_SaleUpdateItem value, $Res Function(_SaleUpdateItem) _then) = __$SaleUpdateItemCopyWithImpl;
@override @useResult
$Res call({
 int? id, int quantity, double unitPrice, int? productSizeId, int? colorId
});




}
/// @nodoc
class __$SaleUpdateItemCopyWithImpl<$Res>
    implements _$SaleUpdateItemCopyWith<$Res> {
  __$SaleUpdateItemCopyWithImpl(this._self, this._then);

  final _SaleUpdateItem _self;
  final $Res Function(_SaleUpdateItem) _then;

/// Create a copy of SaleUpdateItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? quantity = null,Object? unitPrice = null,Object? productSizeId = freezed,Object? colorId = freezed,}) {
  return _then(_SaleUpdateItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,productSizeId: freezed == productSizeId ? _self.productSizeId : productSizeId // ignore: cast_nullable_to_non_nullable
as int?,colorId: freezed == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$SaleUpdatePayment {

 String get method; double get amount;
/// Create a copy of SaleUpdatePayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleUpdatePaymentCopyWith<SaleUpdatePayment> get copyWith => _$SaleUpdatePaymentCopyWithImpl<SaleUpdatePayment>(this as SaleUpdatePayment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleUpdatePayment&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,method,amount);

@override
String toString() {
  return 'SaleUpdatePayment(method: $method, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $SaleUpdatePaymentCopyWith<$Res>  {
  factory $SaleUpdatePaymentCopyWith(SaleUpdatePayment value, $Res Function(SaleUpdatePayment) _then) = _$SaleUpdatePaymentCopyWithImpl;
@useResult
$Res call({
 String method, double amount
});




}
/// @nodoc
class _$SaleUpdatePaymentCopyWithImpl<$Res>
    implements $SaleUpdatePaymentCopyWith<$Res> {
  _$SaleUpdatePaymentCopyWithImpl(this._self, this._then);

  final SaleUpdatePayment _self;
  final $Res Function(SaleUpdatePayment) _then;

/// Create a copy of SaleUpdatePayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? amount = null,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleUpdatePayment].
extension SaleUpdatePaymentPatterns on SaleUpdatePayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleUpdatePayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleUpdatePayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleUpdatePayment value)  $default,){
final _that = this;
switch (_that) {
case _SaleUpdatePayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleUpdatePayment value)?  $default,){
final _that = this;
switch (_that) {
case _SaleUpdatePayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String method,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleUpdatePayment() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String method,  double amount)  $default,) {final _that = this;
switch (_that) {
case _SaleUpdatePayment():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String method,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _SaleUpdatePayment() when $default != null:
return $default(_that.method,_that.amount);case _:
  return null;

}
}

}

/// @nodoc


class _SaleUpdatePayment implements SaleUpdatePayment {
  const _SaleUpdatePayment({required this.method, required this.amount});
  

@override final  String method;
@override final  double amount;

/// Create a copy of SaleUpdatePayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleUpdatePaymentCopyWith<_SaleUpdatePayment> get copyWith => __$SaleUpdatePaymentCopyWithImpl<_SaleUpdatePayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleUpdatePayment&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,method,amount);

@override
String toString() {
  return 'SaleUpdatePayment(method: $method, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$SaleUpdatePaymentCopyWith<$Res> implements $SaleUpdatePaymentCopyWith<$Res> {
  factory _$SaleUpdatePaymentCopyWith(_SaleUpdatePayment value, $Res Function(_SaleUpdatePayment) _then) = __$SaleUpdatePaymentCopyWithImpl;
@override @useResult
$Res call({
 String method, double amount
});




}
/// @nodoc
class __$SaleUpdatePaymentCopyWithImpl<$Res>
    implements _$SaleUpdatePaymentCopyWith<$Res> {
  __$SaleUpdatePaymentCopyWithImpl(this._self, this._then);

  final _SaleUpdatePayment _self;
  final $Res Function(_SaleUpdatePayment) _then;

/// Create a copy of SaleUpdatePayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? amount = null,}) {
  return _then(_SaleUpdatePayment(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
