import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/screen_size.dart';

import '../constants/common_size.dart';

class ProfileBody extends StatefulWidget {
  ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagesMargin = 0;
  double _rightImagesMargin = size.width;

  @override
  Widget build(BuildContext context) {

    print(size.width);

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
          _imagesPager(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                transform: Matrix4.translationValues(_leftImagesMargin, 0, 0),
                curve: Curves.easeInOut,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  childAspectRatio: 1,
                  children: List.generate(
                    30,
                    (index) => CachedNetworkImage(
                      imageUrl: "https://picsum.photos/id/$index/100/100",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                transform: Matrix4.translationValues(_rightImagesMargin, 0, 0),
                curve: Curves.easeInOut,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  childAspectRatio: 1,
                  children: List.generate(
                    30,
                        (index) => CachedNetworkImage(
                      imageUrl: "https://picsum.photos/id/$index/100/100",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      alignment: _selectedTab == SelectedTab.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
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
                _selectedTab = SelectedTab.left;
                _leftImagesMargin = 0;
                _rightImagesMargin = size.width;
              });
            },
            icon: ImageIcon(
              AssetImage('assets/images/grid.png'),
              color: _selectedTab == SelectedTab.left
                  ? Colors.black
                  : Colors.black26,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              setState(() {
                _selectedTab = SelectedTab.right;
                _leftImagesMargin = -size.width;
                _rightImagesMargin = 0;
              });
            },
            icon: ImageIcon(
              AssetImage('assets/images/saved.png'),
              color: _selectedTab == SelectedTab.left
                  ? Colors.black26
                  : Colors.black,
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

enum SelectedTab {
  left,
  right,
}
