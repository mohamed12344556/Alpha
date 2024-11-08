import 'package:alpha/Pages/Welcome_Page/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Pages/DB/DB.dart';
import 'Pages/DB/Doctor.dart';
import 'Pages/DB/Doctor_generate.dart';
import 'Pages/Data_Collection/Data_Cubit.dart';
import 'Pages/Main_Page/Main_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create random doctors and insert them into the database if they are not already added
  List<Doctor> randomDoctors = [];
  for (int i = 0; i < 50; i++) {
    randomDoctors.add(generateRandomDoctor(i + 1));
  }

  // Insert the doctors into the database
  for (var doctor in randomDoctors) {
    await DatabaseHelper.instance.insertDoctor(doctor);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DoctorCubit()..loadDoctors(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Quicksand",
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1C3764)),
          useMaterial3: true,
        ),
        home: Splash_screen(),
      ),
    );
  }
}
