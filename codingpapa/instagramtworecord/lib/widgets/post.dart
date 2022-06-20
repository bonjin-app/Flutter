import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/common_size.dart';
import 'package:instagramtworecord/widgets/custom_progress_indicator.dart';

import '../constants/screen_size.dart';
import 'comment.dart';
import 'rounded_avatar.dart';

class Post extends StatelessWidget {
  Post({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postHeader(),
        _postImage(),
        _postActions(),
        _postLikes(),
        _postCaption(),
      ],
    );
  }

  Widget _postCaption() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxs_gap),
      child: Comment(
        username: 'testingUser',
        text: 'I have money!!!',
        dateTime: DateTime.now(),
      ),
    );
  }

  Padding _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        '12000 likes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
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
          child: RoundedAvatar(
            size: avatar_size,
          ),
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
