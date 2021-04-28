import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class Camera {
  File imagen;
  final picker = ImagePicker();
  String path;

  Future<void> getImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 10);

    imagen = File(pickedFile.path);
    var directory = await getApplicationDocumentsDirectory();
    String nombreRandom = Random().nextInt(5000).toString();
    path = "${directory.path}/$nombreRandom.jpg";
    imagen.copy(path);
  }
}
