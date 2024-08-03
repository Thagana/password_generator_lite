import 'package:cyberman/src/features/home/bloc/password_bloc.dart';
import 'package:cyberman/src/features/home/cubit/password_cubit.dart';
import 'package:cyberman/src/features/onbaording/blocs/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CopyPassword extends StatelessWidget {
  const CopyPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xfffdee00),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          child: Text(
            'Copy Password',
            style: GoogleFonts.shareTechMono(
              fontSize: 15,
              color: const Color(0xff000000),
            ),
          ),
          onPressed: () async {
            final password = context.read<PasswordCubit>().passwordValue;
            await Clipboard.setData(ClipboardData(text: password));
            if (!context.mounted) return;
            final strength =
                context.read<PasswordCubit>().passwordStrengthToInt();
            final state = context.read<OnboardingBloc>().state;
            final plainPassword = state.plainPassword;

            context.read<PasswordBloc>().add(
                  RequestAddPassword(
                    password: password,
                    name: 'DEFAULT_NAME',
                    strength: strength,
                    plainPassword: plainPassword,
                  ),
                );
          },
        ),
      ),
    );
  }
}
