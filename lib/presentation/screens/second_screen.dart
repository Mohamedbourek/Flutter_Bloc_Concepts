
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs_concepts/logic/cubit/counter_cubit.dart';
class SecondScreen extends StatefulWidget {
    SecondScreen({ Key? key , required this.title, required this.color}) : super(key : key);

    final String title;
    final Color color;
      @override
     _SecondScreenState createState() => _SecondScreenState();

  
  
}

class _SecondScreenState extends State<SecondScreen> {
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
            Text(
              'you have pushed the button this many times',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context,state) {
          if(state.isIncremented == true){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Incremented!'),
                duration: Duration(milliseconds: 300),
                ));
          }

           else if(state.isIncremented == false){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('decremented!'),
                duration: Duration(milliseconds: 300),
                ));
          }
        },
              builder: (context, state)  {
                return Text(
              state.counterValue.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
                );
              },
            ),
            
            SizedBox(
              height: 24,
            ),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
               FloatingActionButton(
                onPressed: () {
                   BlocProvider.of<CounterCubit>(context).increment();
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
             ],
            ),
           
          ],
        ),
      ), 
      );
      
  }
}