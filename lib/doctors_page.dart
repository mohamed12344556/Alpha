import 'package:alpha/doctor_card.dart';
import 'package:alpha/doctors_cubit.dart';
import 'package:alpha/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsPage extends StatelessWidget {
  DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xff1C3764)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Doctors',
          style: TextStyle(
            color: Color(0xff1C3764),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 11),
            decoration: const BoxDecoration(
              color: Color(0xffCECECE),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.search, color: Color(0xff1C3764)),
              onPressed: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 11),
            decoration: const BoxDecoration(
              color: Color(0xffCECECE),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.sort, color: Color(0xff1C3764)),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Sort By',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xff1C3764),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'A - Z',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoritesPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xffCECECE),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite_border,
                        color: Color(0xff1C3764)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: BlocBuilder<DoctorsCubit, List<String>>(
                builder: (context, favoriteDoctors) {
                  return ListView.builder(
                    itemCount: doctorsData.length,
                    itemBuilder: (context, index) {
                      final doctor = doctorsData[index];
                      final isFavorite =
                          favoriteDoctors.contains(doctor['name']!);

                      return DoctorCard(
                        doctor: doctor,
                        isFavorite: isFavorite,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
