import 'package:cyberman/router/router.dart';
import 'package:cyberman/src/features/home/bloc/password_bloc.dart';
import 'package:cyberman/src/features/home/cubit/password_cubit.dart';
import 'package:cyberman/src/features/onbaording/blocs/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_repository/onboarding_repository.dart';
import 'package:password_repository/password_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordRepository = PasswordRepository();
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => passwordRepository)],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PasswordBloc>(
            create: (context) =>
                PasswordBloc(passwordRepository: passwordRepository)
                  ..add(const RequestPasswords()),
          ),
          BlocProvider(create: (context) => PasswordCubit()),
          BlocProvider(
            create: (context) => OnboardingBloc(
              onboardingRepository: OnboardingRepository(),
            )..add(const RequestOnboardingState()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Cyberman',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
