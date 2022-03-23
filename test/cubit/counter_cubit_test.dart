// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
// import 'package:test/test.dart';

// void main() {
//   group('CounterCubit', () {
//     late CounterCubit counterCubit;

//     setUp(() {
//       counterCubit = CounterCubit();
//     });

//     tearDown(() {
//       counterCubit.close();
//     });

//     test(
//         'the initial state for the CounterCubit is CounterState(counterValue:0)',
//         () {
//       expect(counterCubit.state, CounterState(counterValue: 0));
//     });

//     blocTest<CounterCubit, CounterState>(
//       'the Cubit should emit a CounterState(counterValue:1, wasIncremented:true) when cubit.increment() called',
//       build: () => counterCubit,
//       act: (cubit) => cubit.increment(),
//       expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
//     );

//     blocTest<CounterCubit, CounterState>(
//       'the Cubit should emit a CounterState(counterValue:-1, wasIncremented:false) when cubit.decrement() called',
//       build: () => counterCubit,
//       act: (cubit) => cubit.decrement(),
//       expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
//     );
//   });
// }
