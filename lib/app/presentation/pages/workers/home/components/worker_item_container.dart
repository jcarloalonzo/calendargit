import 'package:flutter/material.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../domain/models/worker.dart';
import '../../../../widgets/my_card_container.dart';
import '../../../../widgets/my_text.dart';

class WorkerItemContainer extends StatelessWidget {
  const WorkerItemContainer({super.key, required this.worker});

  final Worker worker;

  String getWorker(int id) {
    switch (id) {
      case 1:
        return 'Gerente';
      case 2:
        return 'Empleado';
      case 3:
        return 'Comisionista';
      default:
        return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      backgroundColor: Palette.white,
      child: Row(
        children: [
          const CircleAvatar(
            child: Icon(Icons.person),
          ),
          SpaceHelpers.horizontalNormal,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: MyText(
                      worker.name,
                      maxLines: 2,
                      fontWeight: FontWeight.w600,
                      color: Palette.colorApp,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Palette.colorApp),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: MyText(
                      getWorker(worker.personTypeId),
                      color: Palette.colorApp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              MyText(
                worker.documentNumber,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
