import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> downloadURL(String imagename) async {
    String downloadURL =
        await storage.ref("Fotostutores/$imagename").getDownloadURL();

    return downloadURL;
  }
}
