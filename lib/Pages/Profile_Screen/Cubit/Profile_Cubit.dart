import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
      : super(ProfileState(
    name: 'Jonny',
    email: 'jonny@example.com',
    dob: '1999-01-01', // Add a default DOB
    mobile: '0123456789', // Add a default mobile number
  ));

  void toggleEditMode() {
    emit(state.copyWith(isEditing: !state.isEditing));
  }

  void updateProfile(String name, String email, String dob, String mobile) {
    emit(state.copyWith(
      name: name,
      email: email,
      dob: dob,
      mobile: mobile,
      isEditing: false,
    ));
  }
}

class ProfileState {
  final String name;
  final String email;
  final String dob;
  final String mobile;
  final bool isEditing;
  final File? image;

  ProfileState({
    required this.name,
    required this.email,
    required this.dob,
    required this.mobile,
    this.isEditing = false,
    this.image,
  });

  ProfileState copyWith({
    String? name,
    String? email,
    String? dob,
    String? mobile,
    bool? isEditing,
    File? image,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      mobile: mobile ?? this.mobile,
      isEditing: isEditing ?? this.isEditing,
      image: image ?? this.image,
    );
  }
}
