import 'package:flutter/material.dart';
import 'package:state_management/screen/auto_dispose_modifier_screen.dart';
import 'package:state_management/screen/family_modifier_screen.dart';
import 'package:state_management/screen/future_provider_screen.dart';
import 'package:state_management/screen/listen_provider_screen.dart';
import 'package:state_management/screen/provider_screen.dart';
import 'package:state_management/screen/select_provider_screen.dart';
import 'package:state_management/screen/state_provider_screen.dart';
import 'package:state_management/screen/stream_provider_screen.dart';

import '../layout/default_layout.dart';
import 'state_notifier_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '홈',
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => StateProviderScreen()));
            },
            child: Text('StateProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => StateNotifierProviderScreen()));
            },
            child: Text('StateNotifierProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => FutureProviderScreen()));
            },
            child: Text('FutureProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => StreamProviderScreen()));
            },
            child: Text('StreamProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => FamilyModifierScreen()));
            },
            child: Text('FamilyModifierScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => AutoDisposeModifierScreen()));
            },
            child: Text('AutoDisposeModifierScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ListenProviderScreen()));
            },
            child: Text('ListenProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => SelectProviderScreen()));
            },
            child: Text('SelectProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProviderScreen()));
            },
            child: Text('ProviderScreen'),
          ),
        ],
      ),
    );
  }
}
