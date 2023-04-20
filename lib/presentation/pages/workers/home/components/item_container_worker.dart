import 'package:flutter/material.dart';

import '../../../../../core/config/palette.dart';
import '../../../../../data/models/responses/person_response.dart';
import '../../../../widgets/my_card_container.dart';
import '../../../../widgets/my_text.dart';
import '../../../../widgets/mysizedbox.dart';

class ItemContainerWorker extends StatelessWidget {
  const ItemContainerWorker({
    Key? key,
    required this.worker,
  }) : super(key: key);

  final PersonResponse worker;

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
          const MySizedBoxWidth(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: MyText(
                      maxLines: 2,
                      text: worker.name ?? '',
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
                      text: getWorker(worker.personTypeId),
                      color: Palette.colorApp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              MyText(
                text: worker.documentNumber ?? '',
              ),
            ],
          )),
        ],
      ),
    );
  }
}
