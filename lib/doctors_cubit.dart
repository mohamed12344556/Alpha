import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsCubit extends Cubit<List<String>> {
  DoctorsCubit() : super([]);

  void addFavorite(String doctorName) {
    final updatedFavorites = List<String>.from(state)..add(doctorName);
    emit(updatedFavorites);
  }

  void removeFavorite(String doctorName) {
    final updatedFavorites = List<String>.from(state)..remove(doctorName);
    emit(updatedFavorites);
  }

  bool isFavorite(String doctorName) {
    return state.contains(doctorName);
  }
}
