import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swap_test_2/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:swap_test_2/ui/dashboard_page.dart';

import 'login.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({Key? key}) : super(key: key);

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      checkLogin();
      // Do something
    });
    // TODO: implement initState
    super.initState();
  }

  checkLogin() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('token')){

      BlocProvider.of<DashboardBloc>(context).add(FetchDashboard(0));
      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) =>  DashBoardPage()));
    }else {
      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) =>  LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login_bg.png"),
            fit: BoxFit.cover,
          ),

        ),
        child:  Center(
          child: Container(child: Text('Splash', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 40),)),
        ),
      ),
    );
  }
}
