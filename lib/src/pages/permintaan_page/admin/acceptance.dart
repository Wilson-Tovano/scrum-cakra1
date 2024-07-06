import 'package:cakra_asset_management/src/models/permintaan_item_model.dart';
import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcceptancePage extends StatefulWidget {
  final String jurusanArg;
  const AcceptancePage({super.key, required this.jurusanArg});

  @override
  State<AcceptancePage> createState() => _AcceptancePageState(jurusanArg: jurusanArg);
}

class _AcceptancePageState extends State<AcceptancePage> {
  final String jurusanArg;
   _AcceptancePageState({required this.jurusanArg});

  @override
  Widget build(BuildContext context) {
    final permintaanItemInfoList = Provider.of<PermintaanItemInfoProvider>(context);
    final TextEditingController pesanAdminController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar permintaan jurusan $jurusanArg'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: ThemedLayout(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.grey.shade300,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                // const Text(
                //   'Riwayat Anda', style: TextStyle(fontSize: 20, decoration: TextDecoration.underline, fontStyle: FontStyle.italic),
                // ),
                const SizedBox(
                  height: 40,
                ),
          
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                    
                          itemCount:
                              permintaanItemInfoList.itemInfo.length,
                          itemBuilder: (context, index) {
                            if (permintaanItemInfoList
                                    .itemInfo[index].status ==
                                'pending' && permintaanItemInfoList.itemInfo[index].jurusan == jurusanArg) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(permintaanItemInfoList.itemInfo[index].nama, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Jumlah yang diminta: "),
                                          Text("${permintaanItemInfoList.itemInfo[index].jumlah.toString()} ${permintaanItemInfoList.itemInfo[index].satuan}"),
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder:
                                                  (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      permintaanItemInfoList
                                                          .itemInfo[index]
                                                          .keterangan),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(
                                                                  context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const Text("OK")),
                                                  ],
                                                );
                                              });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.grey.shade400,
                                            foregroundColor: Colors.black,
                                            elevation: 0,
                                            minimumSize: const Size(80, 30)),
                                        child: const Text("Lihat Keterangan",
                                            style:
                                                TextStyle(fontSize: 10)),
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Tanggal Permintaan: "),
                                          Text(permintaanItemInfoList.itemInfo[index].tanggal.toString()),
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        "Ditolak"),
                                                    content: Form(child: TextFormField(
                                                      controller: pesanAdminController,
                                                      decoration: const InputDecoration(
                                                        labelText: "Masukkan pesan untuk peminta"
                                                      ),
                                                      validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Mohon masukkan sebuah pesan';
                                                        }
                                                        return null;
                                                      },
                                                    )),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child:
                                                            const Text("Batal")
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                          
                                                            permintaanItemInfoList.updateStatus(index, 'tolak', pesanAdminController.text);
      
                            
                                                          Navigator.of(context).pop();
                                                          pesanAdminController.clear();
                                                        },
                                                        child:
                                                            const Text("Tolak")
                                                      )  
                                                    ],
                                                  );
                                                }); 
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.white,
                                              foregroundColor: Colors.black,
                                              elevation: 0,
                                              minimumSize: const Size(100, 50)),
                                          child: const Text("Tolak",
                                              style:
                                                  TextStyle(fontSize: 10)),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        "Disetujui"),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child:
                                                              const Text("Batal")),
                                                      TextButton(
                                                        onPressed: () {
                                                          permintaanItemInfoList.updateStatus(index, 'terima', pesanAdminController.text);
                         
                                                          Navigator.of(context).pop();
                                                          pesanAdminController.clear();
                                                        },
                                                        child:
                                                            const Text("Setuju")
                                                      )  
                                                    ],
                                                  );
                                                }); 
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.purple,
                                              foregroundColor: Colors.white,
                                              elevation: 0,
                                              minimumSize: const Size(100, 50)),
                                              
                                          child: const Text("Setuju",
                                              style:
                                                  TextStyle(fontSize: 10)),
                                        ),
                                  
                                      ],)
                                    ]),
                                ),
                              );
                            }else{
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}