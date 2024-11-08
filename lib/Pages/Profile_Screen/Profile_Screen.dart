import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Setting_Page/Setting_page.dart';
import 'Cubit/Profile_Cubit.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          actions: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(state.isEditing ? Icons.check : Icons.edit),
                  onPressed: () {
                    context.read<ProfileCubit>().toggleEditMode();
                  },
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (state.isEditing) {
                          // Show options to choose or capture an image
                          showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.photo),
                                    title: Text('Choose from Gallery'),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.camera),
                                    title: Text('Capture Image'),
                                    onTap: () {},
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: state.image == null
                          ? ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            child: Image.asset(
                              alignment: Alignment.topCenter,
                              width:
                                  MediaQuery.of(context).size.width * 0.2,
                              height:
                                  MediaQuery.of(context).size.height * 0.15,
                              "assets/images/Man.png",
                              fit: BoxFit.fitWidth,
                            ),
                          )
                          : null,
                    ),
                    if (state.isEditing)
                      _buildEditProfileForm(context, state)
                    else
                      _buildProfileInfo(state),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.1),
                        children: <Widget>[
                          _buildListTile(
                            context,
                            title: 'Profile',
                            icon: Icons.person_outline,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Container(
                                    color: Colors.blue,
                                  ),
                                ),
                              );
                            },
                          ),
                          _buildListTile(
                            context,
                            title: 'Favorite',
                            icon: Icons.favorite_border_outlined,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Container(
                                    color: Colors.blue,
                                  ),
                                ),
                              );
                            },
                          ),
                          _buildListTile(
                            context,
                            title: 'Payment Method',
                            icon: Icons.wallet_outlined,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Container(
                                    color: Colors.green,
                                  ),
                                ),
                              );
                            },
                          ),
                          _buildListTile(
                            context,
                            title: 'Settings',
                            icon: Icons.settings,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SettingsPage(),
                                ),
                              );
                            },
                          ),
                          _buildListTile(
                            context,
                            title: 'Privacy Policy',
                            icon: Icons.lock_outline_rounded,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Container(
                                    color: Colors.green,
                                  ),
                                ),
                              );
                            },
                          ),
                          _buildListTile(
                            context,
                            title: 'Help',
                            icon: Icons.question_mark_outlined,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Container(
                                    color: Colors.green,
                                  ),
                                ),
                              );
                            },
                          ),
                          _buildListTile(
                            context,
                            title: 'Logout',
                            icon: Icons.logout_outlined,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Container(
                                    color: Colors.green,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
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

  Widget _buildProfileInfo(ProfileState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name: ${state.name}', style: TextStyle(fontSize: 18)),
        SizedBox(height: 8),
        Text('Email: ${state.email}', style: TextStyle(fontSize: 18)),
        SizedBox(height: 8),
        Text('Date of Birth: ${state.dob}', style: TextStyle(fontSize: 18)),
        SizedBox(height: 8),
        Text('Mobile: ${state.mobile}', style: TextStyle(fontSize: 18)),
      ],
    );
  }

  Widget _buildEditProfileForm(BuildContext context, ProfileState state) {
    final nameController = TextEditingController(text: state.name);
    final emailController = TextEditingController(text: state.email);
    final dobController = TextEditingController(text: state.dob);
    final mobileController = TextEditingController(text: state.mobile);

    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Name'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: dobController,
          decoration: InputDecoration(labelText: 'Date of Birth'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: mobileController,
          decoration: InputDecoration(labelText: 'Mobile Number'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            context.read<ProfileCubit>().updateProfile(
                  nameController.text,
                  emailController.text,
                  dobController.text,
                  mobileController.text,
                );
          },
          child: Text('Save Changes'),
        ),
      ],
    );
  }

  Widget _buildListTile(BuildContext context,
      {required String title,
      required IconData icon,
      required Function onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            gradient: LinearGradient(
              colors: [Color(0xFF1C3764), Color(0xFF1C3764)],
              transform: GradientRotation(360),
            ),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFF1C3764),
          size: 25,
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
