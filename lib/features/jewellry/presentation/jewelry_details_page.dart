import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dahab/core/network/api_constants.dart';
import 'package:dahab/core/utilities/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class JewelryDetailsPage extends StatelessWidget {
  JewelryDetailsPage({super.key, required this.productID});
  final String productID;

  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>> _getProductDetails() async {
      final connectivityResult =
          await getIt<Connectivity>().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'لا يوجد اتصال بالانترنت',
            textAlign: TextAlign.center,
          ),
        ));
        throw const FormatException('No Internet');
      } else {
        final response = await getIt<http.Client>.call()
            .get(Uri.https(ApiConstants.BASE_URL));
        return jsonDecode(response.body);
      }
    }

    return FutureBuilder(
      future: _getProductDetails(),
      builder: (context, snapshot) => Center(
        child: snapshot.hasError
            ? const Text("يوجد مشكلة في الاتصال بالانترنت")
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15)
                        .r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ResultText(text: "الكود"),
                        ResultText(text: productID),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ResultText(text: "العيار"),
                        ResultText(
                            text: snapshot.hasData
                                ? snapshot.data!['Karet'].toString()
                                : 'Loading...'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ResultText(text: "النوع"),
                        ResultText(
                            text: snapshot.hasData
                                ? snapshot.data!['type'].toString()
                                : 'Loading...'),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class ResultText extends StatelessWidget {
  const ResultText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ));
  }
}
