import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotels/app_router.dart';
import 'package:hotels/auth_widget.dart';
import 'package:hotels/constants/theme.dart';
import 'package:hotels/pages/list_view_page/list_view_page.dart';
import 'pages/login_page/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      color: const Color.fromARGB(255, 0, 145, 148),
      home: AuthWidget(
        nonSignedInBuilder: (_) => const LoginPage(),
        signedInBuilder: (_) => const ListViewPage(),
      ), //Auth Widget For check What is the auth state

      onGenerateRoute: (settings) =>
          AppRouter.onGenerateRoute(settings), //Use On Generate Route
    );
  }
}
