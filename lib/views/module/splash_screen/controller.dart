import 'package:get/get.dart';


import '../../../routes/pages.dart';


class SplashController extends GetxController {
  /// Move from loader to splash after 5 seconds
  Future<void> delayedMove({int milli = 5, String? to}) async {
    await Future.delayed(Duration(seconds: milli));
    print('i was here');
    Get.offAllNamed(to ?? Routes.DASHBOARD);
  }


  @override
  void onInit() {
    super.onInit();
    print('i was here');
    delayedMove();
  }
}