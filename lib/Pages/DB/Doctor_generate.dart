import 'dart:math';
import 'dart:io';

import 'Doctor.dart';

List<String> names = ['Dr. John', 'Dr. Alice', 'Dr. Bob', 'Dr. Emma', 'Dr. Chris'];
List<String> specialties = ['Cardiologist', 'Dermatologist', 'Neurologist', 'Pediatrician', 'Orthopedic'];
Random random = Random();

String getRandomName() {
  return names[random.nextInt(names.length)];
}

int getRandomYearsOfExperience() {
  return random.nextInt(21) + 1; // Random years between 1 and 20
}

double getRandomRating() {
  return (random.nextInt(5) + 1) + random.nextDouble(); // Rating between 1.0 and 5.0
}

String getRandomSpecialty() {
  return specialties[random.nextInt(specialties.length)];
}

// String getRandomImagePath() {
//   // List<String> imageFiles = Directory('assets/images/').listSync().map((e) => e.path).toList();
//   return imageFiles[random.nextInt(imageFiles.length)];
// }

Doctor generateRandomDoctor(int id) {
  return Doctor(
    id: id,
    name: getRandomName(),
    yearsOfExperience: getRandomYearsOfExperience(),
    rating: getRandomRating().toString(),
    specialty: getRandomSpecialty(),
    // imagePath: getRandomImagePath(),
  );
}
