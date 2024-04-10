import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/kid/kid_controller.dart';

class KidView extends GetWidget<KidController> {
  const KidView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          alignment: Alignment.center,
          child: const Text('Kid'),
        ),
      ),
    );
  }
}
