import 'package:musclemate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/home_view.dart';
import 'package:musclemate/views/meal_plan/meal_plan_view.dart';
import 'package:musclemate/views/weight/weight_view.dart';
import 'package:musclemate/widgets/running_length_view.dart';
import 'package:musclemate/widgets/ruuing_top_button.dart';

class RunningView extends StatefulWidget {
  const RunningView({super.key});

  @override
  State<RunningView> createState() => _RunningViewState();
}

class _RunningViewState extends State<RunningView> {
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.kPrimaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          S.of(context).running,
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            color: TColor.kPrimaryColor,
            alignment: Alignment.bottomCenter,
            child: Container(
              width: media.width * 0.9,
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xffF8F6F9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  RunningTopButton(
                    icon: "assets/img/r_distance.png",
                    isActive: selectTab == 0,
                    onPressed: () {
                      setState(() {
                        selectTab = 0;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: media.width * 0.9,
            height: media.height * 0.65,
            decoration: BoxDecoration(
                color: TColor.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0, 1))
                ]),
            child: Column(
              children: [
                if (selectTab == 0)
                  RunningLengthView(height: media.height * 0.65),
              ],
            ),
          ),
        ],
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
