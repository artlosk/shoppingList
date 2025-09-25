// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShoppingListModel _$ShoppingListModelFromJson(Map<String, dynamic> json) =>
    _ShoppingListModel(
      name: json['name'] as String,
      quantity: json['quantity'] as String,
      isBuy: json['isBuy'] as bool,
    );

Map<String, dynamic> _$ShoppingListModelToJson(_ShoppingListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'isBuy': instance.isBuy,
    };
