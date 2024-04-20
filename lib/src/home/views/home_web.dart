import 'package:cyberman/constants.dart';
import 'package:cyberman/src/home/widgets/copy_password.dart';
import 'package:cyberman/src/home/widgets/header.dart';
import 'package:cyberman/src/home/widgets/password_length_slider.dart';
import 'package:cyberman/src/home/widgets/password_listview.dart';
import 'package:cyberman/src/home/widgets/password_value.dart';
import 'package:cyberman/src/home/widgets/password_variation_option.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class WebHome extends StatelessWidget {
  const WebHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: primaryColor,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: secondaryLightColor,
              ),
              child: Text(
                'Cyberman_',
                style: GoogleFonts.shareTechMono(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(
                'Home_',
                style: GoogleFonts.shareTechMono(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text('Passwords_',
                style: GoogleFonts.shareTechMono(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text('Settings_',
                style: GoogleFonts.shareTechMono(color: Colors.white),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Header(),
                    PasswordValue(width: 500),
                    CopyPassword(width: 500),
                    PasswordLengthSlider(width: 500),
                    PasswordVariationOptions(
                      width: 500,
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                PasswordListView(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
