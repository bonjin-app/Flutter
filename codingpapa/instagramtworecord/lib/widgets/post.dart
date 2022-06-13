import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  Post({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size;

    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/2000/2000',
      placeholder: (context, url) {
        return Container(
          child: Center(
            child: SizedBox(
              child: CircularProgressIndicator(backgroundColor: Colors.black),
              width: 60,
              height: 60,
            ),
          ),
          width: size!.width,
          height: size!.width,
        );
      },
      imageBuilder: (context, imageProvider) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
