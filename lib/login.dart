import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'интересная матеша',
          style: TextStyle(
              fontFamily: 'Schyler',
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
        backgroundColor: Colors.green[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Приложение бесплатное и без рекламы!',
              style: TextStyle(fontSize: 30, fontFamily: 'Schyler'),
            ),
            const SizedBox(height: 400),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/main_screen');
              },
              child: Text(
                'Начать!',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.green[900],
                    fontFamily: 'Schyler'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
