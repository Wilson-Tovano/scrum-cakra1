import 'package:cakra_asset_management/src/pages/item/index.dart';
import 'package:cakra_asset_management/src/pages/item/store.dart';
import 'package:cakra_asset_management/src/pages/pengambilan/index.dart';
import 'package:cakra_asset_management/src/pages/request_item/index.dart';
import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:cakra_asset_management/src/widgets/barcode_scanner_zoom.dart';
import 'package:cakra_asset_management/src/widgets/default_drawer_widget.dart';
import 'package:cakra_asset_management/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Data BMN'),
        
      ),
      drawer: const DefaultDrawer(),
      body: ThemedLayout(
        child: Column(
          children: [
            Image(
              image: Provider.of<ThemeProvider>(context).themeData.brightness ==
                      Brightness.light
                  ? const AssetImage("assets/main-logo-dark.png")
                  : const AssetImage("assets/main-logo-white.png"),
              width: 250,
              height: 150,
            ),
            const Text(
              "Menu Data BMN",
              style: TextStyle(fontSize: 24),
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
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const IndexItemPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.bar_chart),
                            iconSize: 50.0,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Persediaan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StoreItemPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add_to_queue),
                            iconSize: 50.0,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Tambah Item',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          child: IconButton(
                            onPressed: () {Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RequestItemIndexPage(),
                                ),
                              );},
                            icon: const Icon(Icons.handshake),
                            iconSize: 50.0,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Permintaan/\nPersetujuan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
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
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PengambilanIndexPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.pin_drop),
                            iconSize: 50.0,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Pengambilan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.format_list_bulleted),
                            iconSize: 50.0,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Detail',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.assignment),
                            iconSize: 50.0,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Laporan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Qr Scan',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BarcodeScannerZoom()));
        },
        child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
      ),
    );
  }
}
