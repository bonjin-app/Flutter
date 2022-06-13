import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/common_size.dart';
import 'package:instagramtworecord/widgets/custom_progress_indicator.dart';

import 'rounded_avatar.dart';

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

    return Column(
      children: [
        _postHeader(),
        _postImage(),
        _postActions(),
      ],
    );
  }

  Row _postActions() {
    return Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage('assets/images/bookmark.png'),
              color: Colors.black87,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage('assets/images/comment.png'),
              color: Colors.black87,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage('assets/images/direct_message.png'),
              color: Colors.black87,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage('assets/images/heart_selected.png'),
              color: Colors.black87,
            ),
          ),
        ],
      );
  }

  Widget _postHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(common_xxs_gap),
          child: RoundedAvatar(),
        ),
        Expanded(
          child: Text(
            'username',
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/2000/2000',
      placeholder: (context, url) {
        return CustomProgressIndicator(containerSize: size!.width);
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
