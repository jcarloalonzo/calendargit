import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/config/palette.dart';
import '../../../../../core/config/size_text.dart';
import '../../../../../data/models/responses/business_response.dart';
import '../../../../../data/preferences/preferences_user.dart';
import '../../../../bloc/main_bloc.dart';
import '../../../../widgets/my_buttom.dart';
import '../../../../widgets/my_text.dart';
import '../../login/login_page.dart';
import 'categories_subscription_bloc.dart';

class CategoriesSubscriptionBody extends StatelessWidget {
  const CategoriesSubscriptionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CategoriesSubscriptionBloc>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
          MyButtom(
            text: 'text',
            onTap: () async {
              await bloc.getCategories();
            },
          ),
          Expanded(
              child: Wrap(
            children: bloc.categories.map((category) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        // color: isSelected ? Palette.primaryColor : Colors.grey,
                        color: Palette.colorApp,
                        width: 2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyText(
                        text: category.description,
                        // color: isSelected ? Palette.primaryColor : Colors.grey,
                        color: Palette.colorApp,
                        fontWeight: FontWeight.w600,
                        size: SizeText.text4,
                      ),
                      const SizedBox(width: 8),
                      const MyText(
                        text: 'x',
                        color: Palette.primaryColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )),
          MyButtom(
            text: 'REGISTRAR',
            onTap: () async {
              try {
                final prefs = PreferencesUser();
                final mainBloc = context.read<MainBloc>();

                bool? valida = await bloc.register();

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
