import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../domain/models/business.dart';
import '../../../../blocs/general/session/session_bloc.dart';
import '../../../../widgets/my_text.dart';

class WorkersHeaderContainer extends StatelessWidget {
  const WorkersHeaderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Business? business = context.read<SessionBloc>().state.business;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyText(
          business?.businessName ?? '',
          color: Palette.colorApp,
          fontWeight: FontWeight.w700,
          size: SizeText.text3,
          maxLines: 2,
        ),
        SpaceHelpers.verticalNormal,
        MyText(
          texts.label.employees,
          color: Palette.colorApp,
          size: SizeText.text4,
          maxLines: 2,
        ),
      ],
    );
  }
}
