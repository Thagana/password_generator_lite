import 'package:cyberman/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key


class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: primaryColor,
          ),
          onPressed: () {
            if (_key.currentState != null) {
              _key.currentState!.openDrawer();
            }
          },
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
              onTap: () {
                context.go('/');
              },
            ),
            ListTile(
              title: Text(
                'Passwords_',
                style: GoogleFonts.shareTechMono(color: Colors.white),
              ),
              onTap: () {
                context.go('/passwords');
              },
            ),
            ListTile(
              title: Text(
                'Settings_',
                style: GoogleFonts.shareTechMono(color: Colors.white),
              ),
              onTap: () {
                context.go('/settings');
              },
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
