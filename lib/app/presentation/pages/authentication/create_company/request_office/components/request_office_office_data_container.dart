import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../config/app_config/size_text.dart';
import '../../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../../generated/translations.g.dart';
import '../../../../../blocs/authentication/create_company/request_office/request_office_bloc.dart';
import '../../../../../blocs/authentication/create_company/request_office/screen_model/request_office_screen_model.dart';
import '../../../../../widgets/my_card_container.dart';
import '../../../../../widgets/my_text.dart';
import '../../../../../widgets/textfield_general.dart';

class RequestOfficeOfficeDataContainer extends StatefulWidget {
  const RequestOfficeOfficeDataContainer({
    super.key,
    required this.model,
  });
  final RequestOfficeScreenModel model;
  @override
  State<RequestOfficeOfficeDataContainer> createState() =>
      _RequestOfficeOfficeDataContainerState();
}

class _RequestOfficeOfficeDataContainerState
    extends State<RequestOfficeOfficeDataContainer> {
  late TextEditingController _officeNameTextController;
  late TextEditingController _officeAddressTextController;
  late TextEditingController _officePhoneTextController;
  @override
  void initState() {
    initControllers();
    super.initState();
    initValues();
  }

  void initControllers() {
    _officeNameTextController = TextEditingController();
    _officeAddressTextController = TextEditingController();
    _officePhoneTextController = TextEditingController();
  }

  void initValues() {
    _officeNameTextController.text = widget.model.officeName;
    _officeAddressTextController.text = widget.model.officeAddess;
    _officePhoneTextController.text = widget.model.officePhone;
  }

  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            texts.label.officeData,
            size: SizeText.text3 - 1,
            fontWeight: FontWeight.w500,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            controller: _officeNameTextController,
            isImportantFormRed: true,
            title: texts.label.officeName,
            textCapitalization: TextCapitalization.characters,
            onChanged: context.read<RequestOfficeBloc>().setOfficeName,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            controller: _officeAddressTextController,
            isEnabled: false,
            title: texts.label.address,
            onChanged: context.read<RequestOfficeBloc>().setOfficeAddress,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            controller: _officePhoneTextController,
            title: texts.label.phone,
            onChanged: context.read<RequestOfficeBloc>().setOfficePhone,
          ),
          SpaceHelpers.verticalNormal,
        ],
      ),
    );
  }
}
