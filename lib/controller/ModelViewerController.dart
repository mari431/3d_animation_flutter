import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:get/get.dart';

class ModelViewerController extends GetxController {
  late Object model;

  @override
  void onInit() {
    super.onInit();
    model = Object(
      fileName: 'assets/obj/robo/mesh.obj',
      lighting: true,
    );
  }

  void rotateModel(double x, double y, double z) {
    model.rotation.setValues(x, y, z);
    update();
  }
}


class ModelViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModelViewerController>(
      init: ModelViewerController(),
      builder: (controller) {
        return Expanded(
          child: Cube(
            onSceneCreated: (Scene scene) {
              scene.world.add(controller.model);
            },
          ),
        );
      },
    );
  }
}
