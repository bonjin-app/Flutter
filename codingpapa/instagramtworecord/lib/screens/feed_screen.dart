import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.photo_camera_solid,
            color: Colors.black87,
          ),
        ),
        middle: Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'VeganStyle',
            color: Colors.black87,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(
                  'assets/images/actionbar_camera.png',
                ),
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(
                  'assets/images/actionbar_camera.png',
                ),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: _buildItems,
        itemCount: 30,
      ),
    );
  }

  Widget _buildItems(BuildContext context, int index) {
    return Container(
      color: Colors.accents[index % Colors.accents.length],
      height: 100,
    );
  }
}
