// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShoppingListModel {

 String get name; String get quantity; bool get isBuy;
/// Create a copy of ShoppingListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingListModelCopyWith<ShoppingListModel> get copyWith => _$ShoppingListModelCopyWithImpl<ShoppingListModel>(this as ShoppingListModel, _$identity);

  /// Serializes this ShoppingListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingListModel&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isBuy, isBuy) || other.isBuy == isBuy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,quantity,isBuy);

@override
String toString() {
  return 'ShoppingListModel(name: $name, quantity: $quantity, isBuy: $isBuy)';
}


}

/// @nodoc
abstract mixin class $ShoppingListModelCopyWith<$Res>  {
  factory $ShoppingListModelCopyWith(ShoppingListModel value, $Res Function(ShoppingListModel) _then) = _$ShoppingListModelCopyWithImpl;
@useResult
$Res call({
 String name, String quantity, bool isBuy
});




}
/// @nodoc
class _$ShoppingListModelCopyWithImpl<$Res>
    implements $ShoppingListModelCopyWith<$Res> {
  _$ShoppingListModelCopyWithImpl(this._self, this._then);

  final ShoppingListModel _self;
  final $Res Function(ShoppingListModel) _then;

/// Create a copy of ShoppingListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? quantity = null,Object? isBuy = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,isBuy: null == isBuy ? _self.isBuy : isBuy // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ShoppingListModel].
extension ShoppingListModelPatterns on ShoppingListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingListModel value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingListModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String quantity,  bool isBuy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShoppingListModel() when $default != null:
return $default(_that.name,_that.quantity,_that.isBuy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String quantity,  bool isBuy)  $default,) {final _that = this;
switch (_that) {
case _ShoppingListModel():
return $default(_that.name,_that.quantity,_that.isBuy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String quantity,  bool isBuy)?  $default,) {final _that = this;
switch (_that) {
case _ShoppingListModel() when $default != null:
return $default(_that.name,_that.quantity,_that.isBuy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShoppingListModel implements ShoppingListModel {
  const _ShoppingListModel({required this.name, required this.quantity, required this.isBuy});
  factory _ShoppingListModel.fromJson(Map<String, dynamic> json) => _$ShoppingListModelFromJson(json);

@override final  String name;
@override final  String quantity;
@override final  bool isBuy;

/// Create a copy of ShoppingListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingListModelCopyWith<_ShoppingListModel> get copyWith => __$ShoppingListModelCopyWithImpl<_ShoppingListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShoppingListModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingListModel&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isBuy, isBuy) || other.isBuy == isBuy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,quantity,isBuy);

@override
String toString() {
  return 'ShoppingListModel(name: $name, quantity: $quantity, isBuy: $isBuy)';
}


}

/// @nodoc
abstract mixin class _$ShoppingListModelCopyWith<$Res> implements $ShoppingListModelCopyWith<$Res> {
  factory _$ShoppingListModelCopyWith(_ShoppingListModel value, $Res Function(_ShoppingListModel) _then) = __$ShoppingListModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String quantity, bool isBuy
});




}
/// @nodoc
class __$ShoppingListModelCopyWithImpl<$Res>
    implements _$ShoppingListModelCopyWith<$Res> {
  __$ShoppingListModelCopyWithImpl(this._self, this._then);

  final _ShoppingListModel _self;
  final $Res Function(_ShoppingListModel) _then;

/// Create a copy of ShoppingListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? quantity = null,Object? isBuy = null,}) {
  return _then(_ShoppingListModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,isBuy: null == isBuy ? _self.isBuy : isBuy // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
