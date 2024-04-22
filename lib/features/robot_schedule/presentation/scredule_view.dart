import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robocare/core/navigation.dart';
import 'package:robocare/core/themes/colors.dart';
import 'package:robocare/core/widgets/default_button.dart';
import 'package:robocare/features/add_patient/presentation/add_patient_screen.dart';
import 'package:robocare/features/robot_schedule/logic/cubit/patients_cubit.dart';
import 'package:robocare/features/robot_schedule/presentation/widgets/patient_item.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PatientsCubit.get(context).getPatients();
    return BlocConsumer<PatientsCubit, PatientsState>(
      listener: (context, state) {},
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
          title: const Text("Robot Task Details",
              style: TextStyle(
                fontSize: 20,
                color: ColorManager.primary,
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              if (state is PatientsLoading)
                const Center(child: CircularProgressIndicator()),
              if (state is PatientsSuccess)
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (context, index) => PatientItem(
                    patient: state.patients[index],
                  ),
                  itemCount: state.patients.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                children: [
                  defaultButton(
                      title: "Back",
                      backgroundColor: const Color(0xFFEAF9FF),
                      textColor: ColorManager.primary,
                      borderColor: const Color(0xFFEAF9FF),
                      width: size.width * 0.43,
                      height: size.height * 0.07,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      size: size),
                  const Spacer(),
                  defaultButton(
                      size: size,
                      title: "Add Patient",
                      backgroundColor: const Color(0xFFEAF9FF),
                      textColor: ColorManager.primary,
                      borderColor: ColorManager.primary,
                      width: size.width * 0.43,
                      height: size.height * 0.07,
                      onPressed: () {
                        navigateTo(context, AddPatient());
                      })
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
