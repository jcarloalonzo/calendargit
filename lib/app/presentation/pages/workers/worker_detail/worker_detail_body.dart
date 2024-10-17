import 'package:flutter/material.dart';

import '../../../../../config/app_config/palette.dart';
import '../../../../../config/app_config/size_text.dart';
import '../../../../../config/app_config/space_helpers.dart';
import '../../../../../generated/translations.g.dart';
import '../../../blocs/workers/worker_detail/screen_model/worker_detail_screen_model.dart';
import '../../../widgets/my_text.dart';
import 'components/worker_detail_services_list_container.dart';
import 'components/worker_detail_worker_container.dart';

class WorkerDetailBody extends StatelessWidget {
  const WorkerDetailBody({super.key, required this.model});
  final WorkerDetailScreenModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        WorkerDetailWorkerContainer(worker: model.worker),
        SpaceHelpers.verticalNormal,
        MyText(
          texts.label.services,
          color: Palette.colorApp,
          fontWeight: FontWeight.w700,
          size: SizeText.text3 - 1,
          maxLines: 2,
        ),
        SpaceHelpers.verticalNormal,
        Expanded(
          child: WorkerDetailServicesListContainer(services: model.services),
        ),
        SpaceHelpers.verticalNormal,
      ],
    );
  }
}
