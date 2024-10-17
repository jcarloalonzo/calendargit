import 'package:flutter/material.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../domain/models/service_worker.dart';
import '../../../../widgets/my_card_container.dart';
import '../../../../widgets/my_text.dart';

class WorkerDetailServicesListContainer extends StatelessWidget {
  const WorkerDetailServicesListContainer({
    super.key,
    required this.services,
  });

  final List<ServiceWorker> services;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final service = services[index];
        return MyCardContainer(
          backgroundColor: Palette.gray,
          child: Row(
            children: [
              Flexible(
                child: MyText(
                  service.description,
                  maxLines: 3,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
      itemCount: services.length,
    );
  }
}
