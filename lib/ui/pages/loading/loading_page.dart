import 'package:flutter/material.dart';
import 'package:plant_app/ui/pages/login/login_page.dart';



class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2), (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context) =>const  LoginPage()));
      });
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}