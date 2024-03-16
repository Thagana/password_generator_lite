import 'package:cyberman/src/home/cubit/password_cubit.dart';
import 'package:cyberman/src/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordCubit>(
      create: (context) => PasswordCubit(),
      child: kIsWeb ? const WebHome() : const HomeApp(),
    );
  }
}
