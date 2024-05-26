import 'package:flutter/material.dart';

class WorkoutTimeCalculator extends StatefulWidget {
  const WorkoutTimeCalculator({Key? key}) : super(key: key);

  @override
  State<WorkoutTimeCalculator> createState() => _WorkoutTimeCalculatorState();
}

class _WorkoutTimeCalculatorState extends State<WorkoutTimeCalculator> {
  final _sleepTimeTextController = TextEditingController();
  String _idealWorkoutTime = '';
  String _comment = 'Давайте посчитаем!';

  void _calculateWorkoutTime() {
    String sleepTime = _sleepTimeTextController.text;
    if (int.tryParse(sleepTime) != null) {
      int intSleepTime = int.parse(sleepTime);
      int workoutHour = (intSleepTime / 2).toInt() - 1;
      _idealWorkoutTime = '${workoutHour < 10 ? '0' : ''}$workoutHour:00';
      _comment =
          'Не забудьте учесть ваш ежедневный режим и предпочтения во время тренировки.';
      setState(() {});
    } else {
      _idealWorkoutTime = '';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _sleepTimeTextController,
          decoration: InputDecoration(
            helperStyle: const TextStyle(fontSize: 15),
            helperText: 'Расчет идеального времени для тренировки',
            label: const Text('Время сна'),
            helperMaxLines: 20,
            hintText: 'Время сна (в часах, например, 22)',
            hintMaxLines: 2,
            suffix: ElevatedButton(
              onPressed: _calculateWorkoutTime,
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
            label: Text('Идеальное время тренировки: $_idealWorkoutTime'),
            helperText: _comment,
            helperMaxLines: 20,
          ),
        ),
      ],
    );
  }
}
