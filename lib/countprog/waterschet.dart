import 'package:flutter/material.dart';

class WaterIntakeCounter extends StatefulWidget {
  const WaterIntakeCounter({Key? key}) : super(key: key);

  @override
  State<WaterIntakeCounter> createState() => _WaterIntakeCounterState();
}

class _WaterIntakeCounterState extends State<WaterIntakeCounter> {
  final _weightTextController = TextEditingController();
  double _idealWaterIntake = 0;
  String _comment = 'Давайте посчитаем!';

  void _calculateWaterIntake() {
    String weight = _weightTextController.text;
    if (double.tryParse(weight) != null) {
      double doubleWeight = double.parse(weight);
      _idealWaterIntake = doubleWeight * 0.033;
      _comment =
          'Не забудьте, что уровень активности и климат также могут повлиять на ваше потребление воды.';
      setState(() {});
    } else {
      _idealWaterIntake = 0;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _weightTextController,
          decoration: InputDecoration(
            helperStyle: const TextStyle(fontSize: 15),
            helperText: 'Расчет идеального количества воды для потребления',
            label: const Text('Вес'),
            helperMaxLines: 20,
            hintText: 'Ваш вес (кг)',
            suffix: ElevatedButton(
              onPressed: _calculateWaterIntake,
              child: const Text('Рассчитать'),
            ),
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
            label: Text('Идеальное количество воды: $_idealWaterIntake л'),
            helperText: _comment,
            helperMaxLines: 20,
          ),
        ),
      ],
    );
  }
}
