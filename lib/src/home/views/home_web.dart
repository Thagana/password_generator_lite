import 'package:cyberman/src/home/widgets/copy_password.dart';
import 'package:cyberman/src/home/widgets/header.dart';
import 'package:cyberman/src/home/widgets/password_length_slider.dart';
import 'package:cyberman/src/home/widgets/password_listview.dart';
import 'package:cyberman/src/home/widgets/password_value.dart';
import 'package:cyberman/src/home/widgets/password_variation_option.dart';
import 'package:cyberman/src/root/drawer_navigation.dart';
import 'package:flutter/material.dart';


class WebHome extends StatelessWidget {
  const WebHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              PasswordListView(
                width: 500,
              ),
            ],
          )
        ],
      ),
    );
  }
}
