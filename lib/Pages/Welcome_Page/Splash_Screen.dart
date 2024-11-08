import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lordicon/lordicon.dart';
import '../Auth_pages/login_page.dart';
import '../Auth_pages/register_page.dart';
import 'Cubit/Welcome_page_cubit.dart';
import '../Widgets/My_signin button.dart';

class Splash_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WelcomepageCubit(),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<WelcomepageCubit, WelcomePageState>(
            builder: (context, state) {
              final cubit = context.read<WelcomepageCubit>();
              bool showFirstView = state is WelcomepageInitial;

              return LayoutBuilder(
                builder: (context, constraints) {
                  final screenWidth = constraints.maxWidth;
                  final screenHeight = constraints.maxHeight;

                  return AnimatedCrossFade(
                    crossFadeState: showFirstView
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 200),
                    firstChild: Center(
                      child: IconViewer(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.3,
                        controller: cubit.iconController,
                      ),
                    ),
                    secondChild: SingleChildScrollView(
                      child: Container(
                        width: screenWidth,
                        height: screenHeight * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image.asset(
                                  "assets/images/LOGO.png",
                                  width: screenWidth * 0.5,
                                  height: screenHeight * 0.3,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  "Alpha Medic",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.08,
                                    color: const Color(0xFF1C3764),
                                    fontFamily: "PaytoneOne",
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: screenWidth,
                              height: screenHeight * 0.25,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Welcome to Your Personal Medical Center,\nwhere your health is always our top priority.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.04,
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth,
                                    height: screenHeight * 0.15,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        LoginButton(
                                          onTap: () => cubit.navigateToControl(
                                              context, LoginPage()),
                                          radius: 10,
                                          String: "Login",
                                          Color: Colors.white,
                                          height: screenHeight * 0.06,
                                          width: screenWidth * 0.5,
                                          List: [
                                            Color(0xFF1C3764),
                                            Color(0xFF1C3764)
                                          ],
                                        ),
                                        LoginButton(
                                          onTap: () => cubit.navigateToControl(
                                              context, RegisterPage()),
                                          radius: 10,
                                          String: "Register",
                                          Color: Colors.white,
                                          height: screenHeight * 0.06,
                                          width: screenWidth * 0.5,
                                          List: [Colors.black, Colors.black],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
