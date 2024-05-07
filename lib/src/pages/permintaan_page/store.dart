import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:flutter/material.dart';

class PermintaanStore extends StatefulWidget {
  const PermintaanStore({super.key});

  @override
  State<PermintaanStore> createState() => _PermintaanStoreState();
}

class _PermintaanStoreState extends State<PermintaanStore> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _resetForm() {
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permintaan Barang BMN'),
      ),
      body: ThemedLayout(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Jumlah',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w300),
                            ),
                            keyboardType:
                                TextInputType.number, // Assuming numeric input
                          ),
                        ),
                        const SizedBox(width: 16), // Spacer
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Satuan',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w300),
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
                              // Handle dropdown value change
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16), // Spacer
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Keterangan',
                        labelStyle: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      maxLines: 5, // Multiline input
                    ),
                    const SizedBox(height: 120),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Implement simpan functionality here
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
    );
  }
}
