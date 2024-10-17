import 'package:flutter/material.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../config/helpers/helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../domain/models/worker.dart';
import '../../../../widgets/my_text.dart';

class WorkerDetailWorkerContainer extends StatelessWidget {
  const WorkerDetailWorkerContainer({
    super.key,
    required this.worker,
  });
  final Worker worker;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: double.infinity,
          height: 220,
          child: (!Helpers.stringIsnullOrEmpty(worker.uImage))
              ? FadeInImage(
                  image: NetworkImage(
                    worker.uImage!,
                  ),
                  placeholder: const AssetImage('assets/gif/loading.gif'),
                  height: 180,
                  fit: BoxFit.fill,
                )
              : Image.asset('assets/png/no-image.png', fit: BoxFit.cover),
        ),

        //
        MyText(
          texts.label.employeeData,
          color: Palette.colorApp,
          fontWeight: FontWeight.w700,
          size: SizeText.text3 - 1,
          maxLines: 2,
        ),
        SpaceHelpers.verticalNormal,
        if (worker.description.trim().isEmpty) ...[
          MyText(
            texts.messages.theEmployeeHasNoDataRegistered,
            fontWeight: FontWeight.w300,
            size: SizeText.text4,
            maxLines: 10,
          ),
        ] else ...[
          MyText(
            worker.description,
            fontWeight: FontWeight.w500,
            size: SizeText.text4,
            maxLines: 10,
          ),
        ],
      ],
    );
  }
}
