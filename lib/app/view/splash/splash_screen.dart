import 'package:flutter/material.dart';
import 'dart:async';

import '../home/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _fadeAnimation;
  final _duration = const Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
        await Future.delayed(const Duration(seconds: 1));
      } else if (status == AnimationStatus.dismissed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _fadeAnimation as Animation<double>,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/logo.jpg'),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
