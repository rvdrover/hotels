import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hotels/providers/firebase_auth_services_provider/firebase_auth_services_provider.dart';
import 'package:hotels/providers/sign_in_provider/sign_in_notifier.dart';
import 'package:hotels/providers/sign_in_provider/sign_in_provider.dart';
import 'package:hotels/widgets/alerts/exception_alert_dialog.dart';
import 'package:hotels/widgets/buttons/submit_button.dart';
import 'package:hotels/widgets/spinner/spinner.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInNotifier = ref.watch(signInNotifierProvider.notifier);
    final signIn = ref.watch(signInNotifierProvider);
    final firebaseAuthServices = ref.watch(firebaseAuthServicesProvider);
    ref.listen<SignIn>(signInNotifierProvider, (_, signIn) async {
      if (signIn.error != null) {
        await showExceptionAlertDialog(
          context: context,
          title: "Sign in failed",
          exception: signIn.error,
        );
      }
    });//Listen The Sign In State and if error happen show alert box else go to the next view
    return Scaffold(
      body: signIn.isLoading
          ? const Spinner()
          : Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SubmitButton(
                      key: const Key("facebookBtn"),
                      text: 'Login with Facebook',
                      buttonColor: const Color(0xff415DAE),
                      textColor: Colors.white,
                      imagePath: ('assets/images/facebook-logo.png'),
                      onPressed: signIn.isLoading
                          ? null
                          : () => signInNotifier
                            ..signInWithFacebook(
                              context,
                              firebaseAuthServices,
                            ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
