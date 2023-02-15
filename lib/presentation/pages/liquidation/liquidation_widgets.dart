import 'package:calendario/core/config/config.dart';
import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/data/models/entities/liquidation_model.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';

class LiquidationBodyDetails extends StatelessWidget {
  final List<LiquidationDetails> detail;

  const LiquidationBodyDetails({Key? key, required this.detail})
      : super(key: key);

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
  final LiquidationDetails model;

  const _LineDetailLiquidation({Key? key, required this.model})
      : super(key: key);

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
  final num amountCash;
  final num amountTC;
  final num amountZE;

  const LiquidationBottom(
      {Key? key,
      required this.amountCash,
      required this.amountTC,
      required this.amountZE})
      : super(key: key);

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
