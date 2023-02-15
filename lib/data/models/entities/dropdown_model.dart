import 'package:calendario/presentation/bloc/agent_bloc.dart';

class LenguagesModel {
  LenguagesModel({this.idioma, this.img, this.cod = ''});

  String? idioma;
  String? img;
  String cod;
}

final lenguagesmodels = <LenguagesModel>[
  LenguagesModel(idioma: 'Español', img: 'assets/png/spanish.png', cod: 'es'),
  LenguagesModel(idioma: 'English', img: 'assets/png/usa.png', cod: 'en'),
];

class AgendaDateModelDrop {
  AgendaDateModelDrop(
      {this.cod, this.descripcion = '', required this.typehorario});

  int? cod;
  String descripcion;
  Typehorario typehorario;
}

final agendasDateModelDrop = <AgendaDateModelDrop>[
  AgendaDateModelDrop(
      cod: 1, descripcion: 'Ayer', typehorario: Typehorario.ayer),
  AgendaDateModelDrop(cod: 2, descripcion: 'Hoy', typehorario: Typehorario.hoy),
  AgendaDateModelDrop(
      cod: 3, descripcion: 'Mañana', typehorario: Typehorario.manana),
  AgendaDateModelDrop(
      cod: 4, descripcion: 'Esta semana', typehorario: Typehorario.semana),
  AgendaDateModelDrop(
      cod: 5, descripcion: 'Este mes', typehorario: Typehorario.mes),
];

class TipoEstadoDropDown {
  TipoEstadoDropDown({this.cod, this.descripcion = ''});

  int? cod;
  String descripcion;
}

final estadosDropdown = <TipoEstadoDropDown>[
  TipoEstadoDropDown(cod: 0, descripcion: 'PENDIENTE'),
  TipoEstadoDropDown(cod: 1, descripcion: 'ACEPTADO'),
  TipoEstadoDropDown(cod: 2, descripcion: 'RECHAZADO'),
];

//
//
//
//
//
//
class TypeStateBookingDropDown {
  TypeStateBookingDropDown({this.cod, this.descripcion = ''});

  int? cod;
  String descripcion;
}

final typeStatesDropDown = <TypeStateBookingDropDown>[
  TypeStateBookingDropDown(cod: 0, descripcion: 'TODO'),
  TypeStateBookingDropDown(cod: 1, descripcion: 'PENDIENTE'),
  // TypeStateBookingDropDown(cod: 2, descripcion: 'RECHAZADO'),
  TypeStateBookingDropDown(cod: 3, descripcion: 'COMPLETADA'),
  TypeStateBookingDropDown(cod: 4, descripcion: 'ANULADA'),
  TypeStateBookingDropDown(cod: 5, descripcion: 'FACTURADO'),
  TypeStateBookingDropDown(cod: 6, descripcion: 'REPROGRAMADO'),
];
//
//
//
//
//
//
//
//
//
//

class TipoCancelacionDrop {
  TipoCancelacionDrop({this.cod, this.descripcion = ''});

  int? cod;
  String descripcion;
}

final tiposCancelacionesDrop = <TipoCancelacionDrop>[
  TipoCancelacionDrop(cod: 0, descripcion: 'Otros'),
  TipoCancelacionDrop(cod: 1, descripcion: 'Rechazado por el cliente'),
  TipoCancelacionDrop(cod: 2, descripcion: 'Tiempo de espera agotado'),
];
//

class TipoPagoModelDropDown {
  TipoPagoModelDropDown({this.cod, this.descripcion = ''});

  int? cod;
  String descripcion;
}

final tipoPagoModels = <TipoPagoModelDropDown>[
  TipoPagoModelDropDown(cod: 1, descripcion: 'CASH'),
  TipoPagoModelDropDown(cod: 2, descripcion: 'TARJETA'),
  TipoPagoModelDropDown(cod: 3, descripcion: 'ZELLE'),
];

class TipoTarjetaModelDropDown {
  TipoTarjetaModelDropDown({this.cod, this.descripcion = ''});

  int? cod;
  String descripcion;
}

final tipoTarjetaModels = <TipoTarjetaModelDropDown>[
  TipoTarjetaModelDropDown(cod: 1, descripcion: 'VISA'),
  TipoTarjetaModelDropDown(cod: 2, descripcion: 'MASTERCARD'),
];
