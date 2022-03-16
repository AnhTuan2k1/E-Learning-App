import 'package:e_learning/pdf_view_page.dart';
import 'package:flutter/material.dart';

import 'api/firebase_api.dart';
import 'listfilesPdf_page.dart';
import 'models/pdf.dart';

class TheoryPage extends StatefulWidget {
  const TheoryPage({Key? key}) : super(key: key);

  @override
  State<TheoryPage> createState() => _TheoryPageState();
}

class _TheoryPageState extends State<TheoryPage> {
  late Future<List<String>> folders;

  @override
  void initState() {
    super.initState();
    folders = FirebaseApi.listAllDir("Document");
  }

  @override
  Widget build(BuildContext context) {
    return listfolders();
  }

  Widget listfolders() {
    return FutureBuilder<List<String>>(
        future: folders,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                final directories = snapshot.data!;

                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: directories.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                          title: Text(' ${directories[index]}'),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Listfiles(path: directories[index])));
                          },
                        ));
                  },
                );
              }
          }
        });
  }

}



// reference
// https://github.com/JohannesMilke/firebase_download_example/blob/master/lib/main.dart
