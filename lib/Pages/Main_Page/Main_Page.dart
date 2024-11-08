import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../doctors_page.dart';
import '../../payment_method.dart';
import '../Home_page.dart';
import '../Profile_Screen/Profile_Screen.dart';
import '../Setting_Page/Notification_Page/NotificatonS_page.dart';
import '../Setting_Page/Setting_page.dart';
import 'Cubit/MainPage_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    // List of Navigation Icons
    List<String> navIcons = [
      "assets/icons/Home.png",
      "assets/icons/Profile.png",
      "assets/icons/Card.png",
      "assets/icons/Doc.png",
    ];

    return BlocProvider(
      create: (_) => MainPageCubit(),
      child: BlocConsumer<MainPageCubit, MainPageState>(
        listener: (context, state) {
          // Listen for page changes to update the page view accordingly
          if (state is HomePageState) {
            pageController.jumpToPage(0);
          } else if (state is ProfilePageState) {
            pageController.jumpToPage(1);
          } else if (state is CalendarPageState) {
            pageController.jumpToPage(2);
          } else if (state is NotificationPageState) {
            pageController.jumpToPage(3);
          }
        },
        builder: (context, state) {
          int selectedIndex = 0;

          // Determine the selected page based on the current state
          if (state is HomePageState) {
            selectedIndex = 0;
          } else if (state is ProfilePageState) {
            selectedIndex = 1;
          } else if (state is CalendarPageState) {
            selectedIndex = 2;
          } else if (state is NotificationPageState) {
            selectedIndex = 3;
          }

          return Scaffold(
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    HomePage(),
                    ProfilePage(),
                    PaymentMethod(),
                    DoctorsPage(),
                    //  ProfilePage(),
                    //CalendarPage(),
                    // NotificationPage(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Color(0xFF1C3764),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: List.generate(
                          navIcons.length,
                          (index) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<MainPageCubit>()
                                      .selectPage(index);
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        navIcons[index],
                                        width: 30,
                                        height: 30,
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : Colors.grey,
                                      ),
                                      const SizedBox(height: 5),
                                      AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}