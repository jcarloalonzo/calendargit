import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/data/entities/requests/id_request.dart';
import '../../app/data/entities/responses/services_category_response.dart';
import '../../app/domain/error_model/error_model.dart';
import '../../app/domain/models/category.dart';
import '../../app/domain/models/professional_turn_appointment.dart';
import '../../app/domain/models/service.dart';
import '../../app/presentation/widgets/popups/my_dialog.dart';
import '../app_config/palette.dart';

class Helpers {
  const Helpers._();
  static showErrorPopupState(BuildContext context,
      {ErrorModel? error, required Function() cleanErrorCallback}) async {
    if (error == null) return;
    MyDialogs.yesAbortDialog(
        onlyButtom: true, body: error.message, context: context);
    if (!context.mounted) return;
    cleanErrorCallback();
  }

  static String firstUpper(String str) {
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }

  static List<IdRequest> catogoriesToIdRequest(List<Category> categories) {
    List<IdRequest> ids =
        categories.map((e) => IdRequest(id: e.categoryId)).toList();
    return ids;
  }

  static List<IdRequest> servicesCategoriesToIdRequest(
      List<ServicesCategoryResponse> servicesCategories) {
    List<IdRequest> ids =
        servicesCategories.map((e) => IdRequest(id: e.serviceId)).toList();
    return ids;
  }

  static List<IdRequest> servicesToIdRequest(List<Service> services) {
    List<IdRequest> ids =
        services.map((e) => IdRequest(id: e.serviceId)).toList();
    return ids;
  }

  static String firstStringCapitalization(String str) {
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }

  static bool stringIsnullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static void showSnackBar(BuildContext context, {required String message}) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<DateTime?> selectDateMethod(BuildContext context,
      {TextEditingController? controller,
      // String? dateTime='dd/MM/yyyy',
      String? dateTime = 'yyyy-MM-dd',
      bool before = false}) async {
    DateTime? picked = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),
      // firstDate:  DateTime(2018),
      firstDate: DateTime.now().add(Duration(days: (before) ? -720 : 0)),
      lastDate: DateTime.now().add(const Duration(days: 60)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Palette.primaryColor,
            ),
            dialogBackgroundColor: Palette.white,
          ),
          child: child!,
        );
      },
    );
    return picked;
  }

  static String formatDate(
    DateTime date, {
    // String dateFormat = 'dd/MM/yyyy',
    String dateFormat = 'yyyy-MM-dd',
  }) =>
      DateFormat(dateFormat).format(date);

  static String formatIntZero(int str, {int i = 2}) {
    return str.toString().padLeft(i, '0');
  }

  static String formatStringZero(String str, {int i = 2}) {
    return str.toString().padLeft(i, '0');
  }

  //
  static formatPriceDollar(num price) {
    final numberFormat = NumberFormat('##,##0.00', 'en_US');

    return '\$ ${numberFormat.format(price)}';
  }

  //
  static String formatPrice(num price) {
    final numberFormat = NumberFormat('##,##0.00', 'en_US');
    // return price.toStringAsFixed(2);
    return numberFormat.format(price);
  }

  static DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  static DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  static DateTime findLastDateOfTheMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month + 1, 0);
  }

  static DateTime findFirstDateOfTheMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, 1);
  }

  static DateTime findLastDateOfTheYear(DateTime dateTime) {
    return DateTime(dateTime.year, 12, 31);
  }

  static DateTime findFirstDateOfTheYear(DateTime dateTime) {
    return DateTime(dateTime.year, 1, 1);
  }

  static Future<String> setFile64XLS(String s) async {
    final dir = await getTemporaryDirectory();
    File file =
        File('${dir.path}/XLS-${Helpers.formatDate(DateTime.now())}.xlsx');
    final decodedBytes = base64Decode(s);
    file.writeAsBytes(decodedBytes, flush: true);
    String fullPath = file.path;
    return fullPath;
  }

  static Future<String> setFile64PDF(String s) async {
    var dir = await getTemporaryDirectory();
    File file =
        File('${dir.path}/PDF-${Helpers.formatDate(DateTime.now())}.pdf');
    final decodedBytes = base64Decode(s);
    file.writeAsBytes(decodedBytes, flush: true);
    String fullPath = file.path;
    return fullPath;
  }

  static Color statusColorBookingState(int status) {
    switch (status) {
      case 1:
        return Palette.statusxconfirmar;
      case 3:
        return Palette.statuscompletada;
      case 4:
        return Palette.statuscancelada;
      case 5:
        return Palette.statusinvoice;
      case 6:
        return Palette.statusReprogramada;
      default:
        return Palette.statusxconfirmar;
    }
  }

  static bool isSelectedShift(
      {required ProfessionalTurnAppointment turn,
      ProfessionalTurnAppointment? turnSelected}) {
    if (turnSelected == null) return false;
    final dataTurn = '${turn.initialTurn}-${turn.finalTurn}';
    final dataTurnSelected =
        '${turnSelected.initialTurn}-${turnSelected.finalTurn}';
    return dataTurn == dataTurnSelected;
  }
}
