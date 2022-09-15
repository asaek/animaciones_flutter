import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controllerAnimation;
  late Animation<double> _animationScale;
  late AnimationController _spininAnimation;
  late Animation<AlignmentGeometry> _animationAligment;
  late AnimationController _controllerExplicita;

  @override
  void initState() {
    super.initState();
    _controllerAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controllerExplicita =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _spininAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animationAligment = Tween<Alignment>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      // CurvedAnimation(parent: parent, curve: curve)
      _spininAnimation,
    );

    _animationScale = CurvedAnimation(
      parent: _controllerAnimation,
      curve: Curves.elasticOut,
    );

    _controllerAnimation.forward();
    _spininAnimation.repeat(reverse: true);
    _controllerExplicita.forward(from: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    _controllerAnimation.dispose();
    _spininAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _controllerAnimation.reverse();
              _controllerExplicita.reverse();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              _controllerAnimation.forward(from: 0.0);
              _controllerExplicita.forward(from: 0.0);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          AnimatedBuilder(
              animation: _controllerExplicita,
              builder: (context, child) {
                final value = _controllerAnimation.value;
                final color =
                    Color.lerp(Colors.amber, Colors.deepPurple, value);
                return Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: (1.5 * value).clamp(0, 3),
                    child: Text(
                      (value * 1000).round().toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        // fontSize: value * 40,
                        color: color,
                      ),
                    ),
                  ),
                );
              }),
          AlignTransition(
            alignment: _animationAligment,
            child: SizedBox(
              height: 100,
              child: Image.asset('assets/imagen02.jpeg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: RotationTransition(
              turns: _controllerAnimation,
              child: FadeTransition(
                opacity: _controllerAnimation,
                child: ScaleTransition(
                  scale: _animationScale,
                  child: Image.asset('assets/imagen02.jpeg'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
