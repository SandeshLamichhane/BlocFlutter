import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblock/auth_repo.dart';
import 'package:flutterblock/cubit/counter.dart';
import 'package:flutterblock/cubit/cubit/counter_cubit.dart';
import 'package:flutterblock/login.dart';
import 'dart:async';

void main() => runApp(MyApp());

class CounterBloc {
  StreamController<String> todoCompleteSink = StreamController();
  Stream<String> get todoCompleteStream => todoCompleteSink.stream;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: CounterView()),
    );
  }
}
