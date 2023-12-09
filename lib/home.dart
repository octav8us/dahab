import 'package:dahab/features/login/domain/user_provider.dart';
import 'package:dahab/features/login/presentation/login_page.dart';
import 'package:dahab/features/scan/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late UserProvider provider;
  late Future<bool?> _isLoggedIn;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of<UserProvider>(context);
    _isLoggedIn = provider.isLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: FutureBuilder(
          future: _isLoggedIn,
          builder: (context, snapShot) {
            return snapShot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : (snapShot.hasError)
                    ? const Center(child: Text('Error'))
                    : (snapShot.data == true)
                        ? ScanScreen()
                        : LoginPage();
          }),
    );
  }
}
