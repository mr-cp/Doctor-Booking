
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class RadioButtonRow extends StatefulWidget {
  const RadioButtonRow({super.key});

  @override
  _RadioButtonRowState createState() => _RadioButtonRowState();
}

class _RadioButtonRowState extends State<RadioButtonRow> {
  int? _selectedValue;

  List<String> payments = ['Cash', 'Card', 'UPI'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(payments.length, (index) {
        return _buildRadioButton(index + 1, payments[index]);
      }),
    );
  }

  Widget _buildRadioButton(int value, String label) {
    return Expanded(
      child: Row(
        children: [
          Radio<int>(
            value: value,
            groupValue: _selectedValue,
            onChanged: (int? newValue) {
              setState(() {
                _selectedValue = newValue;
              });
            },
          ),
          Text(label),
        ],
      ),
    );
  }
}
