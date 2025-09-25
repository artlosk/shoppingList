import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_list_model.freezed.dart';
part 'shopping_list_model.g.dart';

@freezed
abstract class ShoppingListModel with _$ShoppingListModel {
  const factory ShoppingListModel({
    required String name,
    required String quantity,
    required bool isBuy,
  }) = _ShoppingListModel;

  factory ShoppingListModel.fromJson(Map<String, Object?> json) =>
      _$ShoppingListModelFromJson(json);
}
