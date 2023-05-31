import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/Utils.dart';
import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../../data/models/entities/booking.dart';
import '../../../bloc/main_bloc.dart';
import '../../../widgets/my_text.dart';
import '../../booking/booking_detail_page/booking_detail_page.dart';

class ListCardItemSchedule extends StatelessWidget {
  const ListCardItemSchedule({
    Key? key,
    this.onTap,
    required this.obj,
  }) : super(key: key);
  final Function()? onTap;
  final Booking obj;

  @override
  Widget build(BuildContext context) {
    final login = context.read<MainBloc>().login;

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
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color:
                                      MyUtils.statusColor(obj.bookingStateId!),
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
                                  text: 'Especialista: ${login?.name ?? ''}',
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
}
