import 'package:cakra_asset_management/src/layout.dart';
import 'package:flutter/material.dart';
import 'package:cakra_asset_management/src/pages/register/index.dart';
import 'package:provider/provider.dart';
import 'package:cakra_asset_management/theme/theme_provider.dart';



class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseLayout(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/logo-white.png"),
              width: 250,
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(216, 203, 255, 1),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      child: const Text(
                        'Daftar',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(255, 250, 203, 1),
                        ),
                      ),
                      onPressed: () {
                        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                      },
                      child:  Text(
                        'Masuk',
                        style: TextStyle(color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
