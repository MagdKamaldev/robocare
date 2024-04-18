import 'package:flutter/material.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/core/widgets/default_container.dart';

class AddMedicationView extends StatelessWidget {
  const AddMedicationView({super.key});

  @override
  Widget build(BuildContext context) {
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
          title: const Text("Add Medication",
              style: TextStyle(
                fontSize: 20,
                color: ColorManager.primary,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const DefaultContainer(
                  title: "Enter Name: ", date: "00:00 Am");
            },
            itemCount: 5,
          ),
        ));
  }
}
