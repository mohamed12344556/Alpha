import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'DB/Doctor.dart';
import 'Data_Collection/Data_Cubit.dart';
import 'Data_Collection/Data_State.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final TextEditingController searchController = TextEditingController();
    final Function(String)? onChanged;
    final StringhintText = "Search";
    DateTime selectedDate = DateTime.now();

    return BlocBuilder<DoctorCubit, List<Doctor>>(
      builder: (context, doctors) {
        // if (doctors is DoctorLoading) {
        //   return const Center(child: CircularProgressIndicator());
        // }

        return LayoutBuilder(builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: screenWidth,
              height: screenHeight,
              color: Colors.white,
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //HeaderSection
                      Column(
                        children: [
                          Container(
                            width: screenWidth,
                            height: screenHeight * 0.15,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    child: Image.asset(
                                        width: screenWidth * 0.28,
                                        alignment: Alignment.topCenter,
                                        height: screenHeight * 0.15,
                                        fit: BoxFit.scaleDown,
                                        "assets/images/Man.png")),
                                Container(
                                  width: screenWidth * 0.6,
                                  height: screenHeight * 0.15,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: screenWidth * 0.5,
                                        height: screenHeight * 0.07,
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Hi,WelcomeBack",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              "MuhammadAbdo",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF1C3764)
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15))),
                                            width: screenWidth * 0.4,
                                            height: screenHeight * 0.05,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  prefixIcon: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Image.asset(
                                                        "assets/icons/Search.png"),
                                                  ),
                                                  //Addasearchicon
                                                  hintText: 'search',
                                                  hintStyle: const TextStyle(
                                                      fontSize: 20)),
                                            ),
                                          ),
                                          Container(
                                            width: screenWidth * 0.2,
                                            height: screenHeight * 0.08,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                GestureDetector(
                                                  child: Image.asset(
                                                    width: screenWidth * 0.1,
                                                    color: Colors.black,
                                                    "assets/icons/Stethoscope.png",
                                                  ),
                                                ),
                                                GestureDetector(
                                                  child: Image.asset(
                                                      width: screenWidth * 0.09,
                                                      color: Colors.black,
                                                      "assets/icons/Heart.png"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: screenWidth,
                        height: screenHeight * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: screenWidth * 0.32,
                                  height: screenHeight * 0.3,
                                  child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 6,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      mainAxisExtent:
                                          (screenHeight * 0.3) / 3.2,
                                    ),
                                    itemBuilder: (context, index) {
                                      final Scheduled = [1, 2, 6];
                                      final isScheduled =
                                          Scheduled.contains(index);
                                      final currentDate = DateTime.now()
                                          .subtract(
                                            Duration(
                                                days: DateTime.now().weekday %
                                                    7), //AdjusttoSunday
                                          )
                                          .add(Duration(days: index));

                                      final numDate =
                                          DateFormat('d').format(currentDate);

                                      final formattedDate =
                                          DateFormat('EEE').format(currentDate);

                                      final firstLetter =
                                          formattedDate.substring(0, 3);
                                      return Container(
                                        decoration: BoxDecoration(
                                            boxShadow: List.from([
                                              const BoxShadow(
                                                  offset: Offset(0, 1),
                                                  blurRadius: 2)
                                            ]),
                                            color: isScheduled
                                                ? Colors.white
                                                : const Color(0xFF1C3764),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15))),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                numDate,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: isScheduled
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              ),
                                              Text(
                                                firstLetter,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: isScheduled
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF1C3764).withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              width: screenWidth * 0.55,
                              height: screenHeight * 3,
                            ),
                          ],
                        ),
                      ),
                      //DoctorsListSection
                      Container(
                          width: screenWidth,
                          height: screenHeight * 0.45,
                          // doctors is DoctorLoaded?
                          child: ListView.builder(
                            padding:
                                EdgeInsets.only(bottom: screenHeight * 0.1),
                            itemCount: doctors.length,
                            itemBuilder: (context, index) {
                              final doctor = doctors[index];
                              return Container(
                                color: Colors.white,
                                width: screenWidth,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Card(
                                      color: Colors.grey.shade300,
                                      elevation: 4,
                                      child: ListTile(
                                        leading: Container(
                                          width: screenWidth * 0.2,
                                          height: screenHeight * 0.4,
                                          child: Image.asset("assets/images/Man.png"),
                                        ),
                                        title: Text(
                                            style:
                                                const TextStyle(fontSize: 20),
                                            doctor.name),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                style: const TextStyle(
                                                    fontSize: 15),
                                                '${doctor.specialty}'),
                                            Text(
                                                style: const TextStyle(
                                                    fontSize: 15),
                                                '${doctor.yearsOfExperience} years'),
                                            Container(
                                              alignment: Alignment.center,
                                              width: screenWidth * 0.2,
                                              height: screenHeight * 0.05,
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Image.asset(
                                                      color: const Color(
                                                          0xFF1C3764),
                                                      width: screenWidth * 0.05,
                                                      height:
                                                          screenWidth * 0.05,
                                                      "assets/icons/Star.png"),
                                                  Text('${doctor.rating}'),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                          // : const Center(child: Text("Nodoctorsavailable")),
                          ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
