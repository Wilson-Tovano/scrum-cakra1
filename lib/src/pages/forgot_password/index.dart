import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Size W is ${MediaQuery.of(context).size.width}");
    debugPrint("Size H is ${MediaQuery.of(context).size.height}");
    var pixRatio = MediaQuery.of(context).devicePixelRatio;
    debugPrint(
      "Corrected size W is ${MediaQuery.of(context).size.width * pixRatio}",
    );
    debugPrint(
      "Corrected size H is ${MediaQuery.of(context).size.height * pixRatio}",
    );
    return Center(
      child: Container(
        width: 1080 / pixRatio,
        height: 2280 / pixRatio,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(24, 0, 119, 15),
              Color.fromRGBO(54, 0, 0, 15),
            ]
          )
        ),
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

            

            SizedBox(height: 20,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(255, 244, 144, 1),
              ),
              onPressed: () {},
              child: Text("KIRIM", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            ),

            SizedBox(height: 20,),

            FractionallySizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Kembali ke Halaman ", style: TextStyle(color: Colors.white),),
                  
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

                  Text("atau", style: TextStyle(color: Colors.white),),

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