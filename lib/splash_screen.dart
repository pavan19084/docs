import 'dart:async';
import 'package:docs/supabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:docs/routes_name.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      if (StorageService.getUserSession != null) {
        Get.offAllNamed(RoutesName.done);
      } else {
        Get.offAllNamed(RoutesName.signin);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.jpg'),
      ),
    );
  }
}
