

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_image_picker11/image_picker_controller.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //getx with controller create , initialise
  ImagePickerController controller = Get.put(ImagePickerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar:  AppBar(
        title: Text('Getx Tutorials'),
      ),
      body: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                  radius: 40,
                  backgroundImage: controller.imagePath.isNotEmpty ?
                  FileImage(File(controller.imagePath.toString()))    :
                  null
              ),
            ),
            TextButton(onPressed: (){
              controller.getImage();
            }, child: Text('Pick Image'))
          ],
        );
      }
      ),
    );
  }
}
