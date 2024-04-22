import 'package:flutter/material.dart';
import 'package:robocare/core/models/patient/patient/patient.dart';
import 'package:robocare/core/navigation.dart';
import 'package:robocare/features/patient_details/presentation/patient_details.dart';

class PatientItem extends StatelessWidget {
  final Patient patient;
  const PatientItem({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        navigateTo(context, const PatiendDetailsview());
      },
      child: Container(
        width: double.infinity,
        height: size.height * 0.2,
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
                Text(patient.attributes!.name.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(patient.attributes!.medicalProblem.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
