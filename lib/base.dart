import 'package:flutter/material.dart';
import 'package:teststudy/countprog/gymraaschet.dart';
import 'package:teststudy/countprog/imtprog.dart';
import 'package:teststudy/countprog/molnyaprog.dart';
import 'package:teststudy/countprog/sleepmath.dart';
import 'package:teststudy/countprog/waterschet.dart';
import 'package:teststudy/countprog/weathermath.dart';
import 'package:teststudy/countprog/workoutsleep.dart';
import 'package:teststudy/resources/resources.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'давай считать)',
          style: TextStyle(
              fontFamily: 'Schyler',
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.green[200]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Column(
              children: [
                Image(
                  image: AssetImage(AppImages.molnya),
                  height: 100,
                  width: 100,
                ),
                MolnyaCounter(),
                SizedBox(height: 50),
                Image(
                  image: AssetImage(AppImages.yogadevushka),
                  height: 100,
                  width: 100,
                ),
                ImtCounter(),
                SizedBox(height: 10),
                Image(
                  image: AssetImage(AppImages.begun),
                  height: 100,
                  width: 100,
                ),
                GymPodxodyCounter(),
                SizedBox(height: 40),
                Image(
                  image: AssetImage(AppImages.voda),
                  height: 100,
                  width: 100,
                ),
                WaterIntakeCounter(),
                SizedBox(height: 40),
                Image(
                  image: AssetImage(AppImages.sidit),
                  height: 100,
                  width: 100,
                ),
                WorkoutTimeCalculator(),
                SizedBox(height: 28),
                Image(
                  image: AssetImage(AppImages.nebo),
                  height: 100,
                  width: 100,
                ),
                WalkTimeCalculator(),
                SizedBox(height: 50),
                Image(
                  image: AssetImage(AppImages.luna),
                  height: 100,
                  width: 100,
                ),
                SleepTimeCalculator(),
                SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
