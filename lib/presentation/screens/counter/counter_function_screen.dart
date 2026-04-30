import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {
  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter Screen',
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[300],
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_rounded, color: Colors.white),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Click${clickCounter == 1 ? '' : 's'}',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          customButton(icon: Icons.refresh_rounded, onPressed: () {
            setState(() {
              clickCounter = 0;
            });
          }),
          SizedBox(height: 10),
          customButton(icon: Icons.exposure_minus_1, onPressed: () {
            setState(() {
              if (clickCounter == 0) return;
              clickCounter--;
            });
          }),
          SizedBox(height: 10),
          customButton(icon: Icons.plus_one, onPressed: () {
            setState(() {
              clickCounter++;
            });
          }),
        ],
      ),
      // floatingActionButton:
    );
  }
}

class customButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const customButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: StadiumBorder(),
      enableFeedback: true,
      elevation: 50,
      backgroundColor: Colors.teal[300],
      splashColor: Colors.teal[600],
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
    );
  }
}

// widget boton personalizado flotante
// Widget customFloatingActionButton({
//   required VoidCallback onPressed,
//   required IconData icon,
// }) {
//   return FloatingActionButton(
//     shape: StadiumBorder(),
//     backgroundColor: Colors.teal[300],
//     splashColor: Colors.teal[600],
//     onPressed: onPressed,
//     child: Icon(icon, color: Colors.white),
//   );
// }
