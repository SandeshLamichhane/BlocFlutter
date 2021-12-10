import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutterblock/counterbloac.dart';

void main() => runApp(MyApp());

class CounterBloc {
  StreamController<String> todoCompleteSink = StreamController();
  Stream<String> get todoCompleteStream => todoCompleteSink.stream;

 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final counterblock bloc = counterblock();
  static int i=0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MyClass>(
      // here the bloc data is being consumed by the UI 
      stream: bloc.getmyclassStream,
      builder: (context, snapshot) {

        if (!snapshot.hasData) {
        return Center(child: CircularProgressIndicator(),);
      }
          if (snapshot.connectionState == ConnectionState.done) {

      }
        return Scaffold(
          appBar: AppBar(
            title: Text("Flutter Demo Home Page"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:'+snapshot.data!.name.toString()
                ),
                Text(
                  '${snapshot.data!.name.toString() ?? 0}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
             
            // here the sink is being used to tell
            // the bloc it should update it's state
            onPressed: () => bloc.todoCompleteSink.add( bloc.addMyclassData()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      }, 
    );
  }
}