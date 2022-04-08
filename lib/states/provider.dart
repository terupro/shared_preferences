import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// カウンターの状態を管理する
final counterProvider = StateProvider<int>((ref) => 0);

// 保存状態を管理する
final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());
