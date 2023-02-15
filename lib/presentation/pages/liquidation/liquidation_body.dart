import 'package:calendario/core/config/Utils.dart';
import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/presentation/bloc/liquidation_bloc.dart';
import 'package:calendario/presentation/pages/liquidation/liquidation_widgets.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LiquidationBody extends StatelessWidget {
  const LiquidationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LiquidationBloc>(context, listen: true);

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const MyText(
                text: 'Liquidación diaría',
                fontWeight: FontWeight.w400,
                color: Color(0xff223263),
                size: SizeText.text4,
              ),
              const SizedBox(width: 20),
              const Icon(
                Icons.date_range,
                color: Color(0xff223263),
              ),
              const SizedBox(width: 5),
              MyText(
                text: MyUtils.formatDate(DateTime.now()),
                color: const Color(0xff223263),
                size: SizeText.text4,
              ),
            ],
          ),
          const SizedBox(height: 40),
          const MyText(
            text: 'Tiene un total',
            color: Palette.blue,
            fontWeight: FontWeight.w400,
            size: SizeText.text4,
          ),
          MyText(
            text: MyUtils.formatPrice(bloc.liquidationAmount?.amount ?? 0),
            color: Palette.green,
            size: SizeText.text1 + 20,
            fontWeight: FontWeight.w700,
          ),
          const MyText(
            text: 'En su liquidación del día',
            color: Palette.blue,
            fontWeight: FontWeight.w400,
            size: SizeText.text4,
          ),
          const SizedBox(height: 80),
          if (bloc.liquidationDetails.isEmpty)
            const MyText(
              text: 'No tienes ingresos en el día, \nrealiza tu primera venta.',
              textAlign: TextAlign.center,
              color: Palette.blue,
              fontWeight: FontWeight.w400,
              size: SizeText.text4,
            ),
          if (bloc.liquidationDetails.isNotEmpty)
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: LiquidationBodyDetails(
                  detail: bloc.liquidationDetails,
                )),
          if (bloc.liquidationDetails.isNotEmpty)
            Align(
              alignment: Alignment.bottomRight,
              child: LiquidationBottom(
                  amountCash: bloc.liquidationAmount!.amountCash!,
                  amountTC: bloc.liquidationAmount!.amountTC!,
                  amountZE: bloc.liquidationAmount!.amountZelle!),
            ),
        ],
      ),
    );
  }
}
