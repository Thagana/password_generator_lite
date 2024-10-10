import 'package:cyberman/constants.dart';
import 'package:cyberman/src/features/home/cubit/password_cubit.dart';
import 'package:cyberman/src/features/onbaording/blocs/onboarding_bloc.dart';
import 'package:cyberman/src/features/onbaording/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingWeb extends StatelessWidget {
  const OnboardingWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state.isDone) {
          GoRouter.of(context).pushReplacement('/');
        }
        if (state.errorMessage != '') {
          final snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: StreamBuilder<String>(
                  stream: context.read<PasswordCubit>().passwordStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: controller..text = snapshot.data ?? '',
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1),
                        ),
                        labelText: 'Password',
                        hintText: 'Enter your master password',
                      ),
                      style: GoogleFonts.shareTechMono(
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
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
                    onPressed: () {},
                    child: const Text('Generate Again'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
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
                    onPressed: () {},
                    child: const Text('Copy'),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    'Copy the master generated password and keep it safe',
                    style: GoogleFonts.shareTechMono(
                      fontSize: 15,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
