import 'package:calendario/core/config/palette.dart';
import 'package:calendario/presentation/pages/invoice/new_invoice_free/invoice_free_detail.dart';
import 'package:calendario/presentation/pages/invoice/new_invoice_free/invoice_free_general.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';

// final loginServices = Provider.of<LoginService>(context, listen: false);
// loginServices.loginUserDataModelResponseApi
class InvoiceFreePage extends StatefulWidget {
  static String routeName = "/InvoiceFreePage";

  @override
  State<InvoiceFreePage> createState() => _InvoiceFreePageState();
}

class _InvoiceFreePageState extends State<InvoiceFreePage> {
  @override
  void initState() {
    super.initState();

    try {
      Future.delayed(Duration.zero, () async {
        // final loginService = Provider.of<LoginService>(context, listen: false);
        // final facturaService =
        //     Provider.of<FacturaService>(context, listen: false);
        // final productService =
        //     Provider.of<ProductService>(context, listen: false);

        // productService.disposeNewInvoice();
        // await facturaService.initNewInvoice(
        //     loginOBJ: loginService.loginUserDataModelResponseApi);
      });
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    // final bloc = Provider.of<FacturaService>(context, listen: true);
    // final blocProduct = Provider.of<ProductService>(context, listen: true);
    // final company =
    //     Provider.of<CompanyService>(context, listen: true).companySeleccionado;

    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 500),
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Palette.colorApp,
          toolbarHeight: 60,
          centerTitle: true,
          title: const MyText(
            text: 'Registrar invoice',
            color: Colors.white,
            fontWeight: FontWeight.w700,
            size: 22,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.save,
                color: Palette.white,
              ),
              onPressed: () async {
                // if ((blocProduct.listaProductoTemporal.isEmpty) ||
                //     (company == null)) {
                //   await MyDialogs.yesAbortDialog(
                //       context: context,
                //       title: 'Atención',
                //       body: 'Ingrese productos y/o seleccione empresa',
                //       onlyButtom: true);
                //   return;
                // }
                // blocProduct.calculateSubTotalTax(company, bloc.listaTax);
                // return saveMethodDialog(context);
              },
            ),
          ],
          bottom: TabBar(
            indicatorWeight: 4,
            labelColor: Colors.white,
            labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: "General".toUpperCase(),
              ),
              Tab(
                text: "Detalle".toUpperCase(),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InvoiceFreeGeneral(),
            InvoiceFreeDetail(),
          ],
        ),
      ),
    );
  }
}
