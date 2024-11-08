import 'package:alpha/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CardCubit.dart';
import 'add_TextField.dart';


class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CardCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF1C3764)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Add Card',
            style: TextStyle(color: Color(0xFF1C3764)),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<CardCubit, Map<String, dynamic>>(
            builder: (context, state) {
              return SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                reverse: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // صورة البطاقة
                        Container(
                          width: double.infinity,
                          height: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Image.asset(
                            'assets/images/Card.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        
                        Positioned(
                          top: 150, 
                          left: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Card Holder Name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                state['cardHolderName']['value'].isEmpty
                                    ? 'John Doe'
                                    : state['cardHolderName']['value'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 150, // 
                          right: 100,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Expiry Date',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                state['expiryDate']['value'].isEmpty
                                    ? '04/28'
                                    : state['expiryDate']['value'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 110, 
                          left: 30,
                          child: Text(
                            state['cardNumber']['value'].isEmpty
                                ? '0000 0000 0000 00'
                                : state['cardNumber']['value'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    CustomTextField(
                      labelText: 'Card Holder Name',
                      hintText: 'John Doe',
                      onChanged: (value) {
                        context.read<CardCubit>().updateField('cardHolderName', value);
                      },
                      isFieldValid: state['cardHolderName']['isFieldValid'],
                    ),
                    SizedBox(height: 20),

                    CustomTextField(
                      labelText: 'Card Number',
                      hintText: '0000 0000 0000 00',
                      onChanged: (value) {
                        context.read<CardCubit>().updateField('cardNumber', value);
                      },
                      isFieldValid: state['cardNumber']['isFieldValid'],
                    ),
                    SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: 'Expiry Date',
                            hintText: '04/28',
                            onChanged: (value) {
                              context.read<CardCubit>().updateField('expiryDate', value);
                            },
                            isFieldValid: state['expiryDate']['isFieldValid'],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            labelText: 'CVV',
                            hintText: '000',
                            onChanged: (value) {
                              context.read<CardCubit>().updateField('cvv', value);
                            },
                            isFieldValid: state['cvv']['isFieldValid'],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (context.read<CardCubit>().saveCard()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentMethod(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please fill all fields')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1C3764),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          'Save Card',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
