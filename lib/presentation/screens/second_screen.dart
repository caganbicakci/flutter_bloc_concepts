import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text("Incremented"),
                    duration: Duration(milliseconds: 300),
                  ));
                } else {
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text("Decremented"),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                if ((state.counterValue % 2 == 0) &&
                    (state.counterValue >= 0)) {
                  return Text(
                    '${state.counterValue} is EVEN',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if ((state.counterValue % 2 == 1) &&
                    (state.counterValue > 0)) {
                  return Text(
                    '${state.counterValue} is ODD',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    'BRRRRRR ${state.counterValue} is MINUS',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    onPressed: () =>
                        BlocProvider.of<CounterCubit>(context).decrement(),
                    tooltip: "Decrement",
                    child: Icon(Icons.remove),
                    heroTag: null),
                FloatingActionButton(
                    onPressed: () =>
                        BlocProvider.of<CounterCubit>(context).increment(),
                    tooltip: "Increment",
                    child: Icon(Icons.add),
                    heroTag: null)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
