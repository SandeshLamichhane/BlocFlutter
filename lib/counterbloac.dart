 import 'dart:async';
class CounterBloc {
  // this sink is the 'input'.
  // sinks should be the _only_ way that 
  // outside object can interact with blocs. 
  StreamController<int> todoCompleteSink = StreamController();

  // this stream is the 'output'
  // it's the only property that outside
  // objects can use to consume this blocs data.
  Stream<int> get todoCompleteStream => todoCompleteSink.stream;

  CounterBloc() {
    todoCompleteSink.add(0);
  }
  
  dispose() {
    todoCompleteSink.close();
  }
} 