import '../account_page/account_page_body.dart';
import '../account_page/account_page_header.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          // Header
          AccountPageHeader(),

          // Body
          AccountPageBody()
        ],
      )),
    );
  }
}
