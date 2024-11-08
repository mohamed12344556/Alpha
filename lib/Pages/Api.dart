import 'package:dio/dio.dart';

class MakePlansAPI {
  final Dio dio;

  MakePlansAPI(this.dio);

  // Base URL for the API (calendar URL)
  final String baseUrl =
      "https://muhammad.test.makeplans.net/manage/agenda/calendar";

  // Fetch the available agenda (plans) for a given booking ID and date
  Future<List<Map<String, dynamic>>> getAgenda(String bookingId, String date) async {
    try {
      final response = await dio.get(
        "$baseUrl?booking_id=$bookingId&date=$date",
      );
      if (response.statusCode == 200) {
        // Assuming the response contains a list of events or plans
        return List<Map<String, dynamic>>.from(response.data['data'] ?? []);
      } else {
        throw Exception("Failed to load agenda");
      }
    } catch (e) {
      print(e);
      throw Exception("Error occurred while fetching agenda");
    }
  }

  // Example method for making a reservation (POST request)
  Future<Map<String, dynamic>> createReservation(
      String bookingId, Map<String, dynamic> reservationData) async {
    try {
      final response = await dio.post(
        "$baseUrl/reservation?booking_id=$bookingId",
        data: reservationData,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed to create reservation");
      }
    } catch (e) {
      print(e);
      throw Exception("Error occurred while creating reservation");
    }
  }
}
