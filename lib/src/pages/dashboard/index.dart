import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:cakra_asset_management/src/layout.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kotnotol'),
      ),
      drawer: Drawer(),
      body: ThemedLayout(
        child: Column(
          children: [
            const Image(
              image: AssetImage("assets/logo-black.png"),
              width: 250,
              height: 150,
            ),
            const Text(
              "Menu Data BDM",
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.abc_rounded),
                        iconSize:
                            50.0, // Adjust the size as per your requirement
                      ),
                    ),
                    Text('Persediaan')
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.abc_rounded),
                        iconSize:
                            50.0, // Adjust the size as per your requirement
                      ),
                    ),
                    Text('Tambah Item')
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.abc_rounded),
                        iconSize:
                            50.0, // Adjust the size as per your requirement
                      ),
                    ),
                    Text('Permintaan/\n Pertusujuan')
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.abc_rounded),
                        iconSize:
                            50.0, // Adjust the size as per your requirement
                      ),
                    ),
                    Text('PEngambilan')
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.abc_rounded),
                        iconSize:
                            50.0, // Adjust the size as per your requirement
                      ),
                    ),
                    Text('Detail')
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.abc_rounded),
                        iconSize:
                            50.0, // Adjust the size as per your requirement
                      ),
                    ),
                    Text('Laporan')
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Increment',
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
