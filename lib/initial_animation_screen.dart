import 'package:flutter/material.dart';

class InicialAnimacionScreen extends StatefulWidget {
  const InicialAnimacionScreen({Key? key}) : super(key: key);

  @override
  State<InicialAnimacionScreen> createState() => _InicialAnimacionScreenState();
}

class _InicialAnimacionScreenState extends State<InicialAnimacionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1000),
              tween: Tween(begin: 1, end: 0),
              curve: Curves.elasticOut,
              builder: (context, value, child) {
                return Column(
                  children: [
                    Transform.translate(
                      offset: Offset(-200 * value, 0),
                      child: Opacity(
                        opacity: (1 - value).clamp(0, 1),
                        child: const Text(
                          'Asaek',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Transform.rotate(
                          angle: value,
                          child: Image.asset('assets/imagen02.jpeg')),
                    ),
                  ],
                );
              },
            ),
            TweenAnimationBuilder<int>(
              duration: Duration(milliseconds: 1200),
              tween: IntTween(begin: 0, end: 1000),
              builder: (context, value, child) => Text(
                value.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 55,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
