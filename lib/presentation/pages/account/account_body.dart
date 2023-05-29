import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'account_bloc.dart';
import 'components/container_account.dart';
import 'components/container_account_office.dart';
import 'components/container_person_account.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AccountBloc>(context);
    final business = bloc.business;
    final login = bloc.login;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ContainerAccount(bloc: bloc),

            ContainerPersonAccount(login: login),

            if (login.userBusinessDto.isNotEmpty)
              ContainerAccountOffice(office: bloc.office),

            //
            //
            //
          ],
        ),
      ),
    );
  }
}
