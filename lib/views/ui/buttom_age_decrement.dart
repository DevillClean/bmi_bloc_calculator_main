
import 'package:flutter/material.dart';
import 'package:flutter_application_2/blocs/bmi_age_cubit/age_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgeButtonDecrement extends StatelessWidget {
  const AgeButtonDecrement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        BlocProvider.of<AgeCubit>(context)
            .ageDecrement();
      },
      shape: const CircleBorder(),
      constraints:
          const BoxConstraints.tightFor(
              width: 46.0, height: 46.0),
      elevation: 10,
      fillColor: const Color(0xFF222747),
      padding: const EdgeInsets.all(5),
      child: const Icon(
          FontAwesomeIcons.minus),
    );
  }
}

