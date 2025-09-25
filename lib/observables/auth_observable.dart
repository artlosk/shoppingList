import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_list/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_list/firebase_options.dart';

part 'auth_observable.g.dart';

class AuthState = AuthStateBase with _$AuthState;

abstract class AuthStateBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  AuthStateBase() {
    // Listen to Firebase Auth state changes
    _auth.authStateChanges().listen((User? user) {
      _updateAuthState(user);
    });
    
    // Initialize Google Sign-In
    _initializeGoogleSignIn();
  }

  @observable
  bool loggedIn = false;

  @observable
  String _errorMessage = '';

  @computed
  String get errorMessage => _errorMessage;

  @computed
  User? get currentUser => _auth.currentUser;

  @action
  void _updateAuthState(User? user) {
    loggedIn = user != null;
    debugPrint('Auth state changed: ${loggedIn ? "logged in" : "logged out"}');
  }

  @action
  Future<void> _initializeGoogleSignIn() async {
    try {
      if (kIsWeb) {
        // For web platform, use Web Client ID
        await _googleSignIn.initialize(
          clientId: DefaultFirebaseOptions.webClientId,
        );
        debugPrint('Google Sign-In initialized for web platform');
      } else if (defaultTargetPlatform == TargetPlatform.macOS) {
        // For macOS platform, use macOS Client ID
        await _googleSignIn.initialize(
          clientId: DefaultFirebaseOptions.macosClientId,
          serverClientId: DefaultFirebaseOptions.webClientId,
        );
        debugPrint('Google Sign-In initialized for macOS platform');
      } else {
        // For mobile platforms (iOS/Android), use iOS Client ID
        await _googleSignIn.initialize(
          clientId: DefaultFirebaseOptions.mobileClientId,
          serverClientId: DefaultFirebaseOptions.webClientId,
        );
        debugPrint('Google Sign-In initialized for mobile platform');
      }
    } catch (e) {
      debugPrint('Error initializing Google Sign-In: $e');
    }
  }

  @action
  Future<void> signIn() async {
    try {
      _errorMessage = '';
      debugPrint('Starting authentication...');

      if (kIsWeb) {
        // Web platform: Use Firebase popup authentication
        debugPrint('Using Firebase popup for web platform');
        
        final GoogleAuthProvider googleProvider = GoogleAuthProvider();
        
        final UserCredential result = await _auth.signInWithPopup(googleProvider);

        if (result.user?.uid != null) {
          debugPrint('Successful authentication: ${result.user?.email}');
          _errorMessage = '';
        } else {
          _errorMessage = 'Failed to retrieve user data';
        }
      } else {
        // Mobile platforms (iOS/Android): Use Google Sign-In
        debugPrint('Using Google Sign-In for mobile platform');

        final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();

        if (googleUser == null) {
          debugPrint('Authentication cancelled by user');
          _errorMessage = 'Authentication cancelled';
          return;
        }

        // Get tokens through authorizationHeaders
        const List<String> scopes = <String>['email', 'profile'];
        final Map<String, String>? headers = await googleUser.authorizationClient
            .authorizationHeaders(scopes);
        
        if (headers == null || !headers.containsKey('Authorization')) {
          debugPrint('Failed to retrieve authorization headers');
          _errorMessage = 'Failed to retrieve authorization headers';
          return;
        }
        
        final String? accessToken = headers['Authorization']?.replaceFirst('Bearer ', '');
        final GoogleSignInAuthentication googleAuth = googleUser.authentication;
        
        if (accessToken == null || googleAuth.idToken == null) {
          debugPrint('Failed to retrieve accessToken or idToken');
          _errorMessage = 'Failed to retrieve authentication tokens';
          return;
        }

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
        );

        final UserCredential result = await _auth.signInWithCredential(credential);

        if (result.user?.uid != null) {
          debugPrint('Successful authentication: ${result.user?.email}');
          _errorMessage = '';
        } else {
          _errorMessage = 'Failed to retrieve user data';
        }
      }
    } catch (e) {
      debugPrint('Authentication error: $e');
      _errorMessage = 'Authentication error: $e';
    }
  }

  @action
  Future<bool> signOut() async {
    try {
      debugPrint('Signing out...');

      // Sign out from Google Sign-In
      await _googleSignIn.signOut();

      // Sign out from Firebase
      await _auth.signOut();

      _errorMessage = '';
      debugPrint('Successful sign out');
      return true;
    } catch (e) {
      debugPrint('Sign out error: $e');
      _errorMessage = 'Sign out error: $e';
      return false;
    }
  }

  Stream<String?> get onAuthStateChanged {
    return _auth.authStateChanges().map((User? user) => user?.uid);
  }

  // Create user model from Firebase User
  UserModel? get userModel {
    final user = currentUser;
    if (user == null) return null;

    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
    );
  }
}