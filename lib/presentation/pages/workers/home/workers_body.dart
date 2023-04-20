import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import 'components/item_container_worker.dart';
import 'workers_bloc.dart';

class WorkersBody extends StatelessWidget {
  const WorkersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<WorkersBloc>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MySizedBoxHeight(),
            MyText(
              text: bloc.business.businessName ?? '',
              color: Palette.colorApp,
              fontWeight: FontWeight.w700,
              size: SizeText.text3,
              maxLines: 2,
            ),
            const MySizedBoxHeight(),
            const MyText(
              text: 'Empleados',
              color: Palette.colorApp,
              size: SizeText.text4,
              maxLines: 2,
            ),
            //
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final worker = bloc.workers[index];
                  return ItemContainerWorker(worker: worker);
                },
                itemCount: bloc.workers.length,
              ),
            )

            //
            //
          ],
        ),
      ),
    );
  }
}
