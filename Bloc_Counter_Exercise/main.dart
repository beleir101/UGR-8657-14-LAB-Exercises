import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/app_events.dart';
import 'package:flutter_application_1/app_states.dart';
import 'package:flutter_application_1/app_blocs.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>CounterBlocs(),
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBlocs, CounterStates>(
        builder: (context, state){
          return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.counter.toString(), style: const TextStyle(
                  fontSize: 30
                ),
                )    ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed:
                        ()=>BlocProvider.of<CounterBlocs>(context).add(Increment()),
                        child: const Icon(Icons.add)
                    ),

                    const SizedBox(width: 10,),
                    ElevatedButton(
                        onPressed:
                        ()=>BlocProvider.of<CounterBlocs>(context).add(Decrement()),
                        child: const Icon(Icons.remove)
                    )
                  ],
                ),]);

        }
      ),
    );
  }
}
