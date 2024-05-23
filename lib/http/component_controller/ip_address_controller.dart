import 'package:dart_ipify/dart_ipify.dart';
import 'package:get/get.dart';

class IpAddressController extends GetxController {
  var ipAdressv = "".obs;

  @override
  void onInit() {
    super.onInit();
    getIPAddress();
  }

  Future<void> getIPAddress() async {
    try {
      String ipAddress = await Ipify.ipv4();
      ipAdressv.value = ipAddress;
    } catch (e) {
      print('Failed to get IP address: $e');
    }
  }
}
