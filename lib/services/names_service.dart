import 'dart:ffi';

import 'package:http/http.dart' as http;

const String apiUrl = 'https://nawikurdi.com/api';

class NamesService {
  Future getData(String url) async {
    print("Calling Url: $url");

    http.Response response =
        await http.get(Uri.parse(url)).catchError((error) => print(error));

    if (response.statusCode == 200) {
      return response.body;
    }
  }

  Future<dynamic> getNames(
      int limit, int offset, String gender, String sort) async {
    print("LIMIT: $limit, OFFSET: $offset, GENEDER: $gender");
    final namesData = await getData(
        'https://nawikurdi.com/api?limit=$limit&gender=$gender&offset=$offset&sort=$sort');
    return namesData;
  }
}
