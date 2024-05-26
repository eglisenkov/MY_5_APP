import 'package:flutter/material.dart';

class WalkTimeCalculator extends StatefulWidget {
  const WalkTimeCalculator({Key? key}) : super(key: key);

  @override
  State<WalkTimeCalculator> createState() => _WalkTimeCalculatorState();
}

class _WalkTimeCalculatorState extends State<WalkTimeCalculator> {
  final _temperatureController = TextEditingController();
  final _windSpeedController = TextEditingController();
  String _idealWalkTime = '';
  String _comment = 'Давайте посчитаем!';

  void _calculateWalkTime() {
    String temperature = _temperatureController.text;
    String windSpeed = _windSpeedController.text;

    if (int.tryParse(temperature) != null &&
        double.tryParse(windSpeed) != null) {
      int intTemperature = int.parse(temperature);
      double windSpeedMetersPerSecond =
          double.parse(windSpeed) / 3.6; // Конвертация км/ч в м/с

      if (intTemperature > 20 && windSpeedMetersPerSecond < 2.8) {
        // Порог скорости ветра в м/с
        _idealWalkTime = '30 минут';
        _comment = 'Отличная погода для долгой прогулки!';
      } else {
        _idealWalkTime = '15 минут';
        _comment =
            'Можно пойти на короткую прогулку, учитывая погодные условия.';
      }

      setState(() {});
    } else {
      _idealWalkTime = '';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _temperatureController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            helperStyle: const TextStyle(fontSize: 15),
            helperText: 'Расчет идеального времени прогулки',
            label: const Text('Температура (°C)'),
            helperMaxLines: 20,
            hintText: 'Температура в градусах Цельсия',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: _windSpeedController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            helperStyle: const TextStyle(fontSize: 15),
            label: const Text('Скорость ветра (м/с)'),
            hintText: 'Скорость ветра в метрах в секунду',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ElevatedButton(
          onPressed: _calculateWalkTime,
          child: const Text('Рассчитать'),
        ),
        const SizedBox(height: 10),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            label: Text('Идеальное время прогулки: $_idealWalkTime'),
            helperText: _comment,
            helperMaxLines: 20,
          ),
        ),
      ],
    );
  }
}
