// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_observable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthState on AuthStateBase, Store {
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage => (_$errorMessageComputed ??= Computed<String>(
    () => super.errorMessage,
    name: 'AuthStateBase.errorMessage',
  )).value;
  Computed<User?>? _$currentUserComputed;

  @override
  User? get currentUser => (_$currentUserComputed ??= Computed<User?>(
    () => super.currentUser,
    name: 'AuthStateBase.currentUser',
  )).value;

  late final _$loggedInAtom = Atom(
    name: 'AuthStateBase.loggedIn',
    context: context,
  );

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
    name: 'AuthStateBase._errorMessage',
    context: context,
  );

  @override
  String get _errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  set _errorMessage(String value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_initializeGoogleSignInAsyncAction = AsyncAction(
    'AuthStateBase._initializeGoogleSignIn',
    context: context,
  );

  @override
  Future<void> _initializeGoogleSignIn() {
    return _$_initializeGoogleSignInAsyncAction.run(
      () => super._initializeGoogleSignIn(),
    );
  }

  late final _$signInAsyncAction = AsyncAction(
    'AuthStateBase.signIn',
    context: context,
  );

  @override
  Future<void> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  late final _$signOutAsyncAction = AsyncAction(
    'AuthStateBase.signOut',
    context: context,
  );

  @override
  Future<bool> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$AuthStateBaseActionController = ActionController(
    name: 'AuthStateBase',
    context: context,
  );

  @override
  void _updateAuthState(User? user) {
    final _$actionInfo = _$AuthStateBaseActionController.startAction(
      name: 'AuthStateBase._updateAuthState',
    );
    try {
      return super._updateAuthState(user);
    } finally {
      _$AuthStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loggedIn: ${loggedIn},
errorMessage: ${errorMessage},
currentUser: ${currentUser}
    ''';
  }
}
