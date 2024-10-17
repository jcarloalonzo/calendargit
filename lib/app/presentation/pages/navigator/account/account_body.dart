import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/user_business_dto.dart';
import '../../../blocs/general/session/session_bloc.dart';
import 'components/account_container_business_container.dart';
import 'components/account_container_office_container.dart';
import 'components/account_container_person_account_container.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});
  @override
  Widget build(BuildContext context) {
    final UserBusinessDto? office =
        context.read<SessionBloc>().state.user?.userBusinessData;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AccountContainerBusinessContainer(),
          AccountContainerPersonAccountContainer(),
          if (office != null) AccountContainerOfficeContainer(office: office)
        ],
      ),
    );
  }
}
