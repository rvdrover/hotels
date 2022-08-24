import 'dart:convert';

import 'package:hotels/models/hotels.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

//Get Data From Url and Map It into the Hotels Class 

class HttpServices {
  Future<Hotels> getData() async {
    Response response = await http.get(Uri.parse(
        'https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json'));
    if (response.statusCode == 200) {
      return Hotels.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Hotels');
    }
  }
}
