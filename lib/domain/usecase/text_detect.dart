import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:residencial/domain/usecase/take_photo.dart';

class TextDetectUseCase {
  TakePhotoUseCase _takePhotoUseCase;
  final TextRecognizer textRecognizer =
      FirebaseVision.instance.textRecognizer();
  VisionText visionText;
  FirebaseVisionImage visionImage;

  Future<String> call() async {
    _takePhotoUseCase = TakePhotoUseCase();
    visionImage = FirebaseVisionImage.fromFile(File(await _takePhotoUseCase()));
    visionText = await textRecognizer.processImage(visionImage);
    return visionText.text;
  }
}
