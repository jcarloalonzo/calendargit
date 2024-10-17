import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerCustom {
  const BarcodeScannerCustom._();
  static Future<String?> getQR() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    if (barcodeScanRes == '-1') return null;
    return barcodeScanRes;
  }
}
