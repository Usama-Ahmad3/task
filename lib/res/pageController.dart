import 'package:get/get.dart';

///it is used To control the Tab Bar with getx
class PageValueController extends GetxController {
  RxInt value = 0.obs;
  pageChange(int val) {
    value.value = val;
  }
}
