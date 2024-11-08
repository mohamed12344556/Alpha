import 'package:flutter_bloc/flutter_bloc.dart';

enum SettingsPageType { notification, password, deleteAccount }

class SettingsPageCubit extends Cubit<SettingsPageType?> {
  SettingsPageCubit() : super(null);

  void navigateTo(SettingsPageType pageType) => emit(pageType);
}
