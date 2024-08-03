import 'package:cyberman/src/features/onbaording/cubit/onboarding_cubit.dart';
import 'package:cyberman/src/features/onbaording/views/onboarding_app.dart';
import 'package:cyberman/src/features/onbaording/views/onboarding_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider(
        create: (context) => OnboardingCubit(),
        child: kIsWeb ? const OnboardingWeb() : const OnboardingApp(),
      ),
    );
  }
}
