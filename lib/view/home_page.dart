import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences_sample/states/provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerの状態を監視
    final _counterProvider = ref.watch(counterProvider);
    final _counterProviderNotifier = ref.watch(counterProvider.notifier);
    final _sharedPreferencesProvider = ref.watch(sharedPreferencesProvider);

    // データの保存
    Future<void> _setData() async {
      _counterProviderNotifier.state =
          (_sharedPreferencesProvider.getInt('counter') ?? 0) + 1;
      _sharedPreferencesProvider.setInt(
          'counter', _counterProviderNotifier.state);
    }

    // データの読み取り
    Future<void> _getData() async {
      _counterProviderNotifier.state =
          _sharedPreferencesProvider.getInt('counter') ?? 0;
    }

    // データの削除
    Future<void> _removeData() async {
      _sharedPreferencesProvider.remove('counter');
      _getData();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('shared_preferences'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _counterProvider.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () {
                _removeData();
              },
              child: const Text('削除'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _setData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
