import 'package:cakra_asset_management/src/models/permintaan_item_model.dart';
import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PengambilanIndexPageAdmin extends StatefulWidget {
  const PengambilanIndexPageAdmin({super.key});

  @override
  State<PengambilanIndexPageAdmin> createState() =>
      _PengambilanIndexPageAdminState();
}

class _PengambilanIndexPageAdminState extends State<PengambilanIndexPageAdmin> {
  @override
  Widget build(BuildContext context) {
    final permintaanItemInfoList =
        Provider.of<PermintaanItemInfoProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pengambilan Aset BMN (Admin)'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality here
              },
            ),
          ],
        ),
        body: ThemedLayout(
          child: Column(children: [
            const SizedBox(
              width: double.infinity,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(child: Text('Riwayat')),
                  Tab(child: Text('Pengambilan')),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TabBarView(
                  children: [
                    // Riwayat Tab Content
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: permintaanItemInfoList.itemInfo.length,
                            itemBuilder: (context, index) {
                              if (permintaanItemInfoList
                                  .itemInfo[index].terambil) {
                                return Card(
                                  margin: const EdgeInsets.all(8),
                                  elevation: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 25.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          permintaanItemInfoList
                                              .itemInfo[index].nama,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "assets/box.png",
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                            "Jurusan Peminta: ${permintaanItemInfoList.itemInfo[index].jurusan}"),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              permintaanItemInfoList
                                                                  .itemInfo[
                                                                      index]
                                                                  .jumlah
                                                                  .toString()),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Text(
                                                              permintaanItemInfoList
                                                                  .itemInfo[
                                                                      index]
                                                                  .satuan),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  SizedBox(
                                                    width: 95,
                                                    height: 25,
                                                    child: OutlinedButton(
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(permintaanItemInfoList
                                                                    .itemInfo[
                                                                        index]
                                                                    .keterangan),
                                                                actions: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child: const Text(
                                                                          "OK")),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      style: ButtonStyle(
                                                        padding:
                                                            MaterialStateProperty
                                                                .all(
                                                                    const EdgeInsets
                                                                        .all(
                                                                        0)),
                                                      ),
                                                      child: const Text(
                                                        "Lihat Keterangan",
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Tanggal Pengambilan : ",
                                                style: TextStyle(fontSize: 12)),
                                            Text(
                                              permintaanItemInfoList
                                                  .itemInfo[index].tglTerambil,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        const SizedBox(width: 16),
                                        Align(
                                          alignment: Alignment.center,
                                          child: FilledButton(
                                            onPressed: () => showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    deleteRiwayat(context)),
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.red),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ))),
                                            child: const Icon(Icons.delete),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    // Pengambilan Tab Content
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: permintaanItemInfoList.itemInfo.length,
                            itemBuilder: (context, index) {
                              if (permintaanItemInfoList
                                          .itemInfo[index].status ==
                                      'terima' &&
                                  !permintaanItemInfoList
                                      .itemInfo[index].terambil) {
                                return Card(
                                  margin: const EdgeInsets.all(8),
                                  elevation: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 25.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          permintaanItemInfoList
                                              .itemInfo[index].nama,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "assets/box.png",
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                            "Jurusan Peminta: ${permintaanItemInfoList.itemInfo[index].jurusan}"),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              permintaanItemInfoList
                                                                  .itemInfo[
                                                                      index]
                                                                  .jumlah
                                                                  .toString()),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Text(
                                                              permintaanItemInfoList
                                                                  .itemInfo[
                                                                      index]
                                                                  .satuan),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  SizedBox(
                                                    width: 95,
                                                    height: 25,
                                                    child: OutlinedButton(
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(permintaanItemInfoList
                                                                    .itemInfo[
                                                                        index]
                                                                    .keterangan),
                                                                actions: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child: const Text(
                                                                          "OK")),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      style: ButtonStyle(
                                                        padding:
                                                            MaterialStateProperty
                                                                .all(
                                                                    const EdgeInsets
                                                                        .all(
                                                                        0)),
                                                      ),
                                                      child: const Text(
                                                        "Lihat Keterangan",
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 16),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: FilledButton(
                                            onPressed: () => showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    sudahDiambil(
                                                        context, index)),
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ))),
                                            child: const Text("SUDAH DIAMBIL"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

deleteRiwayat(BuildContext context) {
  return AlertDialog(
      // title: const Text('Reset settings?'),
      content: const Text(
          'Apakah Anda yakin ingin menghapus riwayat yang dipilih ? '),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('BATALKAN'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('YA'),
        ),
      ]);
}

sudahDiambil(BuildContext context, int index) {
  final sudahDiambilController = TextEditingController();
  final permintaanItemInfoList =
      Provider.of<PermintaanItemInfoProvider>(context);

  // showDialog(
  //   context: context,
  //   builder: (BuildContext context){
  return AlertDialog(
      // title: const Text('Reset settings?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Apakah benar peminta sudah mengambil barangnya'),
          TextField(
            controller: sudahDiambilController,
            decoration: const InputDecoration(
                labelText: "Tanggal diambil", hintText: "Masukkan tanggalnya"),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('BATALKAN'),
        ),
        TextButton(
          onPressed: () {
            String tglBarangDiambil = sudahDiambilController.text;
            permintaanItemInfoList.itemObtained(index, tglBarangDiambil);
            Navigator.pop(context);
            sudahDiambilController.dispose();
          },
          child: const Text('YA'),
        ),
      ]);
  //   }
  // );
}
