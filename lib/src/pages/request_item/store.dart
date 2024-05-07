import 'package:cakra_asset_management/src/helpers/string_helper.dart';
import 'package:cakra_asset_management/src/helpers/validator_helper.dart';
import 'package:cakra_asset_management/src/models/common/item_unit.dart';
import 'package:cakra_asset_management/src/models/request_item_model.dart';
import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:cakra_asset_management/src/widgets/alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestItemStorePage extends StatefulWidget {
  const RequestItemStorePage({super.key});

  @override
  State<RequestItemStorePage> createState() => _RequestItemStorePageState();
}

class _RequestItemStorePageState extends State<RequestItemStorePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _departmentController = TextEditingController();
  final _nameController = TextEditingController();
  final _dateRequestedController = TextEditingController();
  final _quantityController = TextEditingController();
  ItemUnit? _selectedItemUnit;

  void clearForm() {
    _formKey.currentState?.reset();
    _departmentController.clear();
    _nameController.clear();
    _dateRequestedController.clear();
    _quantityController.clear();
    _selectedItemUnit = null;
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    RequestItemModel requestItemModel = context.watch<RequestItemModel>();

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
                    const SizedBox(height: 18),
                    const Text('Program Studi'),
                    TextFormField(
                      controller: _departmentController,
                      validator: requiredValidatorCallback,
                    ),
                    const SizedBox(height: 18),
                    const Text('Nama Barang'),
                    TextFormField(
                      controller: _nameController,
                      validator: requiredValidatorCallback,
                    ),
                    const SizedBox(height: 18),
                    const Text('Tanggal permintaan'),
                    TextFormField(
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.calendar_month),
                      ),
                      controller: _dateRequestedController,
                      validator: requiredValidatorCallback,
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(date.year - 10),
                          lastDate: DateTime(date.year + 10),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              pickedDate.toString().substring(0, 10);
                          setState(() {
                            _dateRequestedController.text = formattedDate;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Jumlah',
                            ),
                            controller: _quantityController,
                            validator: numberValidatorCallback,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16), // Spacer
                        Expanded(
                          child: DropdownButtonFormField<ItemUnit>(
                            decoration: const InputDecoration(
                              labelText: 'Satuan',
                            ),
                            items: ItemUnit.values.map((ItemUnit value) {
                              return DropdownMenuItem<ItemUnit>(
                                value: value,
                                child: Text(capitalize(value.name)),
                              );
                            }).toList(),
                            onChanged: (ItemUnit? value) {
                              setState(() {
                                _selectedItemUnit = value;
                              });
                            },
                            validator: dropdownValidatorCallback,
                            value: _selectedItemUnit,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32), // Spacer
                    const Text('Keterangan'),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            final requestItem = RequestItem(
                              department: _departmentController.text,
                              name: _nameController.text,
                              dateRequested: _dateRequestedController.text,
                              quantity: int.parse(_quantityController.text),
                              unit: _selectedItemUnit!,
                            );
                            requestItemModel.add(requestItem);
                            clearForm();
                            showDialog(
                              context: context,
                              builder: (context) => const BlurryDialog(
                                title: 'Success',
                                content:
                                    'Request item has been successfully added',
                              ),
                            );
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
                          onPressed: clearForm,
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
