import 'package:flutter_bloc/flutter_bloc.dart';
import 'notificatios_state.dart';

class notificationSCubit extends Cubit<notificationS_State> {
  notificationSCubit() : super(notificationS_State.initial());

  // Toggle individual notification settings
  void toggleSetting(String settingName) {
    switch (settingName) {
      case 'General Notification':
        emit(state.copyWith(
            generalNotification: !state.generalNotification));
        break;
      case 'Sound':
        emit(state.copyWith(sound: !state.sound));
        break;
      case 'Vibrate':
        emit(state.copyWith(vibrate: !state.vibrate));
        break;
      case 'Special Offers':
        emit(state.copyWith(specialOffers: !state.specialOffers));
        break;
      case 'Payments':
        emit(state.copyWith(payments: !state.payments));
        break;
      case 'Promo & Discount':
        emit(state.copyWith(promoDiscount: !state.promoDiscount));
        break;
      case 'Cashback':
        emit(state.copyWith(cashback: !state.cashback));
        break;
      default:
        break;
    }
  }
}
