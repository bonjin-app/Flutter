import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/screen_size.dart';
import 'package:instagramtworecord/widgets/profile_body.dart';
import 'package:instagramtworecord/widgets/profile_side_menu.dart';

const duration = Duration(milliseconds: 300);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final menuWidth = size.width / 3 * 2;

  MenuStatus _menuStatus = MenuStatus.closed;
  double bodyXPosition = 0;
  double menuXPosition = size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          AnimatedContainer(
            duration: duration,
            curve: Curves.easeInOut,
            child: ProfileBody(
              onMenuChanged: () {
                setState(() {
                  _menuStatus = _menuStatus == MenuStatus.closed
                      ? MenuStatus.opened
                      : MenuStatus.closed;

                  switch (_menuStatus) {
                    case MenuStatus.opened:
                      bodyXPosition = -menuWidth;
                      menuXPosition = size.width - menuWidth;
                      break;
                    case MenuStatus.closed:
                      bodyXPosition = 0;
                      menuXPosition = size.width;
                      break;
                  }
                });
              },
            ),
            transform: Matrix4.translationValues(bodyXPosition, 0, 0),
          ),
          AnimatedContainer(
            duration: duration,
            curve: Curves.easeInOut,
            child: ProfileSideMenu(
              menuWidth: menuWidth,
            ),
            transform: Matrix4.translationValues(menuXPosition, 0, 0),
          ),
        ],
      ),
    );
  }
}

enum MenuStatus {
  opened,
  closed,
}
