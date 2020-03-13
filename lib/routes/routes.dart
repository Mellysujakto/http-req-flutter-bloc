import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_crud/bloc/color_bloc.dart';
import 'package:flutter_bloc_crud/bloc/customer_bloc.dart';
import 'package:flutter_bloc_crud/ui/customer_screen.dart';
import 'package:flutter_bloc_crud/ui/trial_screen.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
        ),
        BlocProvider<CustomerBloc>(
          create: (context) => CustomerBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: CustomerScreen.routeName,
        routes: {
          TrialScreen.routeName: (context) => TrialScreen(),
          CustomerScreen.routeName: (context) => CustomerScreen(),
        },
      ),
    );
  }
}
