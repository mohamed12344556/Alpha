import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'PaymentOptionCubit.dart';
import 'PaymentOptionItem.dart';
import 'add_card.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentMethodCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Payment Method',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/XMLID_16_.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Credit & Debit Card',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCard(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1C3764),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.credit_card,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          const Text(
                            'Add New Card',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'More Payment Option',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<PaymentMethodCubit, String?>(
                    builder: (context, selectedOption) {
                      return Column(
                        children: [
                          PaymentOptionTextField(
                            imagePath: 'assets/images/Vector.png',
                            label: 'Apple Pay',
                            isSelected: selectedOption == 'Apple Pay',
                            onSelected: () {
                              context.read<PaymentMethodCubit>().selectPaymentMethod('Apple Pay');
                              
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddCard(),
                                ),
                              );
                            },
                          ),
                          PaymentOptionTextField(
                            imagePath: 'assets/images/paypal.png',
                            label: 'Paypal',
                            isSelected: selectedOption == 'Paypal',
                            onSelected: () {
                              context.read<PaymentMethodCubit>().selectPaymentMethod('Paypal');
                             
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddCard(),
                                ),
                              );
                            },
                          ),
                          PaymentOptionTextField(
                            imagePath: 'assets/images/Ellipse.png',
                            label: 'Google Pay',
                            isSelected: selectedOption == 'Google Pay',
                            onSelected: () {
                              context.read<PaymentMethodCubit>().selectPaymentMethod('Google Pay');
                              
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddCard(),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}