import 'package:cakra_asset_management/src/helpers/string_helper.dart';
import 'package:cakra_asset_management/src/models/item_model.dart';
import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:cakra_asset_management/src/widgets/alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemInputForm extends StatefulWidget {
  const ItemInputForm({super.key});

  @override
  State<ItemInputForm> createState() => _ItemInputFormState();
}

class _ItemInputFormState extends State<ItemInputForm> {
  final _formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  ItemType? selectedItemType;
  ItemUnit? selectedItemUnit;

  String? validatorCallback(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    return null;
  }

  String? dropdownValidatorCallback(value) {
    if (value == null) {
      return 'Please select an option';
    }
    return null;
  }

  String? numberValidatorCallback(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    final n = int.tryParse(value);
    if (n == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  void clearForm() {
    _formKey.currentState?.reset();
    codeController.clear();
    nameController.clear();
    quantityController.clear();
    selectedItemType = null;
    selectedItemUnit = null;
  }

  @override
  Widget build(BuildContext context) {
    bool itemExists = context.select<ItemModel, bool>(
      (itemList) => itemList.contains(codeController.text),
    );
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: codeController,
            decoration: const InputDecoration(
              labelText: 'Code',
            ),
            validator: (validatorCallback),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            validator: (validatorCallback),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<ItemType?>(
            value: selectedItemType,
            decoration: InputDecoration(
              labelText: 'Item Type',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              errorStyle: const TextStyle(
                color: Colors.red,
              ),
            ),
            onChanged: (ItemType? newValue) {
              setState(() {
                selectedItemType = newValue;
              });
            },
            items: ItemType.values
                .map<DropdownMenuItem<ItemType>>((ItemType value) {
              return DropdownMenuItem<ItemType>(
                value: value,
                child: Text(capitalize(value.name)),
              );
            }).toList(),
            validator: (dropdownValidatorCallback),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: quantityController,
            decoration: const InputDecoration(
              labelText: 'Quantity',
            ),
            validator: (numberValidatorCallback),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<ItemUnit?>(
            value: selectedItemUnit,
            decoration: InputDecoration(
              labelText: 'Unit Type',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              errorStyle: const TextStyle(
                color: Colors.red,
              ),
            ),
            onChanged: (ItemUnit? newValue) {
              setState(() {
                selectedItemUnit = newValue;
              });
            },
            items: ItemUnit.values.map<DropdownMenuItem<ItemUnit>>(
              (ItemUnit value) {
                return DropdownMenuItem<ItemUnit>(
                  value: value,
                  child: Text(capitalize(value.name)),
                );
              },
            ).toList(),
            validator: (dropdownValidatorCallback),
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 120,
                child: TextButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    if (itemExists) return;

                    ItemModel itemList = context.read<ItemModel>();
                    final item = Item(
                      code: codeController.text,
                      name: nameController.text,
                      itemType: selectedItemType!,
                      quantity: int.parse(quantityController.text),
                      itemUnit: selectedItemUnit!,
                    );
                    itemList.add(item);
                    clearForm();
                    showDialog(
                      context: context,
                      builder: (context) => const BlurryDialog(
                        title: 'Success',
                        content: 'Item has been successfully added',
                      ),
                    );
                  },
                  child: const Text('Simpan'),
                ),
              ),
              SizedBox(
                width: 120,
                child: TextButton(
                  child: const Text('Reset'),
                  onPressed: () {
                    clearForm();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    codeController.dispose();
    nameController.dispose();
    quantityController.dispose();
    super.dispose();
  }
}

class StoreItemPage extends StatelessWidget {
  const StoreItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Item BMN'),
      ),
      body: ThemedLayout(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: const SingleChildScrollView(
            child: ItemInputForm(),
          ),
        ),
      ),
    );
  }
}
