import 'package:digiblocks/views/core/theme/color_theme.dart';
import 'package:digiblocks/views/module/dashboard_module/book_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Surface,
        body: SingleChildScrollView(
          child: Column(
            children: [BookScreen()],
          ),
        ));
  }
}
