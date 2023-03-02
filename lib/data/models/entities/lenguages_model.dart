class LenguagesModel {
  LenguagesModel({
    this.idioma,
    this.img,
    this.cod = '',
    this.voz,
    this.description,
  });

  String? idioma;
  String? img;
  String cod;
  String? voz;
  String? description;
}

final lenguagesmodels = <LenguagesModel>[
  LenguagesModel(
    idioma: 'Español (PE)',
    img: 'assets/png/spanish.png',
    cod: 'es',
    voz: 'es-PE',
    description: 'Español Perú',
  ),
  LenguagesModel(
      idioma: 'English (US)',
      img: 'assets/png/usa.png',
      cod: 'en',
      voz: 'en-US',
      description: 'English United States'),
];
