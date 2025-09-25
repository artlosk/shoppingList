// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_observable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxFirestore on MobxFirestoreBase, Store {
  late final _$isLoadingAtom = Atom(
    name: 'MobxFirestoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$productsAtom = Atom(
    name: 'MobxFirestoreBase.products',
    context: context,
  );

  @override
  List<ShoppingListModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ShoppingListModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$filterAtom = Atom(
    name: 'MobxFirestoreBase.filter',
    context: context,
  );

  @override
  ShoppingFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(ShoppingFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$orderAtom = Atom(
    name: 'MobxFirestoreBase.order',
    context: context,
  );

  @override
  ShoppingOrder get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(ShoppingOrder value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$createDocIfNotExistAsyncAction = AsyncAction(
    'MobxFirestoreBase.createDocIfNotExist',
    context: context,
  );

  @override
  Future<void> createDocIfNotExist(UserModel? model) {
    return _$createDocIfNotExistAsyncAction.run(
      () => super.createDocIfNotExist(model),
    );
  }

  late final _$setItemsByUserAsyncAction = AsyncAction(
    'MobxFirestoreBase.setItemsByUser',
    context: context,
  );

  @override
  Future<dynamic> setItemsByUser(ShoppingListModel model) {
    return _$setItemsByUserAsyncAction.run(() => super.setItemsByUser(model));
  }

  late final _$deleteItemByUserAsyncAction = AsyncAction(
    'MobxFirestoreBase.deleteItemByUser',
    context: context,
  );

  @override
  Future<dynamic> deleteItemByUser(ShoppingListModel model) {
    return _$deleteItemByUserAsyncAction.run(
      () => super.deleteItemByUser(model),
    );
  }

  late final _$deleteItemsByUserAsyncAction = AsyncAction(
    'MobxFirestoreBase.deleteItemsByUser',
    context: context,
  );

  @override
  Future<dynamic> deleteItemsByUser() {
    return _$deleteItemsByUserAsyncAction.run(() => super.deleteItemsByUser());
  }

  late final _$setIsBuyFlagByUserAsyncAction = AsyncAction(
    'MobxFirestoreBase.setIsBuyFlagByUser',
    context: context,
  );

  @override
  Future<dynamic> setIsBuyFlagByUser(ShoppingListModel model) {
    return _$setIsBuyFlagByUserAsyncAction.run(
      () => super.setIsBuyFlagByUser(model),
    );
  }

  late final _$MobxFirestoreBaseActionController = ActionController(
    name: 'MobxFirestoreBase',
    context: context,
  );

  @override
  CollectionReference<UserModel> getItems() {
    final _$actionInfo = _$MobxFirestoreBaseActionController.startAction(
      name: 'MobxFirestoreBase.getItems',
    );
    try {
      return super.getItems();
    } finally {
      _$MobxFirestoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  DocumentReference<UserModel> getItemsByUserStream(
    dynamic filter,
    dynamic order,
  ) {
    final _$actionInfo = _$MobxFirestoreBaseActionController.startAction(
      name: 'MobxFirestoreBase.getItemsByUserStream',
    );
    try {
      return super.getItemsByUserStream(filter, order);
    } finally {
      _$MobxFirestoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<ShoppingListModel>> getItemsByUserFuture() {
    final _$actionInfo = _$MobxFirestoreBaseActionController.startAction(
      name: 'MobxFirestoreBase.getItemsByUserFuture',
    );
    try {
      return super.getItemsByUserFuture();
    } finally {
      _$MobxFirestoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
products: ${products},
filter: ${filter},
order: ${order}
    ''';
  }
}
