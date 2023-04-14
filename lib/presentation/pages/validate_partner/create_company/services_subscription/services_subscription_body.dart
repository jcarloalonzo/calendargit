import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/config/palette.dart';
import '../../../../../core/config/size_text.dart';
import '../../../../../data/models/responses/business_response.dart';
import '../../../../../data/preferences/preferences_user.dart';
import '../../../../bloc/main_bloc.dart';
import '../../../../widgets/my_buttom.dart';
import '../../../../widgets/my_loading_super.dart';
import '../../../../widgets/my_text.dart';
import '../../../../widgets/mysizedbox.dart';
import '../../../../widgets/show_loader.dart';
import '../../login/login_page.dart';
import '../categories_subscription/components/container_chip.dart';
import 'services_subscription_bloc.dart';

class ServicesSubscriptionBody extends StatelessWidget {
  const ServicesSubscriptionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ServicesSubscriptionBloc>(context, listen: true);
    final myLoading = MyLoading(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MyText(
            text: 'Servicios',
            size: SizeText.textLarge,
            color: Palette.colorApp,
          ),
          const MyText(
            text: 'Eliga los servicios que va a ofrecer su SPA.',
            size: SizeText.text2,
            maxLines: 3,
            color: Palette.colorApp,
          ),
          const MySizedBoxHeight(),
          Expanded(
              child: SingleChildScrollView(
            child: Wrap(
              children: bloc.services.map((service) {
                return ContainerChip(
                  service.description,
                  isSelected: bloc.exists(service),
                  onTap: () => bloc.onTapChip(service),
                );
              }).toList(),
            ),
          )),
          MyButtom(
            text: 'REGISTRAR',
            onTap: () async {
              try {
                final prefs = PreferencesUser();
                final mainBloc = context.read<MainBloc>();

                bool valida = await Loader.showLoader(context, bloc.register());

                if (!valida) return;
                // if (request == null) return;
                if (!context.mounted) return;

                final business = prefs.business;

                mainBloc.business =
                    BusinessResponse.businessResponseFromJson(business!);

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (ctx) => LoginPage.init(
                      ctx,
                    ),
                  ),
                  (route) => false,
                );
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
