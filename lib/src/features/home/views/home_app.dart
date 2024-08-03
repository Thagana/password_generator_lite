import 'package:cyberman/constants.dart';
import 'package:cyberman/src/features/home/widgets/copy_password.dart';
import 'package:cyberman/src/features/home/widgets/header.dart';
import 'package:cyberman/src/features/home/widgets/password_history_header.dart';
import 'package:cyberman/src/features/home/widgets/password_length_slider.dart';
import 'package:cyberman/src/features/home/widgets/password_listview.dart';
import 'package:cyberman/src/features/home/widgets/password_value.dart';
import 'package:cyberman/src/features/home/widgets/password_variation_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const PasswordValue(),
            const CopyPassword(),
            const PasswordLengthSlider(),
            const PasswordVariationOptions(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const PasswordHistoryHeader(),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          TextButton(
                            onPressed: () {
                              context.go('/view_more');
                            },
                            child: Text(
                              'View More',
                              style: GoogleFonts.shareTechMono(
                                color: secondaryColor,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const PasswordListView(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
