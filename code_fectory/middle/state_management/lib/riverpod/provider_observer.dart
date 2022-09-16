import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {

  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    print('{\n  didAddProvider": "${provider.name ?? provider.runtimeType}"\n}');
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);

    print('{\n  didUpdateProvider": "${provider.name ?? provider.runtimeType}",\n  newValue": "$newValue"\n}');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    print('{\n  didDisposeProvider": "${provider.name ?? provider.runtimeType}"\n}');
  }
}