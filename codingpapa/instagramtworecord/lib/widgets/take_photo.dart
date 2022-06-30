import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/common_size.dart';
import 'package:instagramtworecord/constants/screen_size.dart';
import 'package:instagramtworecord/widgets/custom_progress_indicator.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({
    Key? key,
  }) : super(key: key);

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {

  CameraController? _controller;
  Widget _progress = CustomProgressIndicator(containerSize: 32);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
      future: availableCameras(),
      builder: (context, snapshot) {
        return Column(
          children: [
            Container(
              width: size.width,
              height: size.width,
              color: Colors.black,
              child: snapshot.hasData ? _getPreview(snapshot.data!) : _progress,
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(common_s_gap),
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(
                          width: 20,
                          color: Colors.black12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }
    );
  }

  Widget _getPreview(List<CameraDescription> cameras) {

    if(cameras.isNotEmpty) {
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
      return FutureBuilder(
          future: _controller!.initialize(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              return ClipRect(
                child: OverflowBox(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Container(
                      width: size.width,
                      height: size.width/_controller!.value.aspectRatio,
                      child: CameraPreview(
                          _controller!
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return _progress;
            }
          }
      );
    } else {
      return _progress;
    }
  }
}
