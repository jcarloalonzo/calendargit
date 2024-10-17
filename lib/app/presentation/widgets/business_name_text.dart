import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_config/palette.dart';
import '../../../config/app_config/size_text.dart';
import '../../domain/models/business.dart';
import '../blocs/general/session/session_bloc.dart';
import 'my_text.dart';

class BusinessNameText extends StatelessWidget {
  const BusinessNameText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Business? business = context.read<SessionBloc>().state.business;
    return MyText(
      business?.businessName ?? '',
      color: Palette.colorApp,
      fontWeight: FontWeight.w700,
      size: SizeText.text3,
      maxLines: 2,
    );
  }
}
