  import 'package:alpha/doctors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorCard extends StatelessWidget {
  final Map<String, String> doctor;
  final bool isFavorite;

  const DoctorCard({
    Key? key,
    required this.doctor,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color(0xffCECECE),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(doctor['image']!),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor['name']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1C3764),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    doctor['degree']!,
                    style: TextStyle(
                      color: Color(0xff1C3764),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    doctor['specialty']!,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1C3764),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        ),
                        child: const Text(
                          'Info',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          final cubit = context.read<DoctorsCubit>();
                          if (isFavorite) {
                            cubit.removeFavorite(doctor['name']!);
                          } else {
                            cubit.addFavorite(doctor['name']!);
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.info_outline, color: Colors.grey),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.chat_bubble_outline, color: Colors.grey),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




const List<Map<String, String>> doctorsData = [
  {
    'name': 'Dr. Alexander Bennett',
    'degree': 'Ph.D.',
    'specialty': 'Dermato-Genetics',
    'image': 'assets/images/doctor.png'
  },
  {
    'name': 'Dr. Michael Davidson',
    'degree': 'M.D.',
    'specialty': 'Solar Dermatology',
    'image': 'assets/images/doc2.png'
  },
  {
    'name': 'Dr. Olivia Turner',
    'degree': 'M.D.',
    'specialty': 'Dermato-Endocrinology',
    'image': 'assets/images/doc3.png'
  },
  {
    'name': 'Dr. Sophia Martinez',
    'degree': 'Ph.D.',
    'specialty': 'Cosmetic Bioengineering',
    'image': 'assets/images/doc4.png'
  },
];                               