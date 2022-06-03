import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Instagram',
                  style: TextStyle(fontFamily: "Billabong",fontSize: 32),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.live_tv),
                      iconSize: 30,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 35,
                      child: IconButton(
                        onPressed: () => {},
                        icon: Icon(Icons.send),
                        iconSize: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
