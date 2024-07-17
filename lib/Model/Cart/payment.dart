import 'package:barcode/barcode.dart';

class PaymentFunctions {
  String createBarcode() {
    final bar = Barcode.qrCode();
    //hardcoded for now to test
    final svg = bar.toSvg("ilham@gmail.com", width: 300, height: 100);
    return svg;
  }
}
