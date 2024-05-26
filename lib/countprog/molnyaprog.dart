import 'package:flutter/material.dart';

class MolnyaCounter extends StatefulWidget {
  const MolnyaCounter({super.key});

  @override
  State<MolnyaCounter> createState() => _MolnyaCounterState();
}

class _MolnyaCounterState extends State<MolnyaCounter> {
  final _nauchkaTextController = TextEditingController();
  double _lastAnswere = 0;
  String _hinttt = 'Давайте посчитаем!';

  void _auth() {
    String data = _nauchkaTextController.text;
    if (double.tryParse(data) != null) {
      double doubdata = double.parse(data);
      double otvet = doubdata * 343;
      _lastAnswere = double.parse(otvet.toStringAsFixed(2));
      setState(() {
        if (_lastAnswere < 1000) {
          _hinttt = 'Очень близко!!!!';
        } else if (_lastAnswere < 1700) {
          _hinttt = 'Близко!!!';
        } else if (_lastAnswere < 2000) {
          _hinttt = 'Далеко, но внимательно!!';
        } else {
          _hinttt = 'Зачилимся! Далеко!';
        }
      });
    } else {
      _lastAnswere = 0;
      setState(() {
        _hinttt = 'Введите корректное значение';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        TextField(
          controller: _nauchkaTextController,
          decoration: InputDecoration(
            helperStyle: const TextStyle(fontSize: 15),
            helperMaxLines: 20,
            helperText:
                'Посчитай как далеко находится молния от твоего дома! Просто засеки сколько секунд было от яркой вспышки до грома!',
            label: const Text('Молния'),
            hintText: 'Секунды (Целое число)',
            suffix: ElevatedButton(
                onPressed: _auth, child: const Text('Посчитать')),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            label: Text('Примерно $_lastAnswere м от вас!'),
            hintText: _hinttt,
          ),
        ),
      ],
    );
  }
}
