import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_config/palette.dart';
import '../../../config/app_config/space_helpers.dart';
import '../../../generated/translations.g.dart';
import '../../domain/models/business.dart';
import '../blocs/general/session/session_bloc.dart';
import 'my_card_container.dart';
import 'my_text.dart';

class BusinessHeaderRequestDataContainer extends StatelessWidget {
  const BusinessHeaderRequestDataContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Business? business = context.read<SessionBloc>().state.business;
    return MyCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: [
              MyText(texts.label.supplier),
              SpaceHelpers.horizontalNormal,
              Flexible(
                child: MyText(
                  business?.businessName ?? '',
                  color: Palette.colorApp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              MyText(texts.label.email),
              SpaceHelpers.horizontalNormal,
              Flexible(
                child: MyText(
                  business?.emailAddress ?? '',
                  maxLines: 3,
                  color: Palette.colorApp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
