import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotels/services/firebase_auth_services.dart';
final firebaseAuthServicesProvider =
    Provider<FirebaseAuthServices>((ref) => FirebaseAuthServices());
