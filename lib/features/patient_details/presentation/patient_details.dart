import 'package:flutter/material.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/core/widgets/default_button.dart';
import 'package:robocare/core/widgets/default_container.dart';

class PatiendDetailsview extends StatelessWidget {
  const PatiendDetailsview({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: ColorManager.primary),
        leading: Card(
          color: Colors.white,
          shape: const CircleBorder(),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        centerTitle: true,
        title: const Text("Patient Medical Details",
            style: TextStyle(
              fontSize: 20,
              color: ColorManager.primary,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Robot Schedule:",
              style: TextStyle(
                fontSize: 20,
                color: ColorManager.primary,
              )),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              const Icon(Icons.alarm, size: 14, color: Colors.grey),
              SizedBox(
                width: size.width * 0.03,
              ),
              const Text("Due on 14:20 | 12 Aug 2022 ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ))
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.6,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: size.height * 0.03,
                      backgroundImage: const NetworkImage(
                          "https://th.bing.com/th/id/R.95082c6517f8e0297e545980d126db40?rik=JM81XkUDJKzZ4A&pid=ImgRaw&r=0"),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Text("Natasha Romanoff",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Text("Thyroid Dysfunction",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        )),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const DefaultContainer(
                        title: "medicine number one ", date: "11:00 AM"),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const DefaultContainer(
                        title: "medicine number two", date: "12:00 AM"),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const DefaultContainer(
                        title: "medicine number two", date: "12:00 AM")
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            children: [
              DefaultButton(
                  title: "Change",
                  backgroundColor: const Color(0xFFEAF9FF),
                  textColor: ColorManager.primary,
                  borderColor: const Color(0xFFEAF9FF),
                  width: size.width * 0.43,
                  height: size.height * 0.07,
                  onPressed: () {}),
              const Spacer(),
              DefaultButton(
                  title: "Add +",
                  backgroundColor: const Color(0xFFEAF9FF),
                  textColor: ColorManager.primary,
                  borderColor: ColorManager.primary,
                  width: size.width * 0.43,
                  height: size.height * 0.07,
                  onPressed: () {})
            ],
          )
        ]),
      ),
    );
  }
}
