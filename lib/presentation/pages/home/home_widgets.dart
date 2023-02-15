import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/data/models/entities/home_model.dart';
import 'package:calendario/presentation/bloc/home_bloc.dart';
import 'package:calendario/presentation/widgets/my_card_container.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:calendario/presentation/widgets/mysizedbox.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

// class HomeCard extends StatelessWidget {
//   final List<BookingHome> service;

//   const HomeCard({Key? key, required this.service}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return service.isEmpty
//         ? const _HomeNotting()
//         : _HomeCardData(
//             service: service,
//           );
//   }
// }

// class _HomeCardData extends StatelessWidget {
//   final List<BookingHome> service;

//   const _HomeCardData({Key? key, required this.service}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> listwidgets = [];

//     listwidgets.add(
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             const Icon(
//               Icons.info_rounded,
//               color: Palette.blue1,
//             ),
//             const SizedBox(width: 6),
//             MyText(
//               text: 'Reservas pendientes',
//               fontWeight: FontWeight.w600,
//               size: SizeText.text4 + 1,
//               color: Palette.blue1,
//             )
//           ],
//         ),
//       ),
//     );

//     int n = service.length > 3 ? 3 : service.length;

//     for (var i = 0; i < n; i++) {
//       listwidgets.add(
//         _ListTileReservations(
//           hour: service[i].initialTime,
//           service: service[i].serviceDescription ?? '',
//           client: service[i].name ?? '',
//         ),
//       );
//     }

//     listwidgets.add(Column(
//       children: [
//         const Divider(color: Palette.minimalGray),
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: const [
//                 Expanded(flex: 2, child: Icon(Icons.arrow_forward)),
//                 Expanded(
//                   flex: 8,
//                   child: MyText(
//                     text: 'Mostrar más',
//                   ),
//                 ),
//               ]),
//         ),
//       ],
//     ));

//     return Card(
//       elevation: 3,
//       color: Palette.gray,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: SizedBox(
//         width: double.infinity,
//         child: Column(children: listwidgets),
//       ),
//     );
//   }
// }

// class _ListTileReservations extends StatelessWidget {
//   final String hour;
//   final String service;
//   final String client;

//   const _ListTileReservations(
//       {Key? key,
//       required this.hour,
//       required this.service,
//       required this.client})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       dense: true,
//       minVerticalPadding: 0,
//       leading: MyText(
//         text: hour,
//         fontWeight: FontWeight.w700,
//         size: SizeText.text4 + 1,
//       ),
//       title: MyText(
//         text: service,
//         fontWeight: FontWeight.w400,
//         size: SizeText.text4 + 1,
//       ),
//       subtitle: MyText(
//         fontWeight: FontWeight.w400,
//         text: client,
//         size: SizeText.text5 + 1,
//       ),
//       trailing: const IconSvgButtomAppbar(
//         svg: 'assets/svg/threepoints.svg',
//         colorSvg: Colors.black,
//         sizeSvg: 05,
//       ),
//     );
//   }
// }

// class _HomeNotting extends StatelessWidget {
//   const _HomeNotting({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       color: Palette.gray,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: SizedBox(
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   MyText(
//                     text: 'No hay reservas pendientes',
//                     color: Palette.gray1,
//                     fontWeight: FontWeight.w600,
//                     size: SizeText.text4 + 1,
//                   )
//                 ],
//               ),
//               const SizedBox(height: 10),
//               MyText(
//                 text:
//                     "En estos momentos no presentas reservas asignadas, puedes agregar con el botón en la esquina inferior derecha",
//                 size: SizeText.text4,
//                 fontWeight: FontWeight.w400,
//               ),
//               const SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TitleHombe extends StatelessWidget {
//   final String title;
//   final String date;

//   const TitleHombe({Key? key, required this.title, required this.date})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         MyText(
//           text: title,
//           fontWeight: FontWeight.w700,
//           size: SizeText.text2,
//         ),
//         MyText(
//           text: date,
//           fontWeight: FontWeight.w700,
//           size: SizeText.text2,
//         )
//       ],
//     );
//   }
// }

//
//

class ListCardHome extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icono;

  final Color colorIcono;
  final Function()? onTap;
  const ListCardHome({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icono,
    this.colorIcono = Colors.black,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(08),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  icono,
                  color: colorIcono,
                  size: 40,
                ),
              ),
            ),
            const MySizedBoxWidth(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: title,
                    color: Palette.blue3,
                    size: SizeText.text4,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 2),
                  MyText(
                    text: subTitle,
                    maxLines: 2,
                    size: SizeText.text5,
                    color: Palette.gray6,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

//
//

class CardHomeList extends StatelessWidget {
  final Function()? onTap;
  const CardHomeList({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context, listen: true).listBooking;

    return MyCardContainer(
      padding: false,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Palette.colorApp,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(0.0, 0.8),
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyText(
                    text: 'Tenemos para hoy',
                    fontWeight: FontWeight.w500,
                    color: Palette.white,
                  ),
                  MyText(
                    text: Jiffy().format("d MMMM yyyy"),
                    fontWeight: FontWeight.w500,
                    color: Palette.white,
                  )
                ],
              ),
            ),
          ),
          //

          (bloc.isNotEmpty)
              ? _ContainerDataHoy(onTap: onTap)
              : const _ContainerNoData()
        ],
      ),
    );
  }
}

class _ContainerNoData extends StatelessWidget {
  const _ContainerNoData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          'En estos momentos no presentas reservas pendientes, puedes realizar una reserva presionando el botón "Realizar una reserva"',
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
          maxLines: 7,
          softWrap: true,
          style: TextStyle(
            height: 1.1,
            fontFamily: 'Roboto',
            fontSize: SizeText.text5 - 1,
            color: Palette.black,
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}

class _ContainerDataHoy extends StatelessWidget {
  const _ContainerDataHoy({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context, listen: true).listBooking;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListView.separated(
            separatorBuilder: (context, index) {
              if (index <= 2) {
                return const SizedBox(height: 7);
              } else {
                return const SizedBox();
              }
            },
            itemCount: bloc.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index <= 2) {
                return _ItemListCardHome(
                  obj: bloc[index],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          if (bloc.length > 3)
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  MyText(
                    text: 'Mostrar más',
                    color: Palette.blue4,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Palette.blue5,
                    child: Icon(Icons.arrow_forward_ios_sharp, size: 17),
                  )
                ],
              ),
              onTap: onTap,
            ),
          const MySizedBoxHeight(),
        ],
      ),
    );
  }
}

class _ItemListCardHome extends StatelessWidget {
  final BookingHome obj;
  const _ItemListCardHome({
    Key? key,
    required this.obj,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyText(
            text: obj.initialTime,
            color: Palette.blue4,
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: obj.serviceDescription ?? '',
                maxLines: 2,
                color: Palette.blue4,
              ),
              MyText(
                text: obj.name ?? '',
                maxLines: 2,
                color: Palette.blue4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
