import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../blocs/workers/new_worker/set_services_worker/screen_model/set_services_worker_screen_model.dart';
import '../../../../blocs/workers/new_worker/set_services_worker/set_services_worker_bloc.dart';
import '../../../../widgets/container_chip_selected.dart';
import '../../../../widgets/my_buttom.dart';
import '../../../../widgets/my_text.dart';
import '../../../../widgets/util/loader.dart';
import '../../../navigator/navigator_page.dart';
import '../../home/workers_page.dart';

class SetServicesWorkerBody extends StatelessWidget {
  const SetServicesWorkerBody({super.key, required this.model});
  final SetServicesWorkerScreenModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SpaceHelpers.verticalNormal,
        MyText(
          texts.label.assignServicesToTheEmployee,
          color: Palette.colorApp,
          fontWeight: FontWeight.w700,
          size: SizeText.text3 - 1,
          maxLines: 2,
        ),
        SpaceHelpers.verticalNormal,
        if (model.services.isNotEmpty) ...[
          Expanded(
              child: SingleChildScrollView(
            child: Wrap(
              children: model.services.map((service) {
                return ContainerChipSelected(
                  service.description.toUpperCase(),
                  isSelected:
                      context.read<SetServicesWorkerBloc>().exists(service),
                  onTap: () =>
                      context.read<SetServicesWorkerBloc>().onTapChip(service),
                );
              }).toList(),
            ),
          )),
          SpaceHelpers.verticalNormal,
          MyButtom(texts.label.assignServices,
              onTap: () => _onTapAssign(context)),
        ] else ...[
          SpaceHelpers.verticalVeryLong,
          SpaceHelpers.verticalVeryLong,
          MyButtom(texts.label.home, onTap: () => _onTapHome(context)),
        ],
      ],
    );
  }

  void _onTapAssign(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final bloc = context.read<SetServicesWorkerBloc>();
    final bool response =
        await Loader.showLoader(context, bloc.setServicesWorker());
    if (!context.mounted) return;
    if (!response) return;
    context.go(WorkersPage.route);
  }

  void _onTapHome(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.go(NavigatorPage.route);
  }
}
