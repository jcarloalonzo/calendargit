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

class RequestCompanyCompanyDataContainer extends StatefulWidget {
  const RequestCompanyCompanyDataContainer({
    super.key,
    required this.model,
  });
  final RequestCompanyScreenModel model;

  @override
  State<RequestCompanyCompanyDataContainer> createState() =>
      _RequestCompanyCompanyDataContainerState();
}

class _RequestCompanyCompanyDataContainerState
    extends State<RequestCompanyCompanyDataContainer> {
  late TextEditingController _companyNameTextController;
  late TextEditingController _legalNameTextController;
  late TextEditingController _websiteTextController;
  late TextEditingController _phoneTextController;
  @override
  void initState() {
    initControllers();
    super.initState();
    initValues();
  }

  void initControllers() {
    _companyNameTextController = TextEditingController();
    _legalNameTextController = TextEditingController();
    _websiteTextController = TextEditingController();
    _phoneTextController = TextEditingController();
  }

  void initValues() {
    _companyNameTextController.text = widget.model.companyName;
    _legalNameTextController.text = widget.model.legalName;
    _websiteTextController.text = widget.model.website;
    _phoneTextController.text = widget.model.companyPhone;
  }

  @override
  void dispose() {
    _companyNameTextController.dispose();
    _legalNameTextController.dispose();
    _websiteTextController.dispose();
    _phoneTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            texts.label.companyData,
            size: SizeText.text3 - 1,
            fontWeight: FontWeight.w500,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            controller: _companyNameTextController,
            isImportantFormRed: true,
            title: texts.label.companyName,
            textCapitalization: TextCapitalization.characters,
            onChanged: context.read<RequestCompanyBloc>().setNameCompany,
            textInputType: TextInputType.text,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            controller: _legalNameTextController,
            isImportantFormRed: true,
            title: texts.label.legalName,
            onChanged: context.read<RequestCompanyBloc>().setLegalName,
            textCapitalization: TextCapitalization.characters,
            textInputType: TextInputType.text,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            controller: _websiteTextController,
            title: texts.label.website,
            onChanged: context.read<RequestCompanyBloc>().setWebSite,
            textCapitalization: TextCapitalization.characters,
            textInputType: TextInputType.url,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            controller: _phoneTextController,
            textCapitalization: TextCapitalization.characters,
            title: texts.label.phone,
            onChanged: context.read<RequestCompanyBloc>().setCompanyPhone,
            textInputType:
                TextInputType.numberWithOptions(decimal: false, signed: true),
          ),
        ],
      ),
    );
  }
}
