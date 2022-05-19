
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SimpleExample1 extends StatelessWidget {
  const SimpleExample1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
              builder: (_) => Text('Current value is: ${controller.x}', style: TextStyle(fontSize: 20, color: Colors.red),),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: const Text('Add number'),
            ),
          ],
        ),
      ),
    );
  }
}


class SimpleExample2 extends StatelessWidget {
  const SimpleExample2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
              init: Controller(),
              builder: (_) => Text('Current value is: ${Get.find<Controller>().x}', style: TextStyle(fontSize: 20, color: Colors.red),),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Get.find<Controller>().increment();
              },
              child: const Text('Add number'),
            ),
          ],
        ),
      ),
    );
  }
}
