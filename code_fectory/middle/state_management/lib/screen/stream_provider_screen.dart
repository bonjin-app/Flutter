import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/layout/default_layout.dart';
import 'package:state_management/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleStreamProvider);

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: state.when(data: (data) {
                return Text(data.toString());
              }, error: (error, stackTrace) {
                return Text(error.toString());
              }, loading: () {
                return Center(child: CircularProgressIndicator(),);
              }),
            )
          ],
        ));
  }
}
