import 'package:flutter_bloc/flutter_bloc.dart';
import '../Api.dart';

// Define the states
abstract class AgendaState {}

class AgendaInitial extends AgendaState {}

class AgendaLoading extends AgendaState {}

class AgendaLoaded extends AgendaState {
  final List<Map<String, dynamic>> agenda;

  AgendaLoaded(this.agenda);
}

class AgendaError extends AgendaState {
  final String message;

  AgendaError(this.message);
}

// Define the cubit
class AgendaCubit extends Cubit<AgendaState> {
  final MakePlansAPI makePlansAPI;

  AgendaCubit(this.makePlansAPI) : super(AgendaInitial());

  // Fetch agenda for a specific booking and date
  void fetchAgenda(String bookingId, String date) async {
    try {
      emit(AgendaLoading());
      final agenda = await makePlansAPI.getAgenda(bookingId, date);
      emit(AgendaLoaded(agenda));
    } catch (e) {
      emit(AgendaError("Failed to load agenda"));
    }
  }

  // Create a reservation
  void createReservation(String bookingId, Map<String, dynamic> reservationData) async {
    try {
      final reservationResponse = await makePlansAPI.createReservation(bookingId, reservationData);
      // Handle the response (e.g., show confirmation, etc.)
    } catch (e) {
      emit(AgendaError("Failed to create reservation"));
    }
  }
}
