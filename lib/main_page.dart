import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FREEZED BLOC'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                state.when(
                  initial: () => '-',
                  running: (number) => '$number',
                  loading: () => 'loading...',
                ),
                style: const TextStyle(
                  fontSize: 25,
                ),
              );
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(64.0),
              ),
            ),
            onPressed: () {
              context.read<CounterBloc>().add(const CounterEvent.increment());
            },
            child: const Text("increment"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(64.0),
              ),
            ),
            onPressed: () {
              context.read<CounterBloc>().add(const CounterEvent.decrement());
            },
            child: const Text("decrement"),
          ),
        ],
      )),
    );
  }
}
