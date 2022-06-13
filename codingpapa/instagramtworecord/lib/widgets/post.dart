import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/200/300',
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
