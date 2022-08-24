import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotels/services/firebase_auth_services.dart';

class SignIn {
  bool isLoading;
  dynamic error;

  SignIn({
    this.isLoading = false,
    this.error,
  });
}

class SignInNotifier extends StateNotifier<SignIn> {
  SignInNotifier() : super(SignIn());

  Future<void> _signIn(Future<UserCredential?> signInMethod) async {
    try {
      state = SignIn(error: null);
      state = SignIn(isLoading: true);
      await signInMethod;
    } catch (e) {
      state = SignIn(error: e);
      rethrow;
    } finally {
      state = SignIn(isLoading: false);
    }
  }

  Future<void> signInWithFacebook(
      BuildContext context, FirebaseAuthServices firebaseAuth) async {
    return await _signIn(firebaseAuth.signInWithFacebookManager(context));
  }
}
