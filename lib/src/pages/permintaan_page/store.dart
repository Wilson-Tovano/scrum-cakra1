import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:flutter/material.dart';
import 'package:cakra_asset_management/src/models/permintaan_item_model.dart';
import 'package:provider/provider.dart';

class PermintaanStore extends StatefulWidget {
  const PermintaanStore({super.key});

  @override
  State<PermintaanStore> createState() => _PermintaanStoreState();
}

class _PermintaanStoreState extends State<PermintaanStore> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final jurusanController = TextEditingController();
  final namaController = TextEditingController();
  final tanggalController = TextEditingController();
  final jumlahController = TextEditingController();
  final keteranganController = TextEditingController();
  String satuanController = "";
  
  void _resetForm() {
    _formKey.currentState?.reset();
  }

  bool thereIsAnEmptyForm(jurusanController, namaController, tanggalController, jumlahController, satuanController, keteranganController){
    if(
      jurusanController.text == "" ||
      namaController.text == "" ||
      tanggalController.text == "" ||
      jumlahController.text == "" ||
      satuanController == "" ||
      keteranganController.text == ""
    ){
      return true;
    } 

    return false;
  }

  @override
  Widget build(BuildContext context) {
    var permintaanItemProv = Provider.of<PermintaanItemInfoProvider>(context);
    return Scaffold(
      body: ThemedLayout(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 650,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ThemedLayout(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      const Text('Program Studi'),
                      TextFormField(
                        controller: jurusanController,
                          // decoration: const InputDecoration(
                          //   labelText: 'Program Studi',
                          //   labelStyle: TextStyle(fontWeight: FontWeight.w300),
                          // ),
                          ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Text('Nama Barang'),
                      TextFormField(
                        controller: namaController,
                          // decoration: const InputDecoration(
                          //   labelText: 'Nama Barang',
                          //   labelStyle: TextStyle(fontWeight: FontWeight.w300),
                          // ),
                          ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Text('Tanggal permintaan'),
                      TextFormField(
                        controller: tanggalController,
                        // decoration: const InputDecoration(
                        //   labelText: 'Tanggal Permintaan',
                        //   labelStyle: TextStyle(fontWeight: FontWeight.w300),
                        // ),
                        keyboardType:
                            TextInputType.datetime, // Assuming date input
                      ),
                      const SizedBox(height: 16), // Spacer
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text("Jumlah: "),
                                Expanded(
                                  child: TextFormField(
                                    controller: jumlahController,
                                    validator: (value) {
                                      if (int.tryParse(value.toString()) == null) {
                                        return 'Mohon masukkan sebuah angka';
                                      }
                                      return null;
                                    },
                                    keyboardType:
                                        TextInputType.number, // Assuming numeric input
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16), // Spacer
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Satuan',
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                              ),
                              items: [
                                'Unit',
                                'Bungkus',
                                'Batang',
                                'Kotak',
                                'Lainnya'
                              ] // Example list of options
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                satuanController = value!;                    
                              },
                            ),
                          ),  
                        ],
                      ),
                      const SizedBox(height: 16), // Spacer
                      const Text("Keterangan"),
                      TextFormField(
                        controller: keteranganController,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 5, // Multiline input
                      ),
                      const SizedBox(height: 30),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {

                              //--PESAN LOG--
                              // print(namaController.text);
                              // print(permintaanItemProv.itemInfo);

                              if(!thereIsAnEmptyForm(
                                jurusanController,
                                namaController,
                                tanggalController,
                                jumlahController,
                                satuanController,
                                keteranganController
                              )){
                                permintaanItemProv.addItemInfo(
                                namaController.text,
                                jurusanController.text,
                                satuanController,
                                int.parse(jumlahController.text),
                                keteranganController.text,
                                tanggalController.text,
                                'pending',
                                "(Tidak ada pesan)"
                              );                                 
                              //--PESAN LOG--
                              for(dynamic item in permintaanItemProv.itemInfo){
                                  // print(item.nama);
                                  // print(item.jurusan);
                                  // print(item.satuan);
                                  // print(item.jumlah);
                                  // print(item.keterangan);
                                  // print(item.tanggal);
                                  print(item.status);
                                  // print(item.pesanAdmin);
                              }
                                
                                // !!!TIDAK BOLEH DISPOSE!!!
                                // namaController.dispose();
                                // jurusanController.dispose();                                
                                // jumlahController.dispose();
                                // keteranganController.dispose();
                                // tanggalController.dispose();
                                
                                keteranganController.text = "";
                                satuanController = "";
              
                                 showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Permintaan Anda segera diproses, silahkan lihat di halaman Pending"),
                                      actions: [
                                        TextButton(
                                          onPressed: (){
                                            Navigator.of(context).pop();
                                          }, 
                                          child: const Text("OK")
                                        )
                                      ]
                                    );
                                  }
                                );
                                _resetForm();
                              }else{
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Mohon masukkan semuanya"),
                                      actions: [
                                        TextButton(
                                          onPressed: (){Navigator.of(context).pop();
                                        }, 
                                          child: const Text("OK")
                                        )
                                      ]
                                    );
                                  }
                                );
                                _resetForm();
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF5D00C3)),
                            ),
                            child: const Text(
                              'Simpan',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          const SizedBox(width: 16),

                          ElevatedButton(
                            onPressed: _resetForm,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF5D00C3)),
                            ),
                            child: const Text(
                              'Reset',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
