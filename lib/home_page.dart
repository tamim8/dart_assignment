import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Module 10 Assignment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello world!',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Welcome to Flutter'),
            const SizedBox(height: 20),
            SizedBox(
              width: 150.0,
              height: 150.0,
              // child: Image(image: AssetImage('assets/images/flutter_icon.png')),
              child: Image.network(
                  'https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png'),
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Press Me'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Button Pressed!'),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
