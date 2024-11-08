import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/Setting_Cubit.dart';
import 'Notification_Page/NotificatonS_page.dart';

class SettingsPage extends StatelessWidget {
  get title => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          settingsListTile(
            context,
            title: "Notification Settings",
              onTap: () {
                print('Tapped on $title'); // Check if this prints
                context.read<SettingsPageCubit>().navigateTo(SettingsPageType.notification);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => NotificatonsPage_Settings()),
                );
              }

          ),
          settingsListTile(
            context,
            title: "Password Manager",
            onTap: () {
              context
                  .read<SettingsPageCubit>()
                  .navigateTo(SettingsPageType.password);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => Container(
                          color: Colors.green,
                        )),
              );
            },
          ),
          settingsListTile(
            context,
            title: "Delete Account",
            onTap: () {
              context
                  .read<SettingsPageCubit>()
                  .navigateTo(SettingsPageType.deleteAccount);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => Container(
                          color: Colors.blue,
                        )),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget settingsListTile(BuildContext context,
      {required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
