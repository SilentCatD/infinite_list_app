import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_app/app.dart';
import 'package:infinite_list_app/app_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const InfiniteListApp()),
    blocObserver: AppBlocObserver(),
  );
}
