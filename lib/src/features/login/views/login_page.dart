import 'package:auth_repository/auth_repository.dart';
import 'package:cyberman/constants.dart';
import 'package:cyberman/src/features/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Authentication',
          style: GoogleFonts.shareTechMono(color: primaryColor),
        ),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(authRepository: AuthRepository()),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.success && !state.loading) {
              context.go('/');
            } else if (!state.success && !state.loading) {
              final snackBar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              const snackBar = SnackBar(content: Text('Something went wrong'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            return Center(
              child: SizedBox(
                width: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInButton(
                      Buttons.Google,
                      text: 'Sign In with Google',
                      onPressed: () {
                        context.read<LoginBloc>().add(const SignInWithGoogle());
                      },
                    )
                    ,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
