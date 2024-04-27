import 'package:cakra_asset_management/src/pages/login/index.dart';
import 'package:flutter/material.dart';
import 'package:cakra_asset_management/src/layout.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseLayout(
        child: Column(
          children: [
            const FractionallySizedBox(
              widthFactor: 0.6,
              child: Image(
                image: AssetImage("assets/logo-white.png"),
                width: 250,
                height: 250,
              ),
            ),
            const FractionallySizedBox(
              widthFactor: 0.4,
              child: Divider(
                color: Colors.white,
              ),
            ),
            const Text(
              "Daftar",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            const FractionallySizedBox(
              widthFactor: 0.7,
              child: Divider(
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 100, right: 100, bottom: 15),
              child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  decoration: InputDecoration(
                    hintText: "Nama Lengkap",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 100, right: 100, bottom: 15),
              child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 100, right: 100, bottom: 15),
              child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  decoration: InputDecoration(
                    hintText: "Kata Sandi",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 100, right: 100, bottom: 15),
              child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  decoration: InputDecoration(
                    hintText: "Kata Sandi Ulang",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 244, 144, 1),
              ),
              onPressed: () {},
              child: const Text(
                "DAFTAR",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FractionallySizedBox(
              // widthFactor: 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sudah Mendaftar?",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                    onPressed: () {},
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
