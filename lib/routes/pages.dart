import 'dart:collection';
import 'package:digiblocks/views/module/flight_module/flight_details.dart';
import 'package:digiblocks/views/module/flight_module/flight_search_screen.dart';
import 'package:digiblocks/views/module/flight_module/view_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../views/module/dashboard_module/dashboard_screen.dart';

part './routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.DASHBOARD, page: () => DashboardScreen()),
    GetPage(name: Routes.FLIGHTSEARCH, page: () => FlightSearch()),
    GetPage(name: Routes.FLIGHTDETAILS, page: () => FlightDetails()),
    
    GetPage(name: Routes.MAPVIEW, page: () => ViewMap()),
  ];
}
