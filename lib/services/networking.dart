import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  NetworkHelper(this.url, this.unencodedPath, this.queryParams);

  final String url;
  final String unencodedPath;
  final dynamic queryParams;

  Future getData() async {
    Uri uri = Uri.https(url, unencodedPath, queryParams);
    http.Response response = await http.get(uri);

    if(response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.body);
    }
  }
}