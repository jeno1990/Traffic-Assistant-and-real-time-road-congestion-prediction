import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Tabcontroller extends GetxController with SingleGetTickerProviderMixin{
 late TabController? controller;
  
  @override
  void onInit() {
    // TODO: implement onInit
    controller = TabController(length: 3 , vsync: this );
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    controller!.dispose();
    super.onClose();
  }
}