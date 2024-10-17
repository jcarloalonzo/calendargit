import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../domain/models/business.dart';
import '../../../../blocs/authentication/create_company/categories_subscription/categories_subscription_bloc.dart';
import '../../../../blocs/authentication/create_company/categories_subscription/screen_model/categories_subscription_screen_model.dart';
import '../../../../widgets/container_chip_selected.dart';
import '../../../../widgets/my_buttom.dart';
import '../../../../widgets/my_text.dart';
import '../../../../widgets/util/loader.dart';
import '../../login/login_page.dart';
import '../services_subscription/services_subscription_page.dart';

class CategoriesSubscriptionBody extends StatelessWidget {
  const CategoriesSubscriptionBody({super.key, required this.model});
  final CategoriesSubscriptionScreenModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        MyText(
          texts.label.categories,
          size: 40,
          color: Palette.colorApp,
        ),
        MyText(
          texts.messages.chooseWhichCategoriesOfServicesYourSpaWillOffer,
          size: SizeText.text2,
          maxLines: 3,
          color: Palette.colorApp,
        ),
        SpaceHelpers.verticalNormal,
        Expanded(
            child: SingleChildScrollView(
          child: Wrap(
            children: model.categories.map((category) {
              return ContainerChipSelected(
                category.description,
                isSelected:
                    context.read<CategoriesSubscriptionBloc>().exists(category),
                onTap: () => context
                    .read<CategoriesSubscriptionBloc>()
                    .onTapChip(category),
              );
            }).toList(),
          ),
        )),
        SpaceHelpers.verticalNormal,
        MyButtom(
          model.categoriesSelected.isEmpty
              ? texts.label.register
              : texts.label.continu,
          onTap: () => model.categoriesSelected.isEmpty
              ? _onTapRegister(context)
              : _onTapContinue(context),
        ),
      ],
    );
  }

  void _onTapContinue(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final bloc = context.read<CategoriesSubscriptionBloc>();
    // Loader.showLoader(context, bloc.getServicesCategories());
    final CategoriesSubscriptionScreenModel data = bloc.modelData();
    context.push(ServicesSubscriptionPage.route, extra: data);

    //
  }

  void _onTapRegister(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final bloc = context.read<CategoriesSubscriptionBloc>();
    final Business? business =
        await Loader.showLoader(context, bloc.register());
    if (!context.mounted) return;
    if (business == null) return;
    context.go(LoginPage.route);
  }
}
