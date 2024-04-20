import 'package:flutter/material.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/core/widgets/default_button.dart';
import 'package:robocare/core/widgets/default_form_field.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController diagonticsController = TextEditingController();
    TextEditingController problemContoller = TextEditingController();
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
        title: const Text("Add patient",
            style: TextStyle(
              fontSize: 20,
              color: ColorManager.primary,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 0.08,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Patient Personal Data:",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      onSubmit: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return " cannot be empty";
                        }
                      },
                      label: "John Doe",
                      title: "Name",
                      context: context),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  defaultFormField(
                      controller: ageController,
                      type: TextInputType.name,
                      onSubmit: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return " cannot be empty";
                        }
                      },
                      label: "Age",
                      title: "22",
                      context: context),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  defaultFormField(
                      controller: genderController,
                      type: TextInputType.name,
                      onSubmit: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return " cannot be empty";
                        }
                      },
                      label: "Gender",
                      title: "Male",
                      context: context),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  defaultFormField(
                      controller: diagonticsController,
                      type: TextInputType.name,
                      onSubmit: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return " cannot be empty";
                        }
                      },
                      label: "label",
                      title: "Diagnotics",
                      context: context),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  defaultFormField(
                      controller: problemContoller,
                      type: TextInputType.name,
                      onSubmit: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return " cannot be empty";
                        }
                      },
                      label: "label",
                      title:
                          "Medical problem: (Surgical illness or Trauma or fracture etc...)",
                      context: context),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  defaultButton(
                      title: "Add",
                      backgroundColor: ColorManager.primary,
                      textColor: Colors.white,
                      borderColor: ColorManager.primary,
                      width: double.infinity,
                      height: size.height * 0.07,
                      onPressed: () {},
                      size: size)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
