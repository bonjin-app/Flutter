import 'package:actual/common/const/data.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:actual/restaurant/view/restaurant_detail_screen.dart';
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FutureBuilder<List>(
          future: paginateRestaurant(),
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                final pItem = RestaurantModel.fromJson(item);

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RestaurantDetailScreen(id: pItem.id,),
                      ),
                    );
                  },
                  child: RestaurantCard.fromModel(model: pItem,),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: snapshot.data!.length,
            );
          },
        ),
      ),
    );
  }
}
