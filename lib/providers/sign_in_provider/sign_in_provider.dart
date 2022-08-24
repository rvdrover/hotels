import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sign_in_notifier.dart';

final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignIn>((ref) => SignInNotifier());
