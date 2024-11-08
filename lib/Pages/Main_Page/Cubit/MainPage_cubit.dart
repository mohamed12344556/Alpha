import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MainPageState {}

class HomePageState extends MainPageState {}
class ProfilePageState extends MainPageState {}
class CalendarPageState extends MainPageState {}
class NotificationPageState extends MainPageState {}

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(HomePageState());

  void selectPage(int index) {
    if (index == 0) {
      emit(HomePageState());
    } else if (index == 1) {
      emit(ProfilePageState());
    } else if (index == 2) {
      emit(CalendarPageState());
    } else if (index == 3) {
      emit(NotificationPageState());
    }
  }
}
