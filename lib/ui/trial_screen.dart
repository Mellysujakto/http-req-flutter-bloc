import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_crud/bloc/color_bloc.dart';
import 'package:flutter_bloc_crud/ui/customer_screen.dart';

class TrialScreen extends StatelessWidget {
  static final routeName = "/trial_screen";

  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              colorBloc.add(ColorEvent.to_amber);
            },
            backgroundColor: Colors.amber,
          ),
          FloatingActionButton(
            onPressed: () {
              colorBloc.add(ColorEvent.to_light_blue);
            },
            backgroundColor: Colors.lightBlue,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomerScreen()));
              },
            backgroundColor: Colors.white,
            child: Icon(Icons.navigate_next, color: Colors.black,size: 40.0,),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          "BLoc",
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            width: 100.0,
            height: 100.0,
            color: currentColor,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
