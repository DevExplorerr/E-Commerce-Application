// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../widgets/colors.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class AddAddressPage extends StatefulWidget {
  final Function(String, String, String, String, String) onSave;

  const AddAddressPage({super.key, required this.onSave});

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void saveAddress() {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final region = regionController.text.trim();
    final city = cityController.text.trim();
    final address = addressController.text.trim();

    if (name.isEmpty ||
        phone.isEmpty ||
        region.isEmpty ||
        city.isEmpty ||
        address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Please fill all fields',
                style: TextStyle(color: whiteColor))),
      );
      return;
    }

    widget.onSave(name, phone, region, city, address);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        backgroundColor: whiteColor,
        centerTitle: true,
        title: const Text(
          "Add Address",
          style: TextStyle(color: blackColor, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: nameController,
              keyboradtype: TextInputType.name,
              labeltext: "Full Name",
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: phoneController,
              keyboradtype: TextInputType.phone,
              labeltext: "Phone Number",
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: regionController,
              keyboradtype: TextInputType.streetAddress,
              labeltext: "Region",
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: cityController,
              keyboradtype: TextInputType.streetAddress,
              labeltext: "City",
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: addressController,
              keyboradtype: TextInputType.multiline,
              labeltext: "Full Address",
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: saveAddress,
              height: 40,
              labeltext: 'Save Address',
            ),
          ],
        ),
      ),
    );
  }
}
