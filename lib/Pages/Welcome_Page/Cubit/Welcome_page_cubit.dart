import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lordicon/lordicon.dart';

class WelcomepageCubit extends Cubit<WelcomePageState> {
  Timer? _timer;
  final IconController iconController;

  WelcomepageCubit()
      : iconController =
            IconController.assets('assets/animation/perfectt_blue.json'),
        super(WelcomepageInitial()) {
    _startTimer();
    _initializeAnimation();
  }

  // Initialize the icon animation
  void _initializeAnimation() {
    iconController.addStatusListener((status) {
      if (status == ControllerStatus.ready) {
        iconController.playFromBeginning(); // Start the animation
      }
    });
  }

  // Start the timer to change the view
  void _startTimer() {
    _timer = Timer(const Duration(seconds: 6), () {
      emit(ShowSecondView()); // Emit the state to show the second view
    });
  }

  // Clean up resources
  @override
  Future<void> close() {
    _timer?.cancel();
    iconController.dispose();
    return super.close();
  }

  // Method to navigate to other screens
  void navigateToControl(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}

abstract class WelcomePageState {}

class WelcomepageInitial extends WelcomePageState {} // Initial state

class ShowSecondView extends WelcomePageState {} // Show second view
