import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/config/palette.dart';
import '../../../../../core/config/size_text.dart';
import '../../../../../data/models/entities/services_response.dart';
import '../../../../../data/models/requests/create_company_request.dart';
import '../../../../widgets/my_buttom.dart';
import '../../../../widgets/my_text.dart';
import '../../../../widgets/mysizedbox.dart';
import '../../../../widgets/show_loader.dart';
import '../services_subscription/services_subscription_page.dart';
import 'categories_subscription_bloc.dart';
import 'components/container_chip.dart';

class CategoriesSubscriptionBody extends StatelessWidget {
  const CategoriesSubscriptionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CategoriesSubscriptionBloc>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MyText(
            text: 'Categorias',
            size: SizeText.textLarge,
            color: Palette.colorApp,
          ),
          const MyText(
            text: 'Eliga que categorias de servicios va a ofrecer su SPA',
            size: SizeText.text2,
            maxLines: 3,
            color: Palette.colorApp,
          ),
          const MySizedBoxHeight(),
          Expanded(
              child: SingleChildScrollView(
            child: Wrap(
              children: bloc.categories.map((category) {
                return ContainerChip(
                  category.description,
                  isSelected: bloc.exists(category),
                  onTap: () => bloc.onTapChip(category),
                );
              }).toList(),
            ),
          )),
          MyButtom(
            text: bloc.categoriesSelected.isEmpty ? 'Registrar' : 'Continuar',
            onTap: () async {
              try {
                List<ServicesResponse> services = await Loader.showLoader(
                    context, bloc.getServicesByCategories());

                if (services.isEmpty) {
                  //
                  //
                  return;
                }
                if (!context.mounted) return;

                CreateCompanyRequest? request = bloc.getRequestCompany();
                if (request == null) return;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServicesSubscriptionPage.init(
                        context,
                        company: bloc.company!,
                        request: request,
                        services: services,
                      ),
                    ));

                // final prefs = PreferencesUser();
                // final mainBloc = context.read<MainBloc>();

                // bool? valida = await bloc.register();

                // if (!valida) return;
                // // if (request == null) return;
                // if (!context.mounted) return;

                // final business = prefs.business;

                // mainBloc.business =
                //     BusinessResponse.businessResponseFromJson(business!);

                // Navigator.of(context).pushAndRemoveUntil(
                //   MaterialPageRoute(
                //     builder: (ctx) => LoginPage.init(
                //       ctx,
                //     ),
                //   ),
                //   (route) => false,
                // );
              } catch (e) {
                bloc.setError(e.toString());
                return;
              }
            },
          ),
        ],
      ),
    );
  }
}
