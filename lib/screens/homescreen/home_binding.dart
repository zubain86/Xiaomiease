
import 'package:get/get.dart';

import '../../controllers/invoices_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AllInvoiceController(), permanent: true);
  }
}
