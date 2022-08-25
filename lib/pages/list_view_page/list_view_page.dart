import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotels/app_router.dart';
import 'package:hotels/providers/firebase_auth_services_provider/firebase_auth_services_provider.dart';
import 'package:hotels/providers/http_provider/http_provider.dart';
import 'package:hotels/services/firebase_auth_services.dart';
import 'package:hotels/widgets/alerts/alert_dialogs.dart';
import 'package:hotels/widgets/buttons/submit_button.dart';
import 'package:hotels/widgets/spinner/spinner.dart';

class ListViewPage extends ConsumerWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuthServices = ref.watch(firebaseAuthServicesProvider);
    final httpServices = ref.watch(httpServicesFutureProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("List View"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              firebaseAuthServices.auth.currentUser!.displayName!.isNotEmpty
                  ? firebaseAuthServices.auth.currentUser!.displayName!
                  : "User Name not Available",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              firebaseAuthServices.auth.currentUser!.email!.isNotEmpty
                  ? firebaseAuthServices.auth.currentUser!.email!
                  : "Email Not Available",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 150,
              child: SubmitButton(
                key: const Key("logOutBtn"),
                text: 'Logout',
                textColor: Colors.white,
                onPressed: () => _confirmLogOut(context, firebaseAuthServices),
                height: 40,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: httpServices.when(
                  data: (data) {
                    final hotel = data.data;
                    return ListView.builder(
                      itemCount: hotel!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: ListTile(
                              textColor: Colors.black,
                              title: Text(hotel[index].title!),
                              subtitle: Text(hotel[index].address!),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.black12,
                                backgroundImage: hotel[index]
                                        .image!
                                        .medium!
                                        .isNotEmpty
                                    ? NetworkImage(hotel[index].image!.medium!)
                                    : null,
                                child: hotel[index].image!.medium!.isNotEmpty
                                    ? const Icon(Icons.person, size: 20)
                                    : null,
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.detailsPage,
                                    arguments: hotel[index]);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  error: (err, __) => Text('Error: $err'),
                  loading: () => const Spinner()),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmLogOut(
      BuildContext context, FirebaseAuthServices firebaseAuthServices) async {
    final bool didRequestSignOut = await showAlertDialog(
          context: context,
          title: 'Logout',
          content: 'Are you sure that you want to logout?',
          cancelActionText: "Cancel",
          defaultActionText: 'Logout',
        ) ??
        false;
    if (didRequestSignOut == true) {
      // ignore: use_build_context_synchronously
      await firebaseAuthServices.signOut(context);
    }
  }
}
