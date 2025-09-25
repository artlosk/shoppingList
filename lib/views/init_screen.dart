import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/views/loading.dart';
import 'package:shopping_list/views/login_view.dart';
import 'package:shopping_list/observables/auth_observable.dart';
import 'package:shopping_list/observables/firestore_observable.dart';
import 'package:shopping_list/views/wrapper_view.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final stateAuth = Provider.of<AuthState>(context);
    return Observer(
      builder: (_) {
        return stateAuth.loggedIn
            ? StreamBuilder(
                stream: stateAuth.onAuthStateChanged,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingView();
                  }
                  return Provider(
                    create: (context) => MobxFirestore(userUid: snapshot.data),
                    child: WrapperView(),
                  );
                },
              )
            : Scaffold(
                appBar: AppBar(
                  title: const Text('Авторизация'),
                ),
                body: const LoginView(),
              );
      },
    );
  }
}
