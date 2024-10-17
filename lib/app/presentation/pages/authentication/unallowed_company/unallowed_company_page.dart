import 'package:flutter/material.dart';

import 'unallowed_company_body.dart';

class UnallowedCompanyPage extends StatelessWidget {
  const UnallowedCompanyPage({super.key});
  static String route = '/UnallowedCompanyPage';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UnallowedCompanyBody(),
    );
  }
}
