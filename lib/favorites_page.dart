import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_card.dart';
import 'doctors_cubit.dart';
import 'doctors_page.dart';


class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

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
          'Favorite',
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
                  onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorsPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xffCECECE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'A - Z',
                      style: TextStyle(
                        color: Color(0xff1C3764),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    // أكشن لإظهار المفضلة
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xff1C3764),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite_border, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16), // مسافة بين المكونات
            Expanded(
              child: BlocBuilder<DoctorsCubit, List<String>>(
                builder: (context, favoriteDoctors) {
                  if (favoriteDoctors.isEmpty) {
                    return Center(
                      child: Text(
                        'No favorites added yet',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: favoriteDoctors.length,
                    itemBuilder: (context, index) {
                      final doctorName = favoriteDoctors[index];
                      final doctor = doctorsData.firstWhere(
                        (doc) => doc['name'] == doctorName,
                        orElse: () => {},
                      );

                      if (doctor == null) return const SizedBox.shrink();

                      return DoctorCard(
                        doctor: doctor,
                        isFavorite: true,
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