import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotels/models/hotels.dart';
import 'package:hotels/services/http_services.dart';

final httpServicesProvider = Provider<HttpServices>((ref) => HttpServices());

final httpServicesFutureProvider =
    FutureProvider.autoDispose<Hotels>((ref) async {
  return ref.watch(httpServicesProvider).getData();
});
