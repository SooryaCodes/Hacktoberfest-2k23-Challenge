import 'package:flutter_api_integration/models/album.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  // data to be returned in Future in list of Albums
  Future<List<Albums>?> getAlbums() async {
    // to make and persist (connection) http requests from server
    var client = http.Client();

    // URI: parsed url
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums");

    // url response from server (if url is accessible)
    var response = await client.get(url);

    // 200 status code means, successful url response
    if (response.statusCode == 200) {
      var json = response.body; // complete json string

      // albumsFromJson() is model defined in album.dart
      return albumsFromJson(json);
    } else {
      return null;
    }
  }
}
