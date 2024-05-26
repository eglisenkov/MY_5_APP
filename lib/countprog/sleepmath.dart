import 'package:flutter/material.dart';

class SleepTimeCalculator extends StatefulWidget {
  const SleepTimeCalculator({Key? key}) : super(key: key);

  @override
  State<SleepTimeCalculator> createState() => _SleepTimeCalculatorState();
}

class _SleepTimeCalculatorState extends State<SleepTimeCalculator> {
  final _ageController = TextEditingController();
  String _recommendedSleepTime = '';
  String _comment = 'Давайте посчитаем!';

  void _calculateRecommendedSleepTime() {
    String age = _ageController.text;
    if (int.tryParse(age) != null) {
      int intAge = int.parse(age);
      if (intAge >= 3 && intAge <= 5) {
        _recommendedSleepTime = '10-13 часов';
        _comment =
            'Маленькие дети нуждаются в большем количестве сна для нормального развития.';
      } else if (intAge >= 6 && intAge <= 12) {
        _recommendedSleepTime = '9-12 часов';
        _comment =
            'Для школьников важно получать достаточно сна для успешной учебы и развития.';
      } else if (intAge >= 13 && intAge <= 18) {
        _recommendedSleepTime = '8-10 часов';
        _comment =
            'Подросткам необходимо уделять внимание здоровому сну для поддержания физического и психического здоровья.';
      } else {
        _recommendedSleepTime = '7-9 часов';
        _comment =
            'Для взрослых рекомендуется спать от 7 до 9 часов в сутки для поддержания здоровья и хорошего самочувствия.';
      }
      setState(() {});
    } else {
      _recommendedSleepTime = '';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _ageController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            helperStyle: const TextStyle(fontSize: 15),
            helperText: 'Расчет рекомендуемого времени сна',
            label: const Text('Возраст'),
            helperMaxLines: 20,
            hintText: 'Введите возраст (в годах)',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ElevatedButton(
          onPressed: _calculateRecommendedSleepTime,
          child: const Text('Рассчитать'),
        ),
        const SizedBox(height: 10),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            label: Text('Рекомендуемое время сна: $_recommendedSleepTime'),
            helperText: _comment,
            helperMaxLines: 20,
          ),
        ),
      ],
    );
  }
}
