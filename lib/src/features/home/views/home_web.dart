import 'package:cyberman/src/features/home/widgets/index.dart';
import 'package:flutter/material.dart';

class WebHome extends StatelessWidget {
  const WebHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 500, maxWidth: 600),
                child: const Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Header(),
                          PasswordValue(),
                          CopyPassword(),
                          PasswordLengthSlider(),
                          PasswordVariationOptions(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 500, maxWidth: 600),
                child: const Row(
                  children: [
                    Expanded(
                      child: PasswordListView(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
