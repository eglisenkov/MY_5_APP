import 'package:flutter/material.dart';

class GymPodxodyCounter extends StatefulWidget {
  const GymPodxodyCounter({super.key});

  @override
  State<GymPodxodyCounter> createState() => _GymPodxodyCounterState();
}

class _GymPodxodyCounterState extends State<GymPodxodyCounter> {
  final _yearsTextController = TextEditingController();
  double _lastAnswere = 0;
  String _comment = 'Давайте посчитаем!';

  void _auth() {
    String years = _yearsTextController.text;
    if (double.tryParse(years) != null) {
      double doubyears = double.parse(years);
      double otvet = (doubyears / 2) * 0.9;
      _lastAnswere = double.parse(otvet.toStringAsFixed(1));
      _comment =
          'Возможно кажется много, но попробуйте бегать интервалами, это прокачает вашу выносливость';
      setState(() {});
    } else {
      _lastAnswere = 0;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _yearsTextController,
          decoration: InputDecoration(
            helperStyle: const TextStyle(fontSize: 15), // Исправленная строка
            helperText: 'Расчет идеальной скорости бега для сжигания калорий',
            label: const Text('Тренировки'),
            helperMaxLines: 20,
            hintText: 'Твой вес',
            suffix: ElevatedButton(
                onPressed: _auth, child: const Text('Посчитать')),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        const SizedBox(height: 10),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            label: Text('Идеальная скорость $_lastAnswere'),
            helperText: _comment,
            helperMaxLines: 20,
          ),
        ),
      ],
    );
  }
}
