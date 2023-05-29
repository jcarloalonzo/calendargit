import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_loading_super.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import '../../validate_partner/create_company/categories_subscription/components/container_chip.dart';
import '../home/workers_page.dart';
import 'add_services_worker_bloc.dart';

class AddServicesWorkerBody extends StatelessWidget {
  const AddServicesWorkerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AddServicesWorkerBloc>(context);
    final myLoading = MyLoading(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MySizedBoxHeight(),
            const MyText(
              text: 'Asignar servicios al empleado',
              color: Palette.colorApp,
              fontWeight: FontWeight.w700,
              size: SizeText.text3 - 1,
              maxLines: 2,
            ),
            const MySizedBoxHeight(),
            Expanded(
                child: SingleChildScrollView(
              child: Wrap(
                children: bloc.services.map((service) {
                  return ContainerChip(
                    service.description ?? '',
                    isSelected: bloc.exists(service),
                    onTap: () => bloc.onTapChip(service),
                  );
                }).toList(),
              ),
            )),

            const MySizedBoxHeight(),
            MyButtom(
                text: 'Asignar servicios',
                onTap: () async {
                  myLoading.createLoading();
                  final bool response = await bloc.setServices();
                  myLoading.dismiss();
                  if (!response) return;

                  if (!context.mounted) return;

                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, BackGroundNavigator.routeName, (route) => false);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkersPage.init(context),
                      ),
                      (route) => false);
                }),
            const MySizedBoxHeight(),
            //

            //MaterialPageRoute(

            //
          ],
        ),
      ),
    );
  }
}
