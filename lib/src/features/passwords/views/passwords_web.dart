import 'package:cyberman/constants.dart';
import 'package:cyberman/src/features/home/bloc/password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordsWeb extends StatelessWidget {
  const PasswordsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 500,
                  child: BlocConsumer<PasswordBloc, PasswordState>(
                    listener: (BuildContext context, PasswordState state) {
                      //
                    },
                    builder: (context, state) {
                      if (state.passwords.isNotEmpty) {
                        return ListView.builder(
                          itemCount: state.passwords.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              background: const ColoredBox(
                                color: Colors.blue,
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.edit, color: Colors.white),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              secondaryBackground: const ColoredBox(
                                color: Colors.red,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(Icons.delete, color: Colors.white),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onDismissed: (direction) {
                                if (direction == DismissDirection.endToStart) {
                                  context.read<PasswordBloc>().add(
                                        RequestDelete(
                                          password:
                                              state.passwords[index].password,
                                        ),
                                      );
                                } else if (direction ==
                                    DismissDirection.startToEnd) {
                                  context.go('/edit-password');
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  key: UniqueKey(),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.passwords[index].password,
                                            style: GoogleFonts.shareTechMono(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            state.passwords[index].date,
                                            style: GoogleFonts.shareTechMono(
                                              color: const Color.fromRGBO(
                                                217,
                                                222,
                                                226,
                                                1,
                                              ),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          await Clipboard.setData(
                                            ClipboardData(
                                              text: state
                                                  .passwords[index].password,
                                            ),
                                          );
                                          final snackBar = SnackBar(
                                            content: Text(
                                              'Password copied!',
                                              style: GoogleFonts.shareTechMono(
                                                color: primaryColor,
                                              ),
                                            ),
                                          );
                                          if (!context.mounted) return;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                        icon: const Icon(
                                          Icons.copy,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                        child: Text(
                          "You don't have and passwords",
                          style: GoogleFonts.shareTechMono(color: primaryColor),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
