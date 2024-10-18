import 'package:flutter/material.dart';
import 'package:heart_bpm/heart_bpm.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/generated/l10n.dart';
import 'package:musclemate/views/home_view.dart';
import 'package:musclemate/views/meal_plan/meal_plan_view.dart';
import 'package:musclemate/views/running/running_view.dart';
import 'package:musclemate/views/weight/weight_view.dart';

class HeartRateView extends StatefulWidget {
  const HeartRateView({super.key});

  @override
  State<HeartRateView> createState() => _HeartRateViewState();
}

class _HeartRateViewState extends State<HeartRateView> {
  List<SensorValue> data = [];
  int? bpmValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
        centerTitle: true,
        backgroundColor: TColor.kPrimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(S.of(context).coverCamera),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 88,
                ),
                SizedBox(
                  width: 16,
                ),
                HeartBPMDialog(
                  context: context,
                  onRawData: (value) {
                    setState(() {
                      if (data.length == 100) {
                        data.removeAt(0);
                      }
                      data.add(value);
                    });
                  },
                  onBPM: (value) => setState(() {
                    bpmValue = value;
                  }),
                  child: Text(
                    bpmValue?.toString() ?? "-",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RunningView(),
                    ),
                  );
                },
                child: Image.asset("assets/img/menu_running.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MealPlanView2(),
                    ),
                  );
                },
                child: Image.asset("assets/img/menu_meal_plan.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                },
                child: Image.asset("assets/img/menu_home.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WeightView(),
                    ),
                  );
                },
                child: Image.asset("assets/img/menu_weight.png",
                    width: 25, height: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
