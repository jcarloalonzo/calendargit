import 'package:calendario/data/models/entities/response_model.dart';
import 'package:calendario/presentation/pages/validate_partner/token/token_bloc.dart';
import 'package:calendario/presentation/pages/validate_partner/token/token_body.dart';
import 'package:calendario/presentation/widgets/my_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TokenPage extends StatelessWidget {
  const TokenPage._();
  static Widget init(
    BuildContext context,
  ) {
    return ChangeNotifierProvider(
      create: (_) => TokenBloc()..init(context),
      child: const TokenPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TokenBloc>(context, listen: true);
    ResponseModel.handleError(bloc, context);

    return const SafeArea(
      child: MyBackGround(
        isDrawer: false,
        titleAppBar: 'Validar Clave',
        isAppBar: false,
        allAnchorwindow: true,
        child: TokenBody(),
      ),
    );
  }
}
