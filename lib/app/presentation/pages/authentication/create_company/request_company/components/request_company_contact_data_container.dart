import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../config/app_config/size_text.dart';
import '../../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../../generated/translations.g.dart';
import '../../../../../blocs/authentication/create_company/request_company/request_company_bloc.dart';
import '../../../../../blocs/authentication/create_company/request_company/screen_model/request_company_screen_model.dart';
import '../../../../../widgets/my_card_container.dart';
import '../../../../../widgets/my_text.dart';
import '../../../../../widgets/textfield_general.dart';

class RequestCompanyContactDataContainer extends StatefulWidget {
  const RequestCompanyContactDataContainer({
    super.key,
    required this.model,
  });
  final RequestCompanyScreenModel model;

  @override
  State<RequestCompanyContactDataContainer> createState() =>
      _RequestCompanyContactDataContainerState();
}

class _RequestCompanyContactDataContainerState
    extends State<RequestCompanyContactDataContainer> {
  late TextEditingController _contactEmailTextController;
  late TextEditingController _contactPhoneTextController;
  late TextEditingController _contactNameTextController;

  @override
  void initState() {
    initControllers();
    super.initState();

    initValues();
  }

  void initControllers() {
    _contactEmailTextController = TextEditingController();
    _contactPhoneTextController = TextEditingController();
    _contactNameTextController = TextEditingController();
  }

  void initValues() {
    _contactEmailTextController.text = widget.model.contactEmail;
    _contactPhoneTextController.text = widget.model.contactPhone;
    _contactNameTextController.text = widget.model.contactName;
  }

  @override
  void dispose() {
    _contactEmailTextController.dispose();
    _contactPhoneTextController.dispose();
    _contactNameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            texts.label.contactData,
            size: SizeText.text3 - 1,
            fontWeight: FontWeight.w500,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            controller: _contactEmailTextController,
            title: texts.label.email,
            onChanged: context.read<RequestCompanyBloc>().setContactEmail,
            textInputType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.characters,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            controller: _contactPhoneTextController,
            title: texts.label.contactPhone,
            onChanged: context.read<RequestCompanyBloc>().setContactPhone,
            textInputType: TextInputType.phone,
            textCapitalization: TextCapitalization.characters,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            controller: _contactNameTextController,
            title: texts.label.contactName,
            onChanged: context.read<RequestCompanyBloc>().setContactName,
            textInputType: TextInputType.name,
            textCapitalization: TextCapitalization.characters,
          ),
        ],
      ),
    );
  }
}
