import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/screen_size.dart';

import '../constants/common_size.dart';

class ProfileBody extends StatefulWidget {
  ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  bool selectedLeft = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _username(),
                _userBio(),
                _editProfileButton(),
                _tabButtons(),
                _selectedIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      alignment: selectedLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        height: 3,
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.black87,
      ),
      curve: Curves.easeInOut,
    );
  }

  Row _tabButtons() {
    return Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          selectedLeft = true;
                        });
                      },
                      icon: ImageIcon(
                        AssetImage('assets/images/grid.png'),
                        color: selectedLeft ? Colors.black : Colors.black26,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          selectedLeft = false;
                        });
                      },
                      icon: ImageIcon(
                        AssetImage('assets/images/saved.png'),
                        color: selectedLeft ? Colors.black26 : Colors.black,
                      ),
                    ),
                  ),
                ],
              );
  }

  Padding _editProfileButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxs_gap),
      child: SizedBox(
        height: 24,
        child: OutlinedButton(
          onPressed: () {},
          child: Text(
            'Edit Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            primary: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'username',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _userBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'this is what I believe!!',
        style: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
