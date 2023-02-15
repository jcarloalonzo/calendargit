// ignore_for_file: prefer_const_constructors

import 'package:calendario/core/config/Utils.dart';
import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_call_super

class InvoiceFreeDetail extends StatefulWidget {
  const InvoiceFreeDetail({Key? key}) : super(key: key);

  @override
  State<InvoiceFreeDetail> createState() => _NewInvoiceDetailState();
}

class _NewInvoiceDetailState extends State<InvoiceFreeDetail>
    with AutomaticKeepAliveClientMixin<InvoiceFreeDetail> {
  @override
  Widget build(BuildContext context) {
    // final bloc = Provider.of<ProductService>(context, listen: true);

    return Scaffold(
        backgroundColor: Palette.backgroundColor,
        bottomNavigationBar: _BottomNavigatorBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //
            // Navigator.pushNamed(context, AddProductInvoice.routeName);

            // Provider.of<ProductService>(context, listen: false).limpia();

            // Navigator.pushNamed(
            //   context,
            //   AddItemProduct.routeName,
            // );
          },
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
        ),
        body: _NoProductInfo());
  }

  @override
  bool get wantKeepAlive => true;
}

class _NoProductInfo extends StatelessWidget {
  const _NoProductInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        width: double.infinity,
        // height: 200,
        child: Center(
            child: const MyText(
          text: 'Agrege un nuevo producto',
          color: Colors.black,
          fontWeight: FontWeight.w700,
          size: SizeText.text3,
        )));
  }
}

class _BottomNavigatorBar extends StatelessWidget {
  const _BottomNavigatorBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: MediaQuery.of(context).size.height * 0.07,
      color: Palette.white,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                MyText(
                  text: '# Items: ',
                  color: Palette.gray3,
                  fontWeight: FontWeight.w700,
                ),
                MyText(
                  text: '2',
                  color: Palette.gray1,
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     MyText(
                //       text: 'Descuento: ',
                //       color: Palette.grey1,
                //       fontWeight: FontWeight.w700,
                //     ),
                //     MyText(
                //       fontWeight: FontWeight.w800,
                //       color: Palette.grey1,
                //       text: MyUtilsformatPrice(0),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: 'Total Venta: ',
                      fontWeight: FontWeight.w700,
                      color: Palette.gray1,
                    ),
                    MyText(
                      fontWeight: FontWeight.w800,
                      color: Palette.gray1,
                      text: MyUtils.formatPrice(10),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
