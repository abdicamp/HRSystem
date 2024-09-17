import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'shared/constant/spaces.dart';

class CustomTextFieldNumber extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String value)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool showLabel;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final int maxLines;

  const CustomTextFieldNumber({
    super.key,
    required this.controller,
    required this.label,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.showLabel = true,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.maxLines = 1,
  });

  String formatRupiah(String value) {
    final formatter = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    try {
      final number = int.parse(value.replaceAll(RegExp(r'[^0-9]'), ''));
      return formatter.format(number);
    } catch (e) {
      return 'Rp 0';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Jika controller.text kosong atau null, set nilainya ke "0"
    if (controller.text.isEmpty) {
      controller.text = 'Rp 0';
    }else {
      controller.text = formatRupiah(controller.text);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) ...[
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SpaceHeight(12.0),
        ],
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          controller: controller,
          onChanged: (value) {
            // Set nilai ke "0" jika field kosong
            if (value.isEmpty) {
              controller.text = 'Rp 0';
            } else {
              // Memformat nilai input menjadi Rupiah
              final formattedValue = formatRupiah(value);
              controller.value = TextEditingValue(
                text: formattedValue,
                selection: TextSelection.collapsed(offset: formattedValue.length),
              );
            }

            // Memastikan callback onChanged tetap terpanggil
            if (onChanged != null) {
              onChanged!(controller.text);
            }
          },
          obscureText: obscureText,
          keyboardType: keyboardType ?? TextInputType.number,
          readOnly: readOnly,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            hintText: label,
          ),
        ),
      ],
    );
  }
}
