import 'package:dahab/core/utilities/route_names.dart';
import 'package:dahab/core/utilities/widgets/custom_elevated_button.dart';
import 'package:dahab/features/jewellry/presentation/jewelry_details_page.dart';
import 'package:dahab/features/login/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class ScanScreen extends StatefulWidget {
  ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

String _scanBarcode = 'Unknown';
bool _foundResult = false;

class _ScanScreenState extends State<ScanScreen> {
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
      if (!mounted) return;

      setState(() {
        barcodeScanRes != '-1' ? _foundResult = true : _foundResult = false;

        _scanBarcode = barcodeScanRes;
      });
    } catch (e) {
      barcodeScanRes = 'Failed : ${e.toString()}';

      if (!mounted) return;

      setState(() {
        _foundResult = false;
        _scanBarcode = barcodeScanRes;
      });
    }
  }

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(),
        body: Builder(
          builder: (BuildContext context) {
            return Container(
                alignment: Alignment.center,
                child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      (_foundResult)
                          ? JewelryDetailsPage(
                              productID: _scanBarcode,
                            )
                          : const SizedBox.shrink(),
                      CustomElevatedButton(
                        onPressed: () {
                          scanBarcodeNormal();
                        },
                        text: 'افحص الباركود',
                      ),
                      //  (_foundResult)
                      //       ?  Text('رقم الباركود : $_scanBarcode\n',
                      //       style: TextStyle(fontSize: 20)): const SizedBox.shrink(),
                      (_foundResult)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomElevatedButton(
                                    onPressed: () {
                                      ///
                                    },
                                    text: 'اضافة الى الفاتورة'),
                                CustomElevatedButton(
                                  onPressed: () {
                                    // Navigator.of(context).pushNamed(
                                    //     RouteNames.detailsPage,
                                    //     arguments: _scanBarcode);
                                  },
                                  text: 'معلومات اكثر',
                                  color: Colors.white,
                                  textStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ]));
          },
        ),
      ),
    );
  }

  AppBar customAppBar() {
    return AppBar(
      title: const Text('الباركود'),
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(
                child: const Text('تسجيل الخروج'),
                onTap: () async {
                  await Provider.of<UserProvider>(context, listen: false)
                      .logOut()
                      .then((value) => Navigator.of(context).pushReplacementNamed(
                            RouteNames.homePage,
                          ));
                }),
          ],
        )
      ],
    );
  }
}
