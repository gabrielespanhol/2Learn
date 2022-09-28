import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> downloadURL(String imagename) async {
    String downloadURL =
        await storage.ref("Fotostutores/$imagename").getDownloadURL();

    return downloadURL;
  }

  uploadImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'png',
      ],
    );

    if (result != null && result.files.isNotEmpty) {
      final fileBytes = result.files.first.bytes;

      // upload file
      await storage
          .ref('Fotostutores/${FirebaseAuth.instance.currentUser!.uid}.png')
          .putData(fileBytes!);
    }
  }
}
