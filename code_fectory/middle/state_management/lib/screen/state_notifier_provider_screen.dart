import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/layout/default_layout.dart';
import 'package:state_management/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shoppingListProvider);

    return DefaultLayout(
      title: 'StateNotifierProvider',
      body: ListView(
        children: state.map(
          (e) => CheckboxListTile(title: Text(e.name), value: e.hasBought, onChanged: (value) {
            ref.read(shoppingListProvider.notifier).toggleHasBought(name: e.name);
          }),
        ).toList(),
      ),
    );
  }
}
