import 'package:flutter/material.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _loadhome();
  }

  void _loadhome() async {
    await Future.delayed(const Duration(milliseconds: 4500), () {});
    if (!mounted) return;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const [
              Expanded(
                child: Center(
                  child: SizedBox(
                      width: 200,
                      child:
                          Image(image: AssetImage('assets/images/wonder.png'))),
                ),
              ),
              Text(
                'Copyright © SmileTech 2023, All Rights Reserved.',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Color(0xFF162A49)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
