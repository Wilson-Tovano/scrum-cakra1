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

            FractionallySizedBox(
              widthFactor: 0.6,
              child: Container(
                child: Image.asset("assets/img/logo-full-white.png")
              ),
            ),

            const FractionallySizedBox(
              widthFactor: 0.4,
              child: Divider(
                color: Colors.white,
              ),
            ),

            const Text(
              "Lupa Kata Sandi", 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 30, 
                color: Colors.white
              ),
            ),

            const FractionallySizedBox(
              widthFactor: 0.7,
              child: Divider(
                color: Colors.white,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 130, right: 130, bottom: 15),
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
                )  
              ),
            ),

            

            const SizedBox(height: 20,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 244, 144, 1),
              ),
              onPressed: () {},
              child: const Text("KIRIM", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            ),

            const SizedBox(height: 20,),

            FractionallySizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Kembali ke Halaman ", style: TextStyle(color: Colors.white),),
                  
                  TextButton(
                    onPressed: (){},
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 244, 144, 1),
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromRGBO(255, 244, 144, 1),
                      )
                    )
                  ),

                  const Text("atau", style: TextStyle(color: Colors.white),),

                  TextButton(
                    onPressed: (){},
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 244, 144, 1),
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromRGBO(255, 244, 144, 1),
                      )
                    )
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