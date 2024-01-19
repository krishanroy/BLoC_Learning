import 'package:bloc_learning/color_bloc/color_bloc.dart';
import 'package:bloc_learning/color_bloc/color_state.dart';
import 'package:bloc_learning/counter_bloc/counter_bloc.dart';
import 'package:bloc_learning/counter_bloc/counter_event.dart';
import 'package:bloc_learning/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * When we need to track more than one state for a single event, we can use
     * MultiBlocProvider (MBP). We can use nested Bloc but for readability, MBP is better
     */
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<ColorBloc>(create: (context) => ColorBloc())
      ],
      child: MaterialApp(
        title: 'Counter BLoC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Counter BLoC Home Page'),
      ),
    );
    /*return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Counter BLoC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Counter BLoC Home Page'),
      ),
    );*/
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 30),
            /**
             * BlocBuilder rebuilds/redraws the UI
             */
            /*
             BlocBuilder<CounterBloc, CounterState>(
              // buildWhen: (previous, current) {
              //   return current.counter >= 0;
              // },
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
             */

            /**
             * BlocListener does not rebuild the UI, it does something like showing dialog/snackbar/navigation etc.
             */
            /*
            BlocListener<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state.counter >= 5) {
                  final snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Working!',
                      message: 'snackbar is displayed!',

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.success,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                }
              },
              child: const Text('Bloc Listener'),
            ),
             */

            /**
             * Bloc Consumer Redraws as well as performs some action
             */
            /*
            BlocConsumer<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: const TextStyle(fontSize: 80),
                );
              },
              listener: (context, state) {
                if (state.counter >= 5) {
                  final snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Working!',
                      message: 'snackbar is displayed when >= 5!',

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.success,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                }
              },
            ),
             */
            /**
             * BlocSelector can perform filtering operation
             */
            /*
            BlocSelector<CounterBloc, CounterState, bool>(
              selector: (state) => state.counter > 3 ? true : false,
              builder: (BuildContext context, state) {
                return Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    color: state ? Colors.green : Colors.amber,
                  ),
                );
              },
            ),
             */
            BlocBuilder<ColorBloc, ColorState>(
              builder: (context, state) {
                return Container(
                  color: state.color,
                  width: 200,
                  height: 200,
                );
              },
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrementEvent());
                    context.read<ColorBloc>().add(CounterDecrementEvent());
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrementEvent());
                    context.read<ColorBloc>().add(CounterIncrementEvent());
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
