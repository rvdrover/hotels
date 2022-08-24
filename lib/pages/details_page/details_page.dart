import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotels/app_router.dart';
import 'package:hotels/models/hotels.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({
    Key? key,
    this.hotelData,
  }) : super(key: key);
  final HotelData? hotelData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Details"),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .pushNamed(AppRoutes.mapPage, arguments: hotelData),
              icon: const Icon(Icons.location_pin)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: 200,
                height: 200,
                child: Image.network(hotelData!.image!.medium!)),
            const SizedBox(
              height: 20,
            ),
            Text(
              hotelData!.title!,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              hotelData!.description!,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
