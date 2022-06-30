import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraState extends ChangeNotifier {
  late CameraController _cameraController;
  late CameraDescription _cameraDescription;
  bool _readyTakePhoto = false;

  void getReadyToTakePhoto() async {
    List<CameraDescription> cameras = await availableCameras();

    if (cameras.isNotEmpty) {
      setCameraDescription(cameras[0]);
    }

    bool init = false;
    while (!init) {
      init = await initialize();
    }

    _readyTakePhoto = true;
    notifyListeners();
  }

  void setCameraDescription(CameraDescription cameraDescription) {
    _cameraDescription = cameraDescription;
    _cameraController = CameraController(cameraDescription, ResolutionPreset.medium);
  }

  Future<bool> initialize() async {
    try {
      await _cameraController.initialize();
      return true;
    } catch (e) {
      return false;
    }
  }

  CameraController get controller => _cameraController;
  CameraDescription get description => _cameraDescription;
  bool get isReadyToTakePhoto => _readyTakePhoto;
}
