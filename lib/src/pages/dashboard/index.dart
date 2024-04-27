import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:cakra_asset_management/src/widgets/default_drawer.dart';
import 'package:cakra_asset_management/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:cakra_asset_management/src/layout.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const DefaultDrawer(),
      body: ThemedLayout(
        child: Column(
          children: [
            Image(
              image: Provider.of<ThemeProvider>(context).themeData.brightness == Brightness.light ? const AssetImage("assets/main-logo-dark.png") : const AssetImage("assets/main-logo-white.png"),
              width: 250,
              height: 150,
            ),
            const Text(
              "Menu Data BDM",
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 24,
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
                        icon: const Icon(Icons.abc_rounded),
                        iconSize:
                            50.0, // Adjust the size as per your requirement
                      ),
                    ),
                    const Text('Persediaan')
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.abc_rounded),
                        iconSize:
                            50.0, // Adjust the size as per your requirement
                      ),
                    ),
                    const Text('Tambah Item')
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.abc_rounded),
                        iconSize:
                            50.0, // Adjust the size as per your requirement
                      ),
                    ),
                    const Text('Permintaan/\n Persetujuan')
                  ],
                ),
              ],
            ),
            const SizedBox(
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
                        icon: const Icon(Icons.abc_rounded),
                        iconSize:
                            50.0, // Adjust the size as per your requirement
                      ),
                    ),
                    const Text('PEngambilan')
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.abc_rounded),
                        iconSize:
                            50.0, // Adjust the size as per your requirement
                      ),
                    ),
                    const Text('Detail')
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.abc_rounded),
                        iconSize:
                            50.0, // Adjust the size as per your requirement
                      ),
                    ),
                    const Text('Laporan')
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
