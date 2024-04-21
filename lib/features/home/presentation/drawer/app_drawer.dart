import 'package:flutter/material.dart';
import 'package:robocare/core/functions/logout.dart';
import 'package:robocare/core/themes/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.06),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                Image.asset("assets/images/user.png"),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Doctor's name",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primary,
                        )),
                    SizedBox(
                      height: size.height * 0.007,
                    ),
                    const Text("Medical Attendant",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        )),
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                MaterialButton(
                    padding: const EdgeInsets.all(15),
                    shape: const CircleBorder(),
                    onPressed: () {
                      logout(context);
                    },
                    color: const Color(0xFFFFF4F4),
                    child: Image.asset("assets/images/logout.png")),
                SizedBox(
                  width: size.width * 0.05,
                ),
                const Text("Log Out",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
