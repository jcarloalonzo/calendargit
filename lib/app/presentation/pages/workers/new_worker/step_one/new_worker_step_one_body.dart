import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../blocs/workers/new_worker/new_worker_step_one/new_worker_step_one_bloc.dart';
import '../../../../blocs/workers/new_worker/new_worker_step_one/screen_model/new_worker_step_one_screen_model.dart';
import '../../../../widgets/business_name_text.dart';
import '../../../../widgets/my_buttom.dart';
import '../../../../widgets/my_card_container.dart';
import '../../../../widgets/textfield_general.dart';
import '../step_two/new_worker_step_two_page.dart';

class NewWorkerBody extends StatelessWidget {
  const NewWorkerBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BusinessNameText(),
          MyCardContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MyTextField(
                  title: texts.label.documentNumber,
                  isImportantFormRed: true,
                  textInputType: TextInputType.numberWithOptions(
                      decimal: false, signed: false),
                  onChanged:
                      context.read<NewWorkerStepOneBloc>().setDocumentNumber,
                ),
                SpaceHelpers.verticalNormal,
                MyTextField(
                  title: texts.label.name,
                  isImportantFormRed: true,
                  textCapitalization: TextCapitalization.characters,
                  textInputType: TextInputType.name,
                  onChanged: context.read<NewWorkerStepOneBloc>().setName,
                ),
                SpaceHelpers.verticalNormal,
                MyTextField(
                  title: texts.label.surname,
                  isImportantFormRed: true,
                  textInputType: TextInputType.name,
                  textCapitalization: TextCapitalization.characters,
                  onChanged: context.read<NewWorkerStepOneBloc>().setSurname,
                ),
                SpaceHelpers.verticalNormal,
                MyTextField(
                  title: texts.label.phone,
                  onChanged: context.read<NewWorkerStepOneBloc>().setPhone,
                  textInputType: TextInputType.phone,
                ),
                SpaceHelpers.verticalNormal,
                MyTextField(
                  title: texts.label.email,
                  textCapitalization: TextCapitalization.characters,
                  textInputType: TextInputType.emailAddress,
                  onChanged: context.read<NewWorkerStepOneBloc>().setEmail,
                ),
                SpaceHelpers.verticalNormal,
                MyButtom(
                  texts.label.continu,
                  onTap: () => _onTapContinue(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTapContinue(BuildContext context) {
    FocusScope.of(context).unfocus();
    final bloc = context.read<NewWorkerStepOneBloc>();
    final NewWorkerStepOneScreenModel? data = bloc.modelData();
    if (data == null) return;
    context.push(NewWorkerStepTwoPage.route, extra: data);
    //
  }
}
