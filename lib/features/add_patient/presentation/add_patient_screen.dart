import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/core/widgets/default_button.dart';
import 'package:robocare/core/widgets/default_form_field.dart';
import 'package:robocare/core/widgets/show_snack_bar.dart';
import 'package:robocare/features/add_patient/logic/cubit/add_patient_cubit.dart';

// ignore: must_be_immutable
class AddPatient extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController diagonticsController = TextEditingController();
  TextEditingController problemContoller = TextEditingController();
  AddPatient({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<AddPatientCubit, AddPatientState>(
      listener: (context, state) {
        if (state is AddPatientSuccess) {
          Navigator.pop(context);
          showCustomSnackBar(context,
              "Added : ${state.patient.attributes!.name}", Colors.green);
        }
      },
      builder: (context, state) => Scaffold(
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
          child: Form(
            key: formKey,
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
                          label: "22",
                          title: "Age",
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
                          label: "Male/Female",
                          title: "Gender",
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
                      if (state is! AddPatientLoading)
                        defaultButton(
                            title: "Add",
                            backgroundColor: ColorManager.primary,
                            textColor: Colors.white,
                            borderColor: ColorManager.primary,
                            width: double.infinity,
                            height: size.height * 0.07,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                AddPatientCubit.get(context).addPatient(
                                  context: context,
                                  name: nameController.text,
                                  age: int.parse(ageController.text),
                                  gender: genderController.text,
                                  diagnotics: diagonticsController.text,
                                  medicalProblem: problemContoller.text,
                                );
                              }
                            },
                            size: size),
                      if (state is AddPatientLoading)
                        const Center(child: CircularProgressIndicator())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
