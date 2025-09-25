import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_list/enums/filter.dart';
import 'package:shopping_list/enums/order.dart';
import 'package:shopping_list/models/shopping_list_model.dart';
import 'package:shopping_list/models/user_model.dart';

part 'firestore_observable.g.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class MobxFirestore = MobxFirestoreBase with _$MobxFirestore;

abstract class MobxFirestoreBase with Store {
  static const collection = 'users';

  final String userUid;

  MobxFirestoreBase({required this.userUid});

  @observable
  bool isLoading = false;

  @observable
  List<ShoppingListModel> products = [];

  @observable
  ShoppingFilter filter = ShoppingFilter.all;

  @observable
  ShoppingOrder order = ShoppingOrder.none;

  @action
  CollectionReference<UserModel> getItems() {
    return _firestore.collection(collection).withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  @action
  Future<void> createDocIfNotExist(UserModel? model) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await _firestore.collection(collection).doc(model?.uid).get();
    if (!doc.exists) {
      _firestore.collection(collection).doc(model?.uid).set({
        'uid': model?.uid,
        'email': model?.email,
        'displayName': model?.displayName,
        'shoppingList': []
      });
    }
  }

  @action
  DocumentReference<UserModel> getItemsByUserStream(dynamic filter, dynamic order) {
    return _firestore
        .collection(collection)
        .doc(userUid)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) {
            final userModel = UserModel.fromJson(snapshot.data()!);
            List<ShoppingListModel> filteredProducts = List.from(userModel.shoppingList);
            
            // Применяем фильтрацию
            switch(filter) {
              case ShoppingFilter.bought:
                filteredProducts = filteredProducts.where((element) => element.isBuy == true).toList();
                break;
              case ShoppingFilter.waiting:
                filteredProducts = filteredProducts.where((element) => element.isBuy == false).toList();
                break;
              default:
                // Все товары
                break;
            }
            
            // Применяем сортировку
            switch(order) {
              case ShoppingOrder.bought:
                // Сортировка: купленные сверху, некупленные снизу
                filteredProducts.sort((a, b) {
                  if (a.isBuy && !b.isBuy) return -1; // купленные вверх
                  if (!a.isBuy && b.isBuy) return 1; // некупленные вниз
                  return 0; // одинаковый статус
                });
                break;
              case ShoppingOrder.waiting:
                // Сортировка: некупленные сверху, купленные снизу
                filteredProducts.sort((a, b) {
                  if (!a.isBuy && b.isBuy) return -1; // некупленные вверх
                  if (a.isBuy && !b.isBuy) return 1; // купленные вниз
                  return 0; // одинаковый статус
                });
                break;
              default:
                // Сортировка по умолчанию - некупленные сверху, купленные снизу
                filteredProducts.sort((a, b) {
                  if (!a.isBuy && b.isBuy) return -1;
                  if (a.isBuy && !b.isBuy) return 1;
                  return 0;
                });
                break;
            }
            
            // Обновляем products для отображения
            products = filteredProducts;
            
            // Возвращаем UserModel с отфильтрованными и отсортированными товарами
            return UserModel(
              uid: userModel.uid,
              email: userModel.email,
              displayName: userModel.displayName,
              shoppingList: filteredProducts,
            );
          },
          toFirestore: (user, _) => user.toJson(),
        );
  }

  @action
  Future<List<ShoppingListModel>> getItemsByUserFuture() {
    final list = _firestore
        .collection(collection)
        .doc(userUid)
        .get()
        .then((value) => UserModel.fromJson(value.data()!).shoppingList);
    return list;
  }

  @action
  Future setItemsByUser(ShoppingListModel model) async {
    await _firestore.collection(collection).doc(userUid).set(
      {
        'shoppingList': FieldValue.arrayUnion([model.toJson()])
      },
      SetOptions(merge: true),
    );
  }

  @action
  Future deleteItemByUser(ShoppingListModel model) async {
    await _firestore
        .collection(collection)
        .doc(userUid)
        .update({
      'shoppingList': FieldValue.arrayRemove([model.toJson()]),
    });
  }

  @action
  Future deleteItemsByUser() async {
    await _firestore
        .collection(collection)
        .doc(userUid)
        .update({'shoppingList': []});
  }

  @action
  Future setIsBuyFlagByUser(ShoppingListModel model) async {
    final list = await _firestore
        .collection(collection)
        .doc(userUid)
        .get();

    final data = list.data();
    final List shoppingList = data!['shoppingList']
        .map((item) => item as Map<String, dynamic>)
        .toList();
    
    // Находим товар и обновляем его статус
    final Map product = shoppingList.firstWhere((item) =>
        item['name'] == model.name && item['quantity'] == model.quantity);
    final bool newIsBuy = !model.isBuy;
    product['isBuy'] = newIsBuy;

    // Сортируем список: некупленные сверху, купленные снизу
    shoppingList.sort((a, b) {
      final bool aIsBuy = a['isBuy'] as bool;
      final bool bIsBuy = b['isBuy'] as bool;
      if (!aIsBuy && bIsBuy) return -1; // некупленные вверх
      if (aIsBuy && !bIsBuy) return 1;  // купленные вниз
      return 0; // одинаковый статус
    });

    await _firestore.collection(collection).doc(userUid).update({
      'shoppingList': shoppingList
    });
  }
}
