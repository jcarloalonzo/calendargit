import '../../../core/config/config.dart';

class ServiceList {
  const ServiceList(
      {required this.datereal,
      required this.datehourfinal,
      required this.datehour,
      required this.service,
      required this.client});

  final DateTime datereal;
  final DateTime datehour;
  final DateTime datehourfinal;
  final String service;
  final String client;

  String get date => Config.formatDate(datereal, 'dd/MM/yy');
  String get hour => Config.formatDate(datehour, 'HH:mm');
}
