import 'package:flutter_bloc/flutter_bloc.dart';

import '../DB/DB.dart';
import '../DB/Doctor.dart';

class DoctorCubit extends Cubit<List<Doctor>> {
  DoctorCubit() : super([]);

  Future<void> loadDoctors() async {
    List<Doctor> doctors = await DatabaseHelper.instance.getDoctors();
    emit(doctors);
  }

  Future<void> addDoctors(List<Doctor> doctors) async {
    for (var doctor in doctors) {
      await DatabaseHelper.instance.insertDoctor(doctor);
    }
    loadDoctors();
  }
}
