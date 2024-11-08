import 'package:bloc/bloc.dart';

class CardCubit extends Cubit<Map<String, dynamic>> {
  CardCubit() : super({
    'cardHolderName': {'value': '', 'isFieldValid': true},
    'cardNumber': {'value': '', 'isFieldValid': true},
    'expiryDate': {'value': '', 'isFieldValid': true},
    'cvv': {'value': '', 'isFieldValid': true},
  });

  void updateField(String field, String value) {
    emit({
      ...state,
      field: {
        'value': value,
        'isFieldValid': value.isNotEmpty, 
      },
    });
  }

  bool saveCard() {
    bool isValid = true;
    state.forEach((key, field) {
      if (field['value'].isEmpty) {
        isValid = false;
        emit({
          ...state,
          key: {
            'value': field['value'],
            'isFieldValid': false, 
          },
        });
      }
    });
    return isValid;
  }
}
