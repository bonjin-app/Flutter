import 'package:actual/common/const/data.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  Future<List> paginateRestaurant() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final response = await dio.get('http://$ip/restaurant',
        options: Options(
          headers: {'authorization': 'Bearer $accessToken'},
        ));

    return response.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<List>(
            future: paginateRestaurant(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              print(snapshot.data);
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.separated(
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return RestaurantCard(
                    image: Image.network(
                      'http://$ip${item['thumbUrl']}',
                      fit: BoxFit.cover,
                    ),
                    // image: Image.asset(
                    //   'asset/img/food/ddeok_bok_gi.jpg',
                    //   fit: BoxFit.cover,
                    // ),
                    name: item['name'],
                    tags: List<String>.from(item['tags']),
                    ratingsCount: item['ratingsCount'],
                    deliveryTime: item['deliveryTime'],
                    deliveryFee: item['deliveryFee'],
                    ratings: item['ratings'],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: snapshot.data!.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
