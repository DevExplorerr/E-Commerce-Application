// ignore_for_file: unused_element

import '../widgets/colors.dart';
import 'package:flutter/material.dart';
import '../pages/address_page.dart';

class BillingAddressSection extends StatefulWidget {
  const BillingAddressSection({super.key});

  @override
  State<BillingAddressSection> createState() => _BillingAddressSectionState();
}

class _BillingAddressSectionState extends State<BillingAddressSection> {
  String recipientName = "Default Recipient";
  String phoneNumber = "+92 3481396409";
  String region = "Sindh";
  String city = "Karachi";
  String fullAddress = "Street 123, City Center";

  void saveAddress(
      String name, String phone, String region, String city, String address) {
    setState(() {
      recipientName = name;
      phoneNumber = phone;
      this.region = region;
      this.city = city;
      fullAddress = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Shipping Address",
              style: TextStyle(color: blackColor, fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAddressPage(onSave: saveAddress),
                  ),
                );
              },
              child: const Text(
                "Add/Change",
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(recipientName, style: const TextStyle(color: blackColor)),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.phone, size: 16, color: greyColor),
            const SizedBox(width: 10),
            Text(phoneNumber, style: const TextStyle(color: blackColor)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.location_on, size: 16, color: greyColor),
            const SizedBox(width: 10),
            Expanded(
                child: Text("$fullAddress, $city, $region",
                    style: const TextStyle(color: blackColor))),
          ],
        ),
      ],
    );
  }
}
