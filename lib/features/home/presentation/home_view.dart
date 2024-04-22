import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:robocare/core/navigation.dart';
import 'package:robocare/features/add_patient/presentation/add_patient_screen.dart';
import 'package:robocare/features/home/presentation/drawer/app_drawer.dart';
import 'package:robocare/features/robot_schedule/presentation/scredule_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: key,
      endDrawer: const AppDrawer(),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Image.asset(
            "assets/images/user.png",
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
          child: Image.asset("assets/images/logo.png"),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              key.currentState!.openEndDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SvgPicture.asset(
                "assets/images/drawer.svg",
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  navigateTo(context, AddPatient());
                },
                child: SvgPicture.asset("assets/images/addpatient.svg")),
            SizedBox(
              height: size.height * 0.03,
            ),
            GestureDetector(
                onTap: () {
                  navigateTo(context, const ScheduleView());
                },
                child: SvgPicture.asset("assets/images/schedule.svg")),
          ],
        ),
      ),
    );
  }
}
