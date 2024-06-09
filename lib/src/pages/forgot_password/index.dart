import 'package:cakra_asset_management/src/pages/landing_page/index.dart';
import 'package:cakra_asset_management/src/pages/login/index.dart';
import 'package:cakra_asset_management/src/pages/register/index.dart';
import 'package:flutter/material.dart';
import 'package:cakra_asset_management/src/layout.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Lupa Kata Sandi?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),

              const SizedBox(height: 5),
          
              const Text(
                "Lupa Kata Sandi? Tenang, cukup\nmasukkan e-mail kamu dan ikuti\nlangkah-langkahnya...",
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.white), textAlign: TextAlign.center,
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
                        builder: (context) => const LandingPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Kirim E-mail',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
          
              
              const SizedBox(height: 15),

              FractionallySizedBox(
                // widthFactor: 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Kembali ke halaman",
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
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Masuk",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 244, 144, 1),
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromRGBO(255, 244, 144, 1),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "atau",
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
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(vertical: 0, horizontal: 0), // Adjust the padding as needed
                          ),
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
