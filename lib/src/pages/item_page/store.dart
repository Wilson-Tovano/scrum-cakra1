import 'package:cakra_asset_management/src/models/item_model.dart';
import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:cakra_asset_management/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const ItemButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: Provider.of<ThemeProvider>(context).themeData.textButtonTheme.style,
      child: Text(text),
    );
  }
}

// TODO: Move to new component
class ItemInputForm extends StatefulWidget {
  const ItemInputForm({super.key});

  @override
  State<ItemInputForm> createState() => _ItemInputFormState();
}

class _ItemInputFormState extends State<ItemInputForm> {
  final _formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  final nameController = TextEditingController();
  final itemTypeController = TextEditingController();
  final quantityController = TextEditingController();
  final unitController = TextEditingController();

  String? validatorCallback(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
          TextFormField(
            controller: itemTypeController,
            decoration: const InputDecoration(
              labelText: 'Item Type',
            ),
            validator: (validatorCallback),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: quantityController,
            decoration: const InputDecoration(
              labelText: 'Quantity',
            ),
            validator: (validatorCallback),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: unitController,
            decoration: const InputDecoration(
              labelText: 'Unit',
            ),
            validator: (validatorCallback),
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 120,
                child: ItemButton(
                  text: 'Simpan',
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                          
                    bool itemExists = context.select<ItemModel, bool>(
                      (itemList) => itemList.contains(codeController.text),
                    );
                    if (itemExists) return;
                          
                    ItemModel itemList = context.read<ItemModel>();
                    final item = Item(
                      code: codeController.text,
                      name: nameController.text,
                      itemType: itemTypeController.text,
                      quantity: int.parse(quantityController.text),
                      unit: unitController.text,
                    );
                    itemList.add(item);
                  },
                ),
              ),
              SizedBox(
                width: 120,
                child: ItemButton(
                  text: 'Reset',
                  onPressed: () {
                    _formKey.currentState?.reset();
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
    itemTypeController.dispose();
    quantityController.dispose();
    unitController.dispose();
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
