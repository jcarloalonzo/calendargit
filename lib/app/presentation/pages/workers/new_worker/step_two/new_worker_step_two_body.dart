import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../blocs/workers/new_worker/new_worker_step_two/new_worker_step_two_bloc.dart';
import '../../../../blocs/workers/new_worker/new_worker_step_two/screen_model/new_worker_step_two_screen_model.dart';
import '../../../../widgets/business_name_text.dart';
import '../../../../widgets/my_buttom.dart';
import '../../../../widgets/my_card_container.dart';
import '../../../../widgets/textfield_general.dart';
import '../../../../widgets/util/loader.dart';
import '../set_services_worker/set_services_worker_page.dart';

class NewWorkerStepTwoBody extends StatefulWidget {
  const NewWorkerStepTwoBody({super.key, required this.model});
  final NewWorkerStepTwoScreenModel model;

  @override
  State<NewWorkerStepTwoBody> createState() => _NewWorkerStepTwoBodyState();
}

class _NewWorkerStepTwoBodyState extends State<NewWorkerStepTwoBody> {
  late TextEditingController _userTextController;
  @override
  void initState() {
    _userTextController = TextEditingController();
    super.initState();
    initValues();
  }

  void initValues() {
    _userTextController.text = widget.model.username;
  }

  @override
  void dispose() {
    _userTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        BusinessNameText(),
        MyCardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MyTextField(
                title: texts.label.user,
                isImportantFormRed: true,
                isEnabled: false,
                isObscure: true,
                controller: _userTextController,
              ),
              SpaceHelpers.verticalNormal,
              MyTextField(
                title: texts.label.password,
                isImportantFormRed: true,
                onChanged: context.read<NewWorkerStepTwoBloc>().setPassword,
              ),
              SpaceHelpers.verticalNormal,
              MyButtom(
                texts.label.register,
                onTap: () => _onTapRegister(context),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _onTapRegister(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final bloc = context.read<NewWorkerStepTwoBloc>();
    final int? personIdResponse =
        await Loader.showLoader(context, bloc.createWorker());
    if (!context.mounted) return;
    if (personIdResponse == null) return;
    context.go(SetServicesWorkerPage.route, extra: personIdResponse);
  }
}
