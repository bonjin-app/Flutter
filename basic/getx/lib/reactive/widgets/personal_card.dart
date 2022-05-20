import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/reactive/controller/controller.dart';

class PersonalCard extends StatelessWidget {
  const PersonalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller _controller = Get.put(Controller());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF89DAD0),
              ),
              child: Center(
                child: GetX<Controller>(
                  builder: (_) => Text(
                    'Name ${_controller.person().name}',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF89DAD0),
              ),
              child: Center(
                child: Obx(() => Text(
                      'Age ${_controller.person().age}',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF89DAD0),
              ),
              child: Center(
                child: GetX(
                  init: Controller(),
                  builder: (_) => Text(
                    'Age: ${Get.find<Controller>().person().age}',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.updateInfo();
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
