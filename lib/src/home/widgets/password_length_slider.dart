import 'package:cyberman/constants.dart';
import 'package:cyberman/src/home/cubit/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordLengthSlider extends StatelessWidget {
  const PasswordLengthSlider({ required this.width, super.key });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: StreamBuilder<double>(
          stream: context.read<PasswordCubit>().passwordLengthStream,
          builder: (context, snapshot) {
            final value = snapshot.hasData ? snapshot.data! : 0.0;
            return Slider(
              value: value,
              max: 20,
              divisions: 20,
              thumbColor: secondaryColor,
              activeColor: primaryColor,
              label: value.toString(),
              onChanged: (double value) {
                context.read<PasswordCubit>().updatePasswordLength(value);
              },
            );
          },
        ),
      ),
    );
  }
}