import 'package:chattry_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget mobileLayoutScreen;
  final Widget webLayoutScreen;
  const ResponsiveLayout(
      {Key? key,
      required this.mobileLayoutScreen,
      required this.webLayoutScreen})
      : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    // TODO: implement initState
    addData();
    super.initState();
  }

  addData() async {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await _userProvider.updatingUserValue();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return widget.webLayoutScreen;
      } else {
        return widget.mobileLayoutScreen;
      }
    });
  }
}
