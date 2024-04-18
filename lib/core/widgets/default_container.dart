import 'package:flutter/material.dart';
import 'package:robocare/core/themes/colors.dart';

class DefaultContainer extends StatelessWidget {
  final String title;
  final String date;
  const DefaultContainer({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: Colors.white,
            ),
            height: size.height * 0.048,
            width: double.infinity,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.grey, fontSize: size.height * 0.015),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              color: ColorManager.primary,
            ),
            height: size.height * 0.048,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.alarm,
                    size: size.height * 0.02, color: Colors.white),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  date,
                  style: TextStyle(
                      color: Colors.white, fontSize: size.height * 0.015),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
