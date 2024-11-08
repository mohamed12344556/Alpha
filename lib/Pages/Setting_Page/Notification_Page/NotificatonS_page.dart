import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/notificationS_Cubit.dart';
import 'Cubit/notificatios_state.dart';

class NotificatonsPage_Settings extends StatelessWidget {
  const NotificatonsPage_Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => notificationSCubit(),
      child: BlocConsumer<notificationSCubit, notificationS_State>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Notification Settings'),
            ),
            body: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    context,
                    'General Notification',
                    state.generalNotification,
                    (value) {
                      context
                          .read<notificationSCubit>()
                          .toggleSetting('General Notification');
                    },
                  ),
                  _buildSwitchListTile(
                    context,
                    'Sound',
                    state.sound,
                    (value) {
                      context.read<notificationSCubit>().toggleSetting('Sound');
                    },
                  ),
                  _buildSwitchListTile(
                    context,
                    'Vibrate',
                    state.vibrate,
                    (value) {
                      context
                          .read<notificationSCubit>()
                          .toggleSetting('Vibrate');
                    },
                  ),
                  _buildSwitchListTile(
                    context,
                    'Special Offers',
                    state.specialOffers,
                    (value) {
                      context
                          .read<notificationSCubit>()
                          .toggleSetting('Special Offers');
                    },
                  ),
                  _buildSwitchListTile(
                    context,
                    'Payments',
                    state.payments,
                    (value) {
                      context
                          .read<notificationSCubit>()
                          .toggleSetting('Payments');
                    },
                  ),
                  _buildSwitchListTile(
                    context,
                    'Promo & Discount',
                    state.promoDiscount,
                    (value) {
                      context
                          .read<notificationSCubit>()
                          .toggleSetting('Promo & Discount');
                    },
                  ),
                  _buildSwitchListTile(
                    context,
                    'Cashback',
                    state.cashback,
                    (value) {
                      context
                          .read<notificationSCubit>()
                          .toggleSetting('Cashback');
                    },
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          // Optionally, you can perform some actions like showing a snackbar when settings are updated
        },
      ),
    );
  }

  // Utility method for building the switch list tiles
  Widget _buildSwitchListTile(BuildContext context, String title, bool value,
      Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: Color(0xFF1C3764),
    );
  }
}
