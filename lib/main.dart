import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter_blocs_concepts/presentation/screens/home_screen.dart';
import 'package:flutter_blocs_concepts/presentation/screens/second_screen.dart';
import 'package:flutter_blocs_concepts/presentation/screens/third_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});
  final CounterCubit _counterCubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => _counterCubit,
      child:  MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
           '/' : (context) => BlocProvider.value(
             value: _counterCubit,
             child: HomeScreen(
               title: 'HomeScreen',
               color: Colors.blueAccent,
                ),
             ),
            
            '/second' : (context) => BlocProvider.value(
          value: _counterCubit,
             child: SecondScreen(
            title: 'SecondScreen', 
            color: Colors.redAccent,
                ),
             ),

            '/third' : (context) => BlocProvider.value(
            value: _counterCubit,
             child:ThirdScreen(
            title: 'ThirdScreen', 
            color: Colors.greenAccent,
               ),
             ),
          
        },
        
      ),
    );
  }
}


