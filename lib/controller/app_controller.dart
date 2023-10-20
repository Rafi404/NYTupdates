import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AppMainController extends GetxController {
  ///Message toaster
  void toastMessage(context, message) {
    FlutterToastr.show(message, context,
        duration: FlutterToastr.lengthLong, position: FlutterToastr.bottom);
  }
}
