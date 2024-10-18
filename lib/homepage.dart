import 'package:flutter/material.dart';

class SimpleAnimationApp extends StatefulWidget {
  const SimpleAnimationApp({super.key});

  @override
  State<SimpleAnimationApp> createState() => _SimpleAnimationAppState();
}

class _SimpleAnimationAppState extends State<SimpleAnimationApp> {
  // Properties for container animation
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;

  // Boolean to control text visibility for opacity animation
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My First Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedContainer that changes size and color
            AnimatedContainer(
              width: _width,
              height: _height,
              color: _color,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
            const SizedBox(height: 20),
            // AnimatedOpacity for text fading in/out
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: const Text(
                'Hi RANIA!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                // Toggle size and color of the container
                _width = _width == 100 ? 200 : 100;
                _height = _height == 100 ? 200 : 100;
                _color = _color == Colors.blue ? Colors.red : Colors.blue;
              });
            },
            child: const Icon(Icons.play_arrow),
            tooltip: 'Animate Container',
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                // Toggle visibility of text
                _isVisible = !_isVisible;
              });
            },
            child: const Icon(Icons.visibility),
            tooltip: 'Toggle Text Visibility',
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SimpleAnimationApp(),
  ));
}
