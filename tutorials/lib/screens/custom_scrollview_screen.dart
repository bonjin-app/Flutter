import 'package:flutter/material.dart';

class _SliverFixedHeader extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;

  _SliverFixedHeader(
      {required this.maxHeight, required this.minHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverFixedHeader oldDelegate) {
    return oldDelegate.maxHeight != maxHeight ||
        oldDelegate.minHeight != minHeight ||
        oldDelegate.child != child;
  }
}

class CustomScrollViewScreen extends StatefulWidget {
  const CustomScrollViewScreen({Key? key}) : super(key: key);

  @override
  State<CustomScrollViewScreen> createState() => _CustomScrollViewScreenState();
}

class _CustomScrollViewScreenState extends State<CustomScrollViewScreen> {
  getColor(index) {
    final color = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];

    return color[index % color.length];
  }

  Widget renderSliverAppbar() {
    return SliverAppBar(
        backgroundColor: Colors.black,
        title: Text('Seoul'),
        expandedHeight: 200.0,
        pinned: true,
        //   floating: true,
        flexibleSpace: Image.network(
          "https://addons-media.operacdn.com/media/CACHE/images/themes/35/95435/1.0-rev1/images/fcd1950c-9600-4667-8ad0-68f57eaa9564/0bf9658bd342f39f4807816200ff859d.jpg",
          fit: BoxFit.cover,
        ));
  }

  Widget renderHeader() {
    return SliverPersistentHeader(
      delegate: _SliverFixedHeader(
        minHeight: 75,
        maxHeight: 200,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
          child: Center(
            child: Text('신기하지!'),
          ),
        ),
      ),
      pinned: true,
    );
  }

  Widget renderSliverGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          color: getColor(index),
        );
      }, childCount: 32),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
    );
  }

  Widget renderSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          color: Colors.red,
          height: 200,
        ),
        Container(
          color: Colors.yellow,
          height: 200,
        ),
      ]),
    );
  }

  Widget renderSliverBuilderDelegate() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
        color: getColor(index),
        height: 100,
      );
    }, childCount: 8));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        renderSliverAppbar(),
        renderHeader(),
        renderSliverBuilderDelegate(),
        renderHeader(),
        renderSliverGrid(),
        renderHeader(),
        renderSliverBuilderDelegate(),
        renderHeader(),
        renderSliverGrid(),
      ],
    ));
  }
}
