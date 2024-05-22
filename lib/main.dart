import 'package:bloc/bloc.dart';
import 'package:clean_project/core/helpers/cache_helper/cache_helper.dart';
import 'package:clean_project/src/bloc_observer.dart';
import 'package:clean_project/src/root/app_root.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = const SimpleBlocObserver();

  runApp(const AppRoot());
}
