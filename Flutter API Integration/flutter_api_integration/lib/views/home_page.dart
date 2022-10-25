import 'package:flutter/material.dart';
import 'package:flutter_api_integration/models/album.dart';
import 'package:flutter_api_integration/services/remote_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Albums>? albums; // to store fetched data from api call
  var isLoaded = false; // to check if data is loaded or not

  @override
  void initState() {
    super.initState();
    fetchData(); // initState() is used to load data when page initializes
  }

  // we are fetching data from API on server, so we need to use Asyncronous function
  fetchData() async {
    // to fetch data from api
    albums = await RemoteService().getAlbums();

    if (albums != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Integration')),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: albums?.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              child: Text(
                  "User id: ${albums?[index].userId},  Id: ${albums?[index].id}, Title: ${albums?[index].title}"),
            );
          },
        ),
        replacement: const Center(
          // if visible is false, then replacement will be displayed
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
