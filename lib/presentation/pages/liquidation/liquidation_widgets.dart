import 'package:flutter/material.dart';

import '../../../core/config/config.dart';
import '../../../core/config/palette.dart';
import '../../../core/config/size_text.dart';
import '../../../data/models/entities/liquidation_model.dart';
import '../../widgets/my_text.dart';

class LiquidationBodyDetails extends StatelessWidget {
  const LiquidationBodyDetails({Key? key, required this.detail})
      : super(key: key);
  final List<LiquidationDetails> detail;

  @override
  Widget build(BuildContext context) {
    List<Widget> data = [];

    for (var i = 0; i < detail.length; i++) {
      data.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: _LineDetailLiquidation(model: detail[i]),
      ));
    }
    return SingleChildScrollView(child: Column(children: data));
  }
}

class _LineDetailLiquidation extends StatelessWidget {
  const _LineDetailLiquidation({Key? key, required this.model})
      : super(key: key);
  final LiquidationDetails model;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MyText(
          text: 'IV-${model.invoice!}',
          color: Palette.gray1,
          fontWeight: FontWeight.w400,
          size: SizeText.text3 - 5,
        ),
        const SizedBox(
          width: 10,
        ),
        MyText(
          text: model.state == 1 ? 'OK' : 'AN',
          color: model.state == 1 ? Palette.green1 : Colors.red,
          fontWeight: FontWeight.w400,
          size: SizeText.text3 - 5,
        ),
        const SizedBox(
          width: 10,
        ),
        MyText(
          text: model.payment!,
          color: Palette.gray1,
          fontWeight: FontWeight.w400,
          size: SizeText.text3 - 5,
        ),
        const SizedBox(
          width: 10,
        ),
        MyText(
          text: Config.formatPrice(model.amount!),
          color: Palette.gray1,
          fontWeight: FontWeight.w400,
          size: SizeText.text3 - 5,
        ),
      ],
    );
  }
}

class LiquidationBottom extends StatelessWidget {
  const LiquidationBottom(
      {Key? key,
      required this.amountCash,
      required this.amountTC,
      required this.amountZE})
      : super(key: key);
  final num amountCash;
  final num amountTC;
  final num amountZE;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          width: 10,
        ),
        _RowLiqDetail(textline: 'Total Cash:', amount: amountCash),
        const SizedBox(
          width: 10,
        ),
        _RowLiqDetail(textline: 'Total TC:', amount: amountTC),
        const SizedBox(
          width: 10,
        ),
        _RowLiqDetail(textline: 'Total Zelle:', amount: amountZE),
      ],
    );
  }
}

class _RowLiqDetail extends StatelessWidget {
  const _RowLiqDetail({
    Key? key,
    required this.textline,
    required this.amount,
  }) : super(key: key);

  final num amount;
  final String textline;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 5,
          child: MyText(
            text: textline,
            color: Palette.gray1,
            fontWeight: FontWeight.w400,
            size: SizeText.text3 - 5,
          ),
        ),
        Expanded(
          flex: 8,
          child: MyText(
            text: '${Config.formatPrice(amount)}',
            color: Palette.gray1,
            fontWeight: FontWeight.w400,
            size: SizeText.text3 - 5,
          ),
        ),
      ],
    );
  }
}
