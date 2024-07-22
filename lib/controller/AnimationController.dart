import 'package:get/get.dart';

import 'ModelViewerController.dart';

class AnimationCController extends GetxController {
  final ModelViewerController modelController = Get.put(ModelViewerController());

  var angleX = 0.0.obs;
  var angleY = 0.0.obs;
  var angleZ = 0.0.obs;

  void startAnimation() {
    // print("Animation started");
    everAll([angleX, angleY, angleZ], (_) {
      // print("Angles updated: X=${angleX.value}, Y=${angleY.value}, Z=${angleZ.value}");
      Get.find<ModelViewerController>().rotateModel(angleX.value, angleY.value, angleZ.value);
    });

    Future.doWhile(() async {
      await Future.delayed(Duration(milliseconds: 16));
      angleX.value += 10.01;
      angleY.value += 10.01;
      angleZ.value += 10.01;
      return true;
    });
  }


}
