// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SalesListState {

 List<Sale> get sales; int get page; int get limit; int get total; int get totalPages; String get search; bool get isLoading; String? get errorMessage; String? get toastMessage;
/// Create a copy of SalesListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesListStateCopyWith<SalesListState> get copyWith => _$SalesListStateCopyWithImpl<SalesListState>(this as SalesListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesListState&&const DeepCollectionEquality().equals(other.sales, sales)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.search, search) || other.search == search)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.toastMessage, toastMessage) || other.toastMessage == toastMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sales),page,limit,total,totalPages,search,isLoading,errorMessage,toastMessage);

@override
String toString() {
  return 'SalesListState(sales: $sales, page: $page, limit: $limit, total: $total, totalPages: $totalPages, search: $search, isLoading: $isLoading, errorMessage: $errorMessage, toastMessage: $toastMessage)';
}


}

/// @nodoc
abstract mixin class $SalesListStateCopyWith<$Res>  {
  factory $SalesListStateCopyWith(SalesListState value, $Res Function(SalesListState) _then) = _$SalesListStateCopyWithImpl;
@useResult
$Res call({
 List<Sale> sales, int page, int limit, int total, int totalPages, String search, bool isLoading, String? errorMessage, String? toastMessage
});




}
/// @nodoc
class _$SalesListStateCopyWithImpl<$Res>
    implements $SalesListStateCopyWith<$Res> {
  _$SalesListStateCopyWithImpl(this._self, this._then);

  final SalesListState _self;
  final $Res Function(SalesListState) _then;

/// Create a copy of SalesListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sales = null,Object? page = null,Object? limit = null,Object? total = null,Object? totalPages = null,Object? search = null,Object? isLoading = null,Object? errorMessage = freezed,Object? toastMessage = freezed,}) {
  return _then(_self.copyWith(
sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as List<Sale>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,toastMessage: freezed == toastMessage ? _self.toastMessage : toastMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesListState].
extension SalesListStatePatterns on SalesListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesListState value)  $default,){
final _that = this;
switch (_that) {
case _SalesListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesListState value)?  $default,){
final _that = this;
switch (_that) {
case _SalesListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sale> sales,  int page,  int limit,  int total,  int totalPages,  String search,  bool isLoading,  String? errorMessage,  String? toastMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesListState() when $default != null:
return $default(_that.sales,_that.page,_that.limit,_that.total,_that.totalPages,_that.search,_that.isLoading,_that.errorMessage,_that.toastMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sale> sales,  int page,  int limit,  int total,  int totalPages,  String search,  bool isLoading,  String? errorMessage,  String? toastMessage)  $default,) {final _that = this;
switch (_that) {
case _SalesListState():
return $default(_that.sales,_that.page,_that.limit,_that.total,_that.totalPages,_that.search,_that.isLoading,_that.errorMessage,_that.toastMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sale> sales,  int page,  int limit,  int total,  int totalPages,  String search,  bool isLoading,  String? errorMessage,  String? toastMessage)?  $default,) {final _that = this;
switch (_that) {
case _SalesListState() when $default != null:
return $default(_that.sales,_that.page,_that.limit,_that.total,_that.totalPages,_that.search,_that.isLoading,_that.errorMessage,_that.toastMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SalesListState implements SalesListState {
  const _SalesListState({final  List<Sale> sales = const [], this.page = 1, this.limit = 10, this.total = 0, this.totalPages = 1, this.search = '', this.isLoading = false, this.errorMessage, this.toastMessage}): _sales = sales;
  

 final  List<Sale> _sales;
@override@JsonKey() List<Sale> get sales {
  if (_sales is EqualUnmodifiableListView) return _sales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sales);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int total;
@override@JsonKey() final  int totalPages;
@override@JsonKey() final  String search;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override final  String? toastMessage;

/// Create a copy of SalesListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesListStateCopyWith<_SalesListState> get copyWith => __$SalesListStateCopyWithImpl<_SalesListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesListState&&const DeepCollectionEquality().equals(other._sales, _sales)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.search, search) || other.search == search)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.toastMessage, toastMessage) || other.toastMessage == toastMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sales),page,limit,total,totalPages,search,isLoading,errorMessage,toastMessage);

@override
String toString() {
  return 'SalesListState(sales: $sales, page: $page, limit: $limit, total: $total, totalPages: $totalPages, search: $search, isLoading: $isLoading, errorMessage: $errorMessage, toastMessage: $toastMessage)';
}


}

/// @nodoc
abstract mixin class _$SalesListStateCopyWith<$Res> implements $SalesListStateCopyWith<$Res> {
  factory _$SalesListStateCopyWith(_SalesListState value, $Res Function(_SalesListState) _then) = __$SalesListStateCopyWithImpl;
@override @useResult
$Res call({
 List<Sale> sales, int page, int limit, int total, int totalPages, String search, bool isLoading, String? errorMessage, String? toastMessage
});




}
/// @nodoc
class __$SalesListStateCopyWithImpl<$Res>
    implements _$SalesListStateCopyWith<$Res> {
  __$SalesListStateCopyWithImpl(this._self, this._then);

  final _SalesListState _self;
  final $Res Function(_SalesListState) _then;

/// Create a copy of SalesListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sales = null,Object? page = null,Object? limit = null,Object? total = null,Object? totalPages = null,Object? search = null,Object? isLoading = null,Object? errorMessage = freezed,Object? toastMessage = freezed,}) {
  return _then(_SalesListState(
sales: null == sales ? _self._sales : sales // ignore: cast_nullable_to_non_nullable
as List<Sale>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,toastMessage: freezed == toastMessage ? _self.toastMessage : toastMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
