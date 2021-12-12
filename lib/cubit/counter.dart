import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblock/cubit/cubit/counter_cubit.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(state.counterValue.toString());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                 child: Text("Sub"),
                ),
                SizedBox(width: 20,),
                FloatingActionButton(onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                child: Text("Add"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
