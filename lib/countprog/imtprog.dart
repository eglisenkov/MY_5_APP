import 'package:flutter/material.dart';

class ImtCounter extends StatefulWidget {
  const ImtCounter({super.key});

  @override
  State<ImtCounter> createState() => _ImtCounterState();
}

class _ImtCounterState extends State<ImtCounter> {
  final _massaTextController = TextEditingController();
  final _rostTextController = TextEditingController();
  double _lastAnswere = 0;
  String _comment = 'Давайте посчитаем!';

  void _auth() {
    String massa = _massaTextController.text;
    String rost = _rostTextController.text;
    if (double.tryParse(massa) != null && double.tryParse(rost) != null) {
      double doubmassa = double.parse(massa);
      double doubrost = double.parse(rost);
      double drost = doubrost / 100;
      double otvet = doubmassa / (drost * drost);
      _lastAnswere = double.parse(otvet.toStringAsFixed(1));
      setState(() {
        if (_lastAnswere <= 18.4) {
          _comment = 'Дефицит массы тела';
        } else if (_lastAnswere <= 25) {
          _comment = 'Норма';
        } else if (_lastAnswere <= 30) {
          _comment = 'Лишний вес';
        } else if (_lastAnswere <= 35) {
          _comment = 'Ожирение 1-ой степени';
        } else if (_lastAnswere <= 40) {
          _comment = 'Ожирение 2-ой степени';
        } else if (_lastAnswere >= 41) {
          _comment = 'Ожирение 3-ей степени';
        }
      });
    } else {
      _lastAnswere = 0;
      setState(() {
        _comment = 'Ожирение первой степени';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        TextField(
          controller: _massaTextController,
          decoration: InputDecoration(
            helperStyle: const TextStyle(fontSize: 15),
            helperMaxLines: 20,
            helperText:
                'ИМТ- Индекс массы тела (англ. BMI - body mass index ) это величина, применяемая для оценки степени соответствия роста и массы человека и оценки массы тела.',
            label: const Text('Индекс массы тела'),
            hintText: 'Твой вес',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _rostTextController,
          decoration: InputDecoration(
            helperStyle: const TextStyle(fontSize: 15),
            helperMaxLines: 20,
            label: const Text('Индекс массы тела'),
            hintText: 'Твой рост',
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
            label: Text('Ваш ИМТ $_lastAnswere'),
            helperText: _comment,
          ),
        ),
      ],
    );
  }
}
