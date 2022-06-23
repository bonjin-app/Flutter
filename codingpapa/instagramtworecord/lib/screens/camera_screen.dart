import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int currentIndex = 1;
  String title = 'Photo';
  PageController _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            color: Colors.cyanAccent,
          ),
          Container(
            color: Colors.amberAccent,
          ),
          Container(
            color: Colors.greenAccent,
          ),
        ],
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;

            switch(currentIndex) {
              case 0:
                title = 'Gallery';
                break;
              case 1:
                title = 'Photo';
                break;
              case 2:
                title = 'Video';
                break;
            }
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        currentIndex: currentIndex,
        onTap: _onItemTabbed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked), label: 'GALLARY'),
          BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked), label: 'PHOTO'),
          BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked), label: 'VIDEO'),
        ],
      ),
    );
  }

  void _onItemTabbed(index) {
    setState(() {
      currentIndex = index;
      _pageController.animateToPage(currentIndex,
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    });
  }
}
