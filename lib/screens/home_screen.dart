import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:get/get.dart';

import '../controller/AnimationController.dart';
import '../controller/ModelViewerController.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final AnimationCController animationController =
      Get.put(AnimationCController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.black,
      appBar: _AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GetBuilder<ModelViewerController>(
            init: ModelViewerController(),
            builder: (controller) {
              return Stack(
                children: [
                  Center(
                    child: Container(height: 600, child: ModelViewer()),
                  ),
                  Positioned(
                    top: 10,
                    // left: 200,
                    child: Container(
                      width: 415,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          'https://github.com/mari431',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )

          // ModelViewer(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     animationController.startAnimation();
      //   },
      //   child: Icon(Icons.play_arrow),
      // ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSize {
  static const IconData heart = IconData(0xf442);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // clipBehavior: Clip.none,
      title: Text('3D-Animation'),
      actions: [],

      elevation: 0, // Remove the default elevation
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(4.0), // Adjust the height as needed
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            color: Colors.transparent, // Set color to transparent
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(1),
                spreadRadius: 0.1,
                blurRadius: 15,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
