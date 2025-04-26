import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:soapah/router/app_router.dart';

class AuthProvider extends ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  late final StreamSubscription<dynamic> _subscription;

  AuthProvider() {
    _subscription = FirebaseAuth.instance.authStateChanges().listen((
      User? user,
    ) {
      currentUser = user;
      AppRouter.router.refresh();
      notifyListeners();
    });
  }

  User? currentUser;
  final formKey = GlobalKey<FormState>();

  bool loading = false;
  void showLoader() {
    loading = true;
    notifyListeners();
  }

  void hideLoader() {
    loading = false;
    notifyListeners();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool get authenticated => _firebaseAuth.currentUser != null;

  bool _startedValidation = false;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;
  String? generalAuthError;

  bool validateEmail() {
    emailError = null;
    generalAuthError = null;
    if (!_startedValidation) return true;

    final email = emailController.text;
    final RegExp emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (email.isEmpty) {
      emailError = 'Enter your email';
    } else if (!emailRegex.hasMatch(email)) {
      emailError = 'Invalid email';
    }
    notifyListeners();
    formKey.currentState?.validate();
    return emailError == null;
  }

  bool validatePassword() {
    passwordError = null;
    generalAuthError = null;
    if (!_startedValidation) return true;

    final password = passwordController.text;
    if (password.isEmpty) {
      passwordError = 'Enter your password';
    } else if (password.length <= 6) {
      passwordError = 'Password should be at least 6 characters';
    }

    notifyListeners();
    formKey.currentState?.validate();
    return passwordError == null;
  }

  bool validateConfirmPassword() {
    confirmPasswordError = null;
    generalAuthError = null;
    if (!_startedValidation) return true;

    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (confirmPassword.isEmpty) {
      confirmPasswordError = 'Confirm your password';
    } else if (password != confirmPassword) {
      confirmPasswordError = 'Passwords don\'t match';
    }

    notifyListeners();
    formKey.currentState?.validate();
    return confirmPasswordError == null;
  }

  bool obscurePasswords = true;
  void toggleObscurePassword() {
    obscurePasswords = !obscurePasswords;
    notifyListeners();
  }

  bool vaildateSignUpFields() {
    return validateEmail() && validatePassword() && validateConfirmPassword();
  }

  bool vaildateSignInFields() {
    return validateEmail() && validatePassword();
  }

  Future<void> continueWithGoogle() async {
    try {
      showLoader();
      generalAuthError = null;
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      currentUser = userCredential.user;
    } catch (e) {
      generalAuthError = e.toString();
    } finally {
      hideLoader();
    }
  }

  Future<void> continueWithFacebook() async {
    try {
      showLoader();
      generalAuthError = null;
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final token = loginResult.accessToken?.tokenString;
      if (token != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(token);

        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          facebookAuthCredential,
        );
        currentUser = userCredential.user;
      }
    } catch (e) {
      generalAuthError = e.toString();
    } finally {
      hideLoader();
    }
  }

  String _generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> continueWithApple() async {
    try {
      showLoader();
      generalAuthError = null;
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider(
        "apple.com",
      ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        oauthCredential,
      );
      currentUser = userCredential.user;
    } catch (e) {
      generalAuthError = e.toString();
    } finally {
      hideLoader();
    }
  }

  Future<void> signUp() async {
    try {
      showLoader();
      generalAuthError = null;
      _startedValidation = true;
      if (vaildateSignUpFields()) {
        final email = emailController.text;
        final password = passwordController.text;
        final userCredential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        currentUser = userCredential.user;
      }
    } catch (e) {
      generalAuthError = e.toString();
    } finally {
      hideLoader();
    }
  }

  Future<void> signIn() async {
    try {
      showLoader();
      generalAuthError = null;
      _startedValidation = true;
      if (vaildateSignInFields()) {
        final email = emailController.text;
        final password = passwordController.text;
        final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        currentUser = userCredential.user;
      }
    } catch (e) {
      generalAuthError = e.toString();
    } finally {
      hideLoader();
    }
  }

  void signOut() {
    try {
      showLoader();
      generalAuthError = null;
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();

      _firebaseAuth.signOut();
    } catch (e) {
      generalAuthError = e.toString();
    } finally {
      hideLoader();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    _subscription.cancel();
    super.dispose();
  }
}
