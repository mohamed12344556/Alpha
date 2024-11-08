class Doctor {
  final int id;
  final String name;
  final int yearsOfExperience;
  final String rating;
  final String specialty;
  // final String imagePath;

  Doctor({
    required this.id,
    required this.name,
    required this.yearsOfExperience,
    required this.rating,
    required this.specialty,
    // required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'yearsOfExperience': yearsOfExperience,
      'rating': rating,
      'specialty': specialty,
      // 'imagePath': imagePath,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['id'],
      name: map['name'],
      yearsOfExperience: map['yearsOfExperience'],
      rating: map['rating'].toString().substring(0, 3),
      specialty: map['specialty'],
      // imagePath: map['imagePath'],
    );
  }
}
