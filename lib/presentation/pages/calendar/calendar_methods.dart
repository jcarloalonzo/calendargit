import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/data/models/entities/dropdown_model.dart';
import 'package:calendario/presentation/bloc/calendar_bloc.dart';
import 'package:calendario/presentation/widgets/my_alerts.dart';
import 'package:calendario/presentation/widgets/my_buttom.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/palette.dart';

class CalendarMethods {
  static Future<DialogsAlerts?> filterMethodSchedule(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        useSafeArea: true,
        barrierColor: Colors.black.withOpacity(0.8),
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            elevation: 20,
            insetPadding: EdgeInsets.zero,
            title: Container(
              padding: const EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              color: Palette.colorApp,
              height: 40,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyText(
                    fontWeight: FontWeight.w700,
                    size: SizeText.text5,
                    color: Palette.white,
                    text: 'Filtrar',
                  ),
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Palette.white),
                    onPressed: () {
                      Navigator.of(context).pop(DialogsAlerts.abort);
                    },
                  ),
                ],
              ),
            ),
            titlePadding: EdgeInsets.zero,
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return const _MyDialogFilter();
              },
            ),
          );
        });
  }
}

class _MyDialogFilter extends StatefulWidget {
  const _MyDialogFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<_MyDialogFilter> createState() => _MyDialogFilterState();
}

class _MyDialogFilterState extends State<_MyDialogFilter> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CalendarBloc>(context, listen: true);
    return SizedBox(
      width: 100,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const SizedBox(height: 07),
                  Card(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<TypeStateBookingDropDown>(
                          isDense: true,
                          value: bloc.typeStateBookingDropDown,
                          onChanged: (TypeStateBookingDropDown? value) {
                            bloc.typeStateBookingDropDown = value!;
                          },
                          items: typeStatesDropDown
                              .map((TypeStateBookingDropDown data) {
                            return DropdownMenuItem(
                              value: data,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  MyText(
                                    text: data.descripcion,
                                    size: SizeText.text5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  MyButtom(
                    text: 'Buscar',
                    colorText: Palette.white,
                    sizeText: SizeText.text5,
                    height: 35,
                    color: Palette.green2,
                    onTap: (!bloc.isLoading)
                        ? () async {
                            Navigator.of(context).pop(DialogsAlerts.yes);
                          }
                        : null,
                  ),
                  const SizedBox(height: 07),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
