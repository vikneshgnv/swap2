import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_test_2/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:swap_test_2/bloc/login_bloc/login_bloc.dart';
import 'package:swap_test_2/repository/api/dashboard_api.dart';
import 'package:swap_test_2/repository/api/login_api.dart';
import 'package:swap_test_2/ui/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
LoginApi loginApi = LoginApi();
DashboardApi dashboardApi = DashboardApi();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(loginApi)),
        BlocProvider<DashboardBloc>(
            create: (context) => DashboardBloc(dashboardApi)),
      ],
      child: MaterialApp(
        title: 'Swap Test',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: SplashScreeen(),
      ),
    );
  }
}

