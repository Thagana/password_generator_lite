import 'package:cyberman/src/home/widgets/password_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordsApp extends StatelessWidget {
  const PasswordsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Passwords',
              style: GoogleFonts.shareTechMono(color: Colors.white),
            ),
            leading: IconButton(
              onPressed: () {
                context.go('/');
              },
              icon: const Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
              ),
            ),
          ),
          body: const ColoredBox(
            color: Colors.black,
            child: Column(
              children: [
                PasswordListView(
                  width: 500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
