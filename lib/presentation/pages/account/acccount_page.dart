// ignore_for_file: prefer_const_constructors
import 'package:calendario/presentation/pages/account/account_body.dart';
import 'package:calendario/presentation/widgets/my_background.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final bloc = Provider.of<HomeModelProvider>(context, listen: true);

    // if (bloc.error != null) {
    //   if (bloc.error!.statusCode != 200) {
    //     Future.delayed(Duration.zero, () async {
    //       confirmAlternantError(
    //           context: context,
    //           errormodel: bloc.error!.error!,
    //           statuscode: bloc.error!.statusCode!);
    //       bloc.error = null;
    //     });
    //   }
    // }
    return MyBackGround(
      isAppBar: false,
      isDrawer: false,
      backPageEnable: false,
      // child: bloc.charge
      //     ? Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : AccountPage(),
      child: AccountBody(),
    );
  }
}
