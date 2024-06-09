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
      // resizeToAvoidBottomInset: true,
      body: BaseLayout(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/main-logo-white.png", width: 120),
                ],
              ),
              const SizedBox(height: 30),
        
              const Text(
                "Masuk",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
          
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100, bottom: 9),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      icon: const Icon(Icons.mail, color: Colors.white,),
                      hintText: "E-mail",
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),              
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)
                    )
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100, bottom: 9),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock, color: Colors.white,),
                      hintText: "Kata Sandi",
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),              
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)
                    )
                  ),
                ),
              ),
            
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50), // Adjust the width and height as needed
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardPage (),
                      ),
                    );
                  },
                  child: const Text(
                    'Masuk Sekarang',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
          
              const Text(
                "Atau daftar dengan:",
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.white), textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(255, 255, 255, 1),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(double.infinity, 50), // Adjust the width and height as needed
                        ),
                      ),
                      onPressed: () {
                      },
                      child: Image.asset("assets/google.png")
                    ),
                  ),
                  
                  Container(
                    width: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(255, 255, 255, 1),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(double.infinity, 50), // Adjust the width and height as needed
                        ),
                      ),
                      onPressed: () {
                      },
                      child: Image.asset("assets/microsoft.png")
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 15),

              FractionallySizedBox(
                // widthFactor: 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Belum Mendaftar?",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 2),
                    TextButton(
                      onPressed: () {},
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Daftar",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 244, 144, 1),
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromRGBO(255, 244, 144, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {},
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Lupa Kata Sandi",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 244, 144, 1),
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromRGBO(255, 244, 144, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
