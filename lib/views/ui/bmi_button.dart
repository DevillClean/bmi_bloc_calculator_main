import 'package:flutter/material.dart';
import 'package:flutter_application_2/blocs/bmi_calculate_cubit/calculate_bmi_cubit.dart';
import 'package:flutter_application_2/views/ui/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiButton extends StatelessWidget {
  const BmiButton({
    super.key,
    required this.age,
    required this.heigh,
    required this.weight,
  });

  final int age;
  final int heigh;
  final int weight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 7, 37, 61),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: appText(context, 'BMI', 18, Colors.white),
        ),
        onPressed: () {
          BlocProvider.of<CalculateBmiCubit>(context)
              .saveData(age: age, height: heigh, weight: weight);
        },
      ),
    );
  }
}