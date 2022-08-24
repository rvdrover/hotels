import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:hotels/widgets/alerts/exception_alert_dialog.dart';

//Sign In FirebaseAutServices for FaceBook Sign In
class FirebaseAuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithFacebookManager(
      BuildContext context) async {
    final LoginResult authResult = await FacebookAuth.instance.login();
    if (authResult.status == LoginStatus.success) {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(authResult.accessToken!.token);

      await auth.signInWithCredential(credential);
    } else if (authResult.status == LoginStatus.cancelled) {
      // throw PlatformException(code: 'ERROR_ABORTED_BY_USER', message: result.message);
      return null;
    } else if (authResult.status == LoginStatus.failed) {
      throw PlatformException(code: '', message: authResult.message);
    }
    return null;
  }

  Future<void> signOut(
    BuildContext context,
  ) async {
    try {
      await auth.signOut();
      await FacebookAuth.instance.logOut();
    } catch (e) {
      showExceptionAlertDialog(
        context: context,
        title: 'Logout failed',
        exception: e,
      );
    }
  }
}
