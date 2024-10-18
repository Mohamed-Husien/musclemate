import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/helpers/tips_list.dart';
import 'package:musclemate/views/home_view.dart';
import 'package:musclemate/views/meal_plan/meal_plan_view.dart';
import 'package:musclemate/views/running/running_view.dart';
import 'package:musclemate/views/tips/tips_details_view.dart';
import 'package:musclemate/views/weight/weight_view.dart';
import 'package:musclemate/widgets/tip_row.dart';

class TipsView extends StatelessWidget {
  const TipsView({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.kPrimaryColor,
        centerTitle: true,
        elevation: 0.1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/black_white.png",
              width: 25,
              height: 25,
            )),
        title: Text(
          "Tips",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (context, index) {
            return TipRow(
              tipsModel: tipsDatails[index],
              isActive: index == 0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TipsDetailView(
                      tipsModel: tipsDatails[index],
                    ),
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black26,
              height: 1,
            );
          },
          itemCount: tipsDatails.length),
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
