import 'package:residencial/helpers/camera.dart';

class TakePhotoUseCase {
  Camera _camera;
  Future<String> call() async {
    _camera = Camera();
    await _camera.getImage();
    return _camera.path;
  }
}
