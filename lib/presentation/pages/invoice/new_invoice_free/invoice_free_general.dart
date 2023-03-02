// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../core/config/Utils.dart';
import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../widgets/my_card_container.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import '../../../widgets/textfield_general.dart';

// ignore_for_file: must_call_super

class InvoiceFreeGeneral extends StatefulWidget {
  const InvoiceFreeGeneral({Key? key}) : super(key: key);

  @override
  State<InvoiceFreeGeneral> createState() => _NewInvoiceGeneralState();
}

class _NewInvoiceGeneralState extends State<InvoiceFreeGeneral>
    with AutomaticKeepAliveClientMixin<InvoiceFreeGeneral> {
  @override
  Widget build(BuildContext context) {
    // final loginServices = Provider.of<LoginService>(context, listen: false);
    // final companyService = Provider.of<CompanyService>(context, listen: true);
    // final facturaService = Provider.of<FacturaService>(context, listen: true);

    return Container(
      color: Palette.backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const MySizedBoxHeight(),
            _CardCabecera(),
            MySizedBoxHeight(),
            _CardClient(),
            MySizedBoxHeight(),
            _CardInvoice(),
            MySizedBoxHeight(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _CardInvoice extends StatelessWidget {
  const _CardInvoice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      child: Column(
        children: [
          //
          //
          const MySizedBoxHeight(),
          MyTextFieldContainer(
            title: 'Invoice',
            isEnabled: false,
            controller: TextEditingController(text: '00000'),
          ),
          const MySizedBoxHeight(),
          Row(
            children: [
              MyTextFieldContainer(
                isEnabled: false,
                controller: TextEditingController(
                    text: MyUtils.formatDate(DateTime.now())),
                title: 'Fecha Invoice',
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  String date =
                      await MyUtils.selectDateMethod(context: context);

                  if (date.isEmpty) {
                    return;
                  } else {}
                },
              ),
            ],
          ),
          MySizedBoxHeight(),

          MySizedBoxHeight(),
          MyTextFieldContainer(
            isEnabled: false,
            title: 'Vendedor',
            controller: TextEditingController(text: 'Juan Portocarrero'),
          ),
        ],
      ),
    );
  }
}

class _CardClient extends StatelessWidget {
  const _CardClient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      child: Column(
        children: [
          MyTextFieldContainer(
            isEnabled: false,
            title: 'Cliente',
            onTap: () {},
            hintText: 'Seleccionar Cliente',
          ),
          Column(
            children: [
              MySizedBoxHeight(),
              MyTextFieldContainer(
                isEnabled: false,
                title: 'Dirección de envio',
                controller: TextEditingController(text: ''),
              ),
              MySizedBoxHeight(),
              MyTextFieldContainer(
                isEnabled: false,
                title: 'Contacto',
                // controller: TextEditingController(
                //     text: companyService.companySeleccionado?.companyName ??
                //         ''),
              ),
              MySizedBoxHeight(),
            ],
          )
        ],
      ),
    );
  }
}

class _CardCabecera extends StatelessWidget {
  const _CardCabecera({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      child: Column(
        children: [
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              MyText(
                text: 'Empresa: ',
                fontWeight: FontWeight.w400,
                color: Palette.blue,
              ),
              MyText(
                text: 'KASHIABEAUTY SA',
                color: Palette.blue,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          MySizedBoxHeight(),
          Row(
            children: [
              Expanded(
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const MyText(
                      text: 'Oficina: ',
                      fontWeight: FontWeight.w400,
                      size: SizeText.text6,
                      color: Palette.blue,
                    ),
                    Expanded(
                      child: MyText(
                        text: 'Oficina principal',
                        color: Palette.blue,
                        size: SizeText.text6 + 1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              //

              Expanded(
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    MyText(
                      text: 'Almacén: ',
                      fontWeight: FontWeight.w400,
                      color: Palette.blue,
                      size: SizeText.text6 + 1,
                    ),
                    Expanded(
                      child: MyText(
                        text: 'Almacén principal',
                        color: Palette.blue,
                        size: SizeText.text6 + 1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
