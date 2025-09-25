import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/enums/filter.dart';
import 'package:shopping_list/enums/order.dart';
import 'package:shopping_list/views/loading.dart';
import 'package:shopping_list/observables/firestore_observable.dart';
import 'package:shopping_list/views/shopping_list_view.dart';

import '../models/user_model.dart';
import '../observables/auth_observable.dart';

class WrapperView extends StatelessWidget {
  WrapperView({super.key});

  final storage = FirebaseStorage.instance;

  static const String nameBackground = 'background_shopping_list.jpg';

  @override
  Widget build(BuildContext context) {
    final stateAuth = Provider.of<AuthState>(context);
    final stateUser = Provider.of<MobxFirestore>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100, // Увеличиваем высоту AppBar
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12), // Увеличиваем отступ сверху
                  child: Text(
                    'Список покупок',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    stateAuth.signOut();
                  },
                  icon: const Icon(Icons.logout, size: 20),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Observer(
                      builder: (_) {
                        return PopupMenuButton(
                          icon: const Icon(Icons.remove_red_eye, size: 20),
                          onSelected: (result) {
                            switch (result) {
                              case ShoppingFilter.all:
                                stateUser.filter = ShoppingFilter.all;
                                break;
                              case ShoppingFilter.bought:
                                stateUser.filter = ShoppingFilter.bought;
                                break;
                              case ShoppingFilter.waiting:
                                stateUser.filter = ShoppingFilter.waiting;
                                break;
                              default:
                            }
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                            const PopupMenuItem(
                              value: ShoppingFilter.all,
                              child: Text('Все'),
                            ),
                            const PopupMenuItem(
                              value: ShoppingFilter.bought,
                              child: Text('Куплено'),
                            ),
                            const PopupMenuItem(
                              value: ShoppingFilter.waiting,
                              child: Text('В ожидание'),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(width: 8),
                    Observer(
                      builder: (_) {
                        return PopupMenuButton(
                          icon: const Icon(Icons.filter_list_alt, size: 20),
                          onSelected: (result) {
                            switch (result) {
                              case ShoppingOrder.none:
                                stateUser.order = ShoppingOrder.none;
                                break;
                              case ShoppingOrder.bought:
                                stateUser.order = ShoppingOrder.bought;
                                break;
                              case ShoppingOrder.waiting:
                                stateUser.order = ShoppingOrder.waiting;
                                break;
                              default:
                            }
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                            const PopupMenuItem(
                              value: ShoppingOrder.none,
                              child: Text('По умолчанию'),
                            ),
                            const PopupMenuItem(
                              value: ShoppingOrder.bought,
                              child: Text('Куплено'),
                            ),
                            const PopupMenuItem(
                              value: ShoppingOrder.waiting,
                              child: Text('В ожидание'),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    stateUser.deleteItemsByUser();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red[200]!, width: 1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.delete_sweep,
                          size: 14,
                          color: Colors.red[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Очистить',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: FutureBuilder<UserModel>(
        future: Future.value(stateAuth.userModel),
        builder: (context, snapshotUser) {
          if (snapshotUser.hasData && snapshotUser.data != null) {
            stateUser.createDocIfNotExist(snapshotUser.data!);
            return FutureBuilder<String>(
              future: storage.ref(nameBackground).getDownloadURL(),
              builder: (context, snapshotImage) {
                if (snapshotImage.connectionState == ConnectionState.waiting) {
                  return const LoadingView();
                }
                if (snapshotImage.hasData || snapshotImage.data != null) {
                  return DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(snapshotImage.data!),
                          fit: BoxFit.cover,
                          opacity: 0.1,
                        ),
                      ),
                      child: ShoppingListView());
                }
                return ShoppingListView();
              },
            );
          }
          return const LoadingView();
        },
      ),
    );
  }
}
