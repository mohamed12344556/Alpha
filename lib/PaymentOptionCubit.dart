import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodCubit extends Cubit<String?> {
  PaymentMethodCubit() : super(null);

  void selectPaymentMethod(String method) {
    emit(method);
  }
}