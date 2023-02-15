import 'package:calendario/core/config/Utils.dart';
import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/data/models/entities/booking.dart';
import 'package:calendario/presentation/bloc/main_bloc.dart';
import 'package:calendario/presentation/pages/booking/booking_detail_page/booking_detail_page.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCardItemSchedule extends StatelessWidget {
  final Function()? onTap;
  final Booking obj;
  const ListCardItemSchedule({
    Key? key,
    this.onTap,
    required this.obj,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<MainBloc>(context, listen: true).model;

    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: obj.initialTime!,
                  fontWeight: FontWeight.w700,
                  size: SizeText.text3,
                  color: Palette.black1,
                ),
                const SizedBox(height: 8),
                MyText(
                  text: '  ${obj.finalTime}',
                  fontWeight: FontWeight.w700,
                  color: Palette.gray7,
                  size: SizeText.text4,
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Palette.black,
            thickness: 1.5,
            width: 5,
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 2,
                  child: ClipPath(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: MyUtils.statusColor(obj.bookingStateId!),
                                  width: 8))),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 7),
                                MyText(
                                  text: obj.serviceDescription ?? '',
                                  maxLines: 2,
                                  size: SizeText.text3 - 1,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(height: 7),
                                MyText(
                                  text: obj.name ?? '',
                                  size: SizeText.text5,
                                  maxLines: 2,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(height: 7),
                                MyText(
                                  text: 'Especialista: ${bloc?.name ?? ''}',
                                  maxLines: 2,
                                  size: SizeText.text5,
                                  color: Palette.blue1,
                                ),
                                const SizedBox(height: 7),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ),
              onTap: () => Navigator.pushNamed(
                  context, BookingDetailPage.routeName,
                  arguments: obj),
            ),
          ),
        ],
      ),
    );
  }

  //    // await ScheduleMethods.dialogEditSchedule( context, obj);
  //
  //

}

class NoCitasContainer extends StatelessWidget {
  const NoCitasContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      child: Center(
        child: MyText(
          text: 'No hay citas para este día.',
          color: Palette.black1,
          size: SizeText.text5 + 1,
        ),
      ),
    );
  }
}
// 
// 
// 
// 
// 
// 
// 

class ItemTextColumn extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final Color colorIcon;
  final IconData icono;
  const ItemTextColumn({
    Key? key,
    this.onTap,
    required this.title,
    required this.colorIcon,
    required this.icono,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icono,
            color: colorIcon,
            size: 35,
          ),
          MyText(
            size: SizeText.text5,
            maxLines: 3,
            fontWeight: FontWeight.w600,
            text: title,
          ),
        ],
      ),
    );
  }
}


// 
// 
// 
// 
// 
// 
 