import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../domain/models/business.dart';
import '../../../../blocs/authentication/create_company/services_subscription/screen_model/services_subscription_screen_model.dart';
import '../../../../blocs/authentication/create_company/services_subscription/services_subscription_bloc.dart';
import '../../../../widgets/container_chip_selected.dart';
import '../../../../widgets/my_buttom.dart';
import '../../../../widgets/my_text.dart';
import '../../../../widgets/util/loader.dart';
import '../../login/login_page.dart';

class ServicesSubscriptionBody extends StatelessWidget {
  const ServicesSubscriptionBody({super.key, required this.model});
  final ServicesSubscriptionScreenModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        MyText(
          texts.label.services,
          size: 40,
          color: Palette.colorApp,
        ),
        MyText(
          texts.messages.chooseTheServicesThatYourSPAwillOffer,
          size: SizeText.text2,
          maxLines: 3,
          color: Palette.colorApp,
        ),
        SpaceHelpers.verticalNormal,
        Expanded(
            child: SingleChildScrollView(
          child: Wrap(
            children: model.services.map((service) {
              return ContainerChipSelected(
                service.description,
                isSelected:
                    context.read<ServicesSubscriptionBloc>().exists(service),
                onTap: () =>
                    context.read<ServicesSubscriptionBloc>().onTapChip(service),
              );
            }).toList(),
          ),
        )),
        SpaceHelpers.verticalNormal,
        if (model.servicesSelected.isNotEmpty)
          MyButtom(
            texts.label.register,
            onTap: () => _onTapRegister(context),
          ),
      ],
    );
  }

  void _onTapRegister(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final bloc = context.read<ServicesSubscriptionBloc>();
    final Business? business =
        await Loader.showLoader(context, bloc.register());
    if (!context.mounted) return;
    if (business == null) return;
    context.go(LoginPage.route);
  }
}
