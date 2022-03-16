import 'package:e_learning/models/pdf.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseApi {
  static Future<List<String>> listAllDir(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    List<String> u = <String>[];
    result.prefixes.forEach((element) {
      u.add(element.name);
    });
    return u;
  }

  static Future<List<PDF>> listAllFiles(String path) async{
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    final urls = await _getDownloadLinks(result.items);

    List<PDF> u = <PDF>[];
    int i = 0;
    for (var element in result.items) {
      u.add(PDF(element.name, urls[i]) );
      i++;
    }
    return u;
  }

  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());
}

// reference:
// https://github.com/JohannesMilke/firebase_download_example/blob/master/lib/api/firebase_api.dart