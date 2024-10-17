import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'my_text.dart';

class VersionAppContainer extends StatefulWidget {
  const VersionAppContainer({super.key});

  @override
  State<VersionAppContainer> createState() => _VersionAppContainerState();
}

class _VersionAppContainerState extends State<VersionAppContainer> {
  String appVersion = 'Cargando...';
  String appNumber = 'Cargando...';

  @override
  void initState() {
    _getAppVersion();
    super.initState();
  }

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    appNumber = packageInfo.buildNumber;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MyText('© 2024 JELAF'),
          MyText('v$appVersion ($appNumber)'),
        ],
      ),
    );
  }
}
