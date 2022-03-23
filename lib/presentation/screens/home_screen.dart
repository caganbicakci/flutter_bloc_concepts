import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/constants/enums.dart';
import 'package:flutter_bloc_concepts/logic/cubit/internet_cubit.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text(
                    "Wi-Fi Connection",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.green),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text(
                    "Celluar Network",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.orange),
                  );
                } else if (state is InternetDisconnected) {
                  return Text(
                    "Disconnected!",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.red),
                  );
                }
                return const Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(),
                );
              },
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(
              height: 24,
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
                    '${state.counterValue} is NEGATIVE',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            const SizedBox(
              height: 24,
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
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: Text("Go to Second Screen"),
              color: Colors.redAccent,
              textColor: Colors.white,
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: Text("Go to Third Screen"),
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
