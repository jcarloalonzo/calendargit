import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/presentation/pages/agent/schedule_reservation_free/schedule_reservation_bloc.dart';
import 'package:calendario/presentation/search/search_client.dart';
import 'package:calendario/presentation/search/search_service.dart';
import 'package:calendario/presentation/widgets/my_card_container.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:calendario/presentation/widgets/mysizedbox.dart';
import 'package:calendario/presentation/widgets/textfield_general.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class ScheduleReservationFreeBody extends StatefulWidget {
  const ScheduleReservationFreeBody({
    Key? key,
    this.date,
  }) : super(key: key);
  final String? date;

  @override
  State<ScheduleReservationFreeBody> createState() =>
      _ScheduleReservationFreeBodyState();
}

class _ScheduleReservationFreeBodyState
    extends State<ScheduleReservationFreeBody> {
  final TextEditingController _priceController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleReservationBloc>(context, listen: true);
    return Column(
      children: [
        MyCardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextFieldContainer(
                isEnabled: false,
                title: 'Especialista',
                isObscure: true,
                controller:
                    TextEditingController(text: bloc.dataLogin?.name ?? ''),
              ),
              const MySizedBoxHeight(),
              MyTextFieldContainer(
                title: 'Servicio',
                hintText: 'Seleccione servicio',
                controller: TextEditingController(
                    text: bloc.serviceSelected?.description ?? ''),
                isEnabled: false,
                onTap: () async {
                  var x = await showSearch(
                    context: context,
                    delegate: SearchService(bloc.listService),
                  );
                  if (x != null) {
                    bloc.serviceSelected = x;
                    var s = await bloc.getPriceRequest(d: widget.date);
                    if (s != null) {
                      setState(() {
                        bloc.setPriceService(s);
                        _priceController.text = s.toString();
                      });
                    }
                  }
                },
              ),
              const MySizedBoxHeight(),
              Row(
                children: [
                  const MyText(
                    text: 'Fecha: ',
                    color: Palette.black2,
                  ),
                  MyText(
                    text: Jiffy(widget.date).format('dd/MM/yyyy'),
                    color: Palette.black2,
                  ),
                ],
              ),
              const MySizedBoxHeight(),
              Row(
                children: [
                  Expanded(
                    child: MyTextFieldContainer(
                      //
                      isEnabled: false,
                      title: 'Hora reserva',
                      hintText: TimeOfDay.now().format(context),
                      controller: TextEditingController(
                          text: Jiffy(widget.date).format('HH:mm')),
                      // onTap: () async {
                      //   String time =
                      //       await MyUtilsselectTimeMethod(context: context);
                      //   if (time.isNotEmpty) bloc.time = time;
                      // },
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: MyTextFieldContainer(
                      //
                      isObscure: true,
                      title: 'Duración en horas',
                      controller: TextEditingController(
                          text: bloc.serviceSelected?.time ?? ''),
                    ),
                  ),
                ],
              ),
              const MySizedBoxHeight(),
              Row(
                children: [
                  Expanded(
                    child: MyTextFieldContainer(
                      isObscure: true,
                      isEnabled: false,
                      title: 'Hora final aprox.',
                      controller: TextEditingController(
                          text: bloc.getHourFinal(widget.date!) ?? ''),
                      // hintText: TimeOfDay.now().format(context),
                      // controller: TextEditingController(text: bloc.time ?? ''),
                      // onTap: () async {
                      //   String time =
                      //       await MyUtilsselectTimeMethod(context: context);
                      //   if (time.isNotEmpty) bloc.time = time;
                      // },
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: MyTextFieldContainer(
                      controller: _priceController,
                      title: 'Costo del servicio',
                      onChanged: (s) {
                        if (s.isNotEmpty) {
                          bloc.setPriceService(num.parse(s));
                        } else {
                          bloc.setPriceService(num.parse('0'));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const MySizedBoxHeight(),
        MyCardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  MyText(
                    text: 'Cliente',
                    color: Palette.black2,
                    size: SizeText.text4,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.person_add_alt_1,
                    color: Palette.green1,
                  )
                ],
              ),
              const MySizedBoxHeight(),
              MyTextFieldContainer(
                title: 'Cliente',
                hintText: 'Seleccione cliente',
                controller: TextEditingController(
                    text: bloc.clientSelected?.name ?? ''),
                isEnabled: false,
                onTap: () async {
                  var x = await showSearch(
                    context: context,
                    delegate: SearchClient(bloc.listClient),
                  );
                  if (x != null) bloc.clientSelected = x;
                },
              ),
              const MySizedBoxHeight(),
              MyTextFieldContainer(
                title: 'Telefono',
                isEnabled: false,
                hintText: 'Ingrese nro. de telefono',
                controller: TextEditingController(
                    text: bloc.clientSelected?.phoneNumber ?? ''),
              ),
              const MySizedBoxHeight(),
              MyTextFieldContainer(
                title: 'Email',
                isEnabled: false,
                hintText: 'Ingrese email',
                controller: TextEditingController(
                    text: bloc.clientSelected?.emailAddress ?? ''),
              ),
              const MySizedBoxHeight(),
              const MyTextFieldContainer(
                title: 'Comentarios',
                hintText: 'Comentarios adicionales',
                maxLines: 9,
                minLines: 3,
              ),
            ],
          ),
        ),
        const MySizedBoxHeight(),
      ],
    );
  }
}
