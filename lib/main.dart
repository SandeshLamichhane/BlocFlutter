import 'package:flutter/material.dart';
import 'package:flutterblock/counterbloac.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
         
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final _bloc = CounterBloc();


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
         
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          Flexible(
            child: StreamBuilder(
            stream: _bloc.counter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                   
            
             
            ],
                  );
            }
                ),
          ),])),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _bloc.counterEventSink.add(IncrementEvent()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),  
    );
  }
}
