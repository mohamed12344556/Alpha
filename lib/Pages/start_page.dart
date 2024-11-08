import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Home_page.dart';
import 'Widgets/My_signin button.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ControlPageState) {
            return HomePage();
          }
          var cubit = BlocProvider.of<AppCubit>(context);

          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/LOGO.png",
                              fit: BoxFit.contain,
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              height: MediaQuery.sizeOf(context).height * 0.3,
                            ),
                          ),
                          Text(
                            "Medicina",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFF187896),
                                fontFamily: "PaytoneOne"),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              "Welcom to your Small Pharmacy, where\nyour health is our top priority",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: MediaQuery.sizeOf(context).height * 0.14,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LoginButton(
                                      onTap: () {
                                        BlocProvider.of<AppCubit>(context)
                                            .navigateToControl();
                                      },
                                      radius: 10,
                                      String: "Login",
                                      Color: Colors.white,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.06,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      List: [
                                        Color(0xFF187896),
                                        Color(0xFF187896)
                                      ]),
                                  LoginButton(
                                      onTap: () {
                                        BlocProvider.of<AppCubit>(context)
                                            .navigateToControl();
                                      },
                                      radius: 10,
                                      String: "Login",
                                      Color: Colors.white,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.06,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      List: [Colors.black, Colors.black]),
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
            ),
          );
        },
      ),
    );
  }
}
