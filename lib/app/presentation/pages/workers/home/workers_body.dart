import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app_config/space_helpers.dart';
import '../../../../domain/models/worker.dart';
import '../worker_detail/worker_detail_page.dart';
import 'components/worker_item_container.dart';
import 'components/workers_header_container.dart';

class WorkersBody extends StatelessWidget {
  const WorkersBody({super.key, required this.workers});
  final List<Worker> workers;
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SpaceHelpers.verticalNormal,
        WorkersHeaderContainer(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final Worker worker = workers[index];
              return GestureDetector(
                  onTap: () => _onTapWorker(context, worker: worker),
                  child: WorkerItemContainer(worker: worker));
            },
            itemCount: workers.length,
          ),
        )
        //
      ],
    );
  }

  void _onTapWorker(BuildContext context, {required Worker worker}) {
    context.push(WorkerDetailPage.route, extra: worker);
  }
}
