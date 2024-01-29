import 'dart:async';
import 'package:digiblocks/views/data/models/flight_details_model.dart';
import 'package:digiblocks/views/module/flight_module/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

import '../../core/utils/responses.dart';

class FlightController extends GetxController {
  TextEditingController nationality = TextEditingController();
  TextEditingController inssuing_country = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController expiry = TextEditingController();
  TextEditingController expiry_card = TextEditingController();
  RxBool loading = true.obs;
  Responses _responses = Responses();
  List<dynamic> flight = [].obs;
  List<FlightDetailModel>? airline = <FlightDetailModel>[].obs;
  FlightDetailModel? flightDetailModel;

  Future<void> delayedMove({int milli = 2000, String? to}) async {
    await Future.delayed(Duration(milliseconds: milli));
    loading.value = false;
  }

  getFlight() async {
    loading.value = true;
    print('i was caalled');
    _responses = await FlightRepository.getFlight();
    if (_responses.statusCode == '200') {
      flight.assignAll(_responses.data['response']);

      for (final i in flight) {
        getAirline(i);
      }
      loading.value = false;
    } else {
      loading.value = false;
      Get.snackbar(_responses.message ?? 'Error', _responses.data ?? 'Error',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 5));
    }
  }

  getAirline(data) async {
    loading.value = true;

    _responses = await FlightRepository.getAirline(data['airline_iata']);
    if (_responses.statusCode == '200') {
      airline!.add(FlightDetailModel(
          data['dep_iata'] + ' - ' + data['arr_iata'],
          DateFormat('HH:MM').format(DateTime.parse(data['dep_time'])) +
              ' - ' +
              DateFormat('HH-MM').format(DateTime.parse(data['arr_time'])),
          DateFormat('EEEE, d MMM').format(DateTime.parse(data['dep_time'])),
          _responses.data['response'][0]['name'],
          '\$ 100'));
    } else {
      loading.value = false;
      Get.snackbar(_responses.message ?? 'Error', _responses.data ?? 'Error',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 5));
    }
  }
}
