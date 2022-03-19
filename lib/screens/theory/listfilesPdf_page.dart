


import 'package:e_learning/screens/theory/pdf_view_page.dart';
import 'package:flutter/material.dart';

import '../../api/pdf_api.dart';
import '../../models/pdf.dart';

class Listfiles extends StatefulWidget {
  const Listfiles({required this.path, Key? key}) : super(key: key);
  final String path;

  @override
  State<Listfiles> createState() => _ListfilesState();
}

class _ListfilesState extends State<Listfiles> {
  late Future<List<PDF>> files;

  @override
  void initState() {
    super.initState();
    files = FirebaseApi.listAllFiles('Document/${widget.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chương ${this.widget.path}")),
      body: listfiles(),
    );

  }

  Widget listfiles() {
    return FutureBuilder<List<PDF>>(
        future: files,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                final pdfs = snapshot.data!;

                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: pdfs.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                          title: Text('Bài ${pdfs[index].name.split('.pdf')[0]}'),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PDFViewerPage(pdfs[index])));
                          },
                        ));
                  },
                );
              }
          }
        });
  }
}