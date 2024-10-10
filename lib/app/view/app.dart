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
    final onboardingRepository = OnboardingRepository();

    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => passwordRepository)],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => OnboardingBloc(
              onboardingRepository: onboardingRepository,
            )..add(const RequestOnboardingState()),
          ),
          BlocProvider(create: (context) => PasswordCubit()),
        ],
        child: Builder(
          builder: (context) {
            final plainPassword = context.watch<OnboardingBloc>().state.plainPassword;
            return MultiBlocProvider(
              providers: [
                BlocProvider<PasswordBloc>(
                  create: (context) =>
                  PasswordBloc(passwordRepository: passwordRepository)
                    ..add(RequestPasswords(plainPassword: plainPassword)),
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
            );
          },
        ),
      ),
    );
  }
}
