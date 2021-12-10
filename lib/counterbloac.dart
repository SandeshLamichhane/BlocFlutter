 import 'dart:async';

import 'dart:math';
 class MyClass {
  late String name;
  late String age;

  MyClass({
    required this.name,
    required this.age
  });
 
 

 }
 class counterblock{
  StreamController<MyClass> todoCompleteSink = StreamController();
  Stream<MyClass> get getmyclassStream => todoCompleteSink.stream;
  counterblock() {
    todoCompleteSink.add(addMyclassData());
  }


  dispose() {
    todoCompleteSink.close();
  }
static int i=0;
static int j=1;
///
  MyClass addMyclassData() {

    return MyClass(age: (i++).toString(),name: (j++).toString());
  }

 
   
 }