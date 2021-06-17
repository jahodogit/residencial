import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class Camera {
  late File imagen;
  final picker = ImagePicker();
  late String path;

  Future<void> getImage() async {
    final PickedFile? pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 10);

    imagen = File(pickedFile!.path);
    var directory = await getApplicationDocumentsDirectory();
    //Generate temporal image name
    String randomName = Random().nextInt(5000).toString();
    path = "${directory.path}/$randomName.jpg";
    imagen.copy(path);
  }
}
