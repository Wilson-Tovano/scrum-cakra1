import 'package:cakra_asset_management/src/layout.dart';
import 'package:cakra_asset_management/src/pages/dashboard/index.dart';
import 'package:cakra_asset_management/src/pages/forgot_password/index.dart';
import 'package:cakra_asset_management/src/pages/register/index.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BaseLayout(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Image(
                image: AssetImage("assets/logo-white.png"),
                width: 250,
                height: 250,
              ),
              const Text(
                "Masuk",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 75),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const TextField(
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const TextField(
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Kata Sandi",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 50),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(255, 244, 144, 1),
                        ),
                        onPressed: () {
                          // TODO: Dashboard page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Dashboard(),
                              ),
                            );
                        },
                        child: const Text(
                          "Masuk",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Belum mendaftar?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: Transform.translate(
                            offset: const Offset(0, 5),
                            child: const Text(
                              "Daftar",
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Color.fromRGBO(255, 244, 144, 1),
                                    offset: Offset(0, -5),
                                  )
                                ],
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    Color.fromRGBO(255, 244, 144, 1),
                                decorationThickness: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: Transform.translate(
                        offset: const Offset(0, 5),
                        child: const Text(
                          "Lupa kata sandi?",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 244, 144, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
