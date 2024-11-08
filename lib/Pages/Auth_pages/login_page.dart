import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../Main_Page/Main_Page.dart';
import '../Widgets/custom_button.dart';
import 'Cubit/login_cubit.dart';
import 'Cubit/login_state.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Login Successful")),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return LayoutBuilder(builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;
            return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Frame.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    reverse: true,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'PaytoneOne',
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Email Or Mobile Number"),
                                _EmailField(controller: emailController),
                              ],
                            ),
                            SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Password"),
                                _PasswordField(controller: passwordController),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forget Password",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            CustomButton(
                              text: "Log In",
                              onPressed: () {
                                final email = emailController.text;
                                final password = passwordController.text;
                                context
                                    .read<LoginCubit>()
                                    .logIn(email, password);
                              },
                            ),
                            if (state is LoginLoading)
                              CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text(
                              "Or Continue With",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 10),
                            _SocialMediaButtons(
                              icons: [
                                {
                                  "assetPath": "assets/images/Fb Circle.png",
                                  "onPressed": () {}
                                },
                                {
                                  "assetPath": "assets/images/Apple.png",
                                  "onPressed": () {}
                                },
                                {
                                  "assetPath": "assets/images/Google.png",
                                  "onPressed": () {}
                                },
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(fontSize: 15),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage()),
                                    );
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF1C3764),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  final TextEditingController controller;

  _EmailField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: "Email or Mobile Number",
        hintText: "example@example.com",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  final TextEditingController controller;

  _PasswordField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final isObscured =
            state is PasswordVisibilityToggled ? state.isVisible : true;
        return TextField(
          controller: controller,
          obscureText: isObscured,
          decoration: InputDecoration(
            labelText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: IconButton(
              icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
              onPressed: () => context
                  .read<LoginCubit>()
                  .togglePasswordVisibility(isObscured),
            ),
          ),
        );
      },
    );
  }
}

class _SocialMediaButtons extends StatelessWidget {
  final List<Map<String, dynamic>> icons;

  _SocialMediaButtons({required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.7,
      height: MediaQuery.sizeOf(context).height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: icons.map((iconData) {
          return IconButton(
            icon: Image.asset(iconData["assetPath"]),
            onPressed: iconData["onPressed"],
          );
        }).toList(),
      ),
    );
  }
}
