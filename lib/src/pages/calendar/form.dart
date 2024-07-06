import 'package:cakra_asset_management/src/models/calendar_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddEventForm extends StatefulWidget {
  @override
  _AddEventFormState createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama Event',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tolong masukkan nama event';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Keterangan Tambahan',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tolong masukkan keterangan tambahan';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: _startDate == null
                    ? 'Tanggal Mulai'
                    : DateFormat('yyyy-MM-dd').format(_startDate!),
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () => _selectDate(context, true),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: _endDate == null
                    ? 'Tanggal Selesai'
                    : DateFormat('yyyy-MM-dd').format(_endDate!),
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () => _selectDate(context, false),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _startDate != null && _endDate != null) {
                      print('Form is valid');
                      final newEvent = Event(
                        name: _nameController.text,
                        description: _descriptionController.text,
                        startDate: _startDate!,
                        endDate: _endDate!,
                      );
                      Provider.of<EventProvider>(context, listen: false).addEvent(newEvent);
                      Navigator.of(context).pop();
                    } else {
                      print('Form is invalid');
                    }
                  },
                  child: Text('Set'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}