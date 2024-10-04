import 'package:calculater/constants/colors.dart';
import 'package:calculater/controller/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final MainScreenController _ctrl = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: red,
        foregroundColor: white,
        title: const Text('Calculator'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.all(Get.height * 0.02),
                  alignment: Alignment.bottomRight,
                  child: Obx(
                    () => Text(
                      _ctrl.disPlayTxt.value,
                      style: TextStyle(
                          fontSize: Get.height * 0.08,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                calBtn('AC', null, black),
                calBtn('.', null, black),
                calBtn('+', red, white),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              children: [
                calBtn('9', null, black),
                calBtn('8', null, black),
                calBtn('7', null, black),
                calBtn('/', red, white),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              children: [
                calBtn('6', null, black),
                calBtn('5', null, black),
                calBtn('4', null, black),
                calBtn('x', red, white),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              children: [
                calBtn('3', null, black),
                calBtn('2', null, black),
                calBtn('1', null, black),
                calBtn('-', red, white),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              children: [
                calBtn('00', null, black),
                calBtn('0', null, black),
                calBtn('=', red, white),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  Widget calBtn(
    String btnVal,
    Color? bgColor,
    Color? fgColor,
  ) {
    return SizedBox(
      width:
          btnVal != '=' && btnVal != 'AC' ? (Get.width / 4) : (Get.width / 2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size.square(Get.height * 0.09),
            shape: btnVal != '=' && btnVal != 'AC'
                ? const CircleBorder()
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Get.height * 0.03)),
            foregroundColor: fgColor,
            backgroundColor: bgColor,
            side: const BorderSide(width: 2)),
        onPressed: () => _ctrl.addBtnVal(btnVal),
        child: Text(
          btnVal,
          style: TextStyle(fontSize: Get.height * 0.04),
        ),
      ),
    );
  }
}
