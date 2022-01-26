import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/get.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

import 'style.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;

  final Widget? widget;
  final TextInputType textInputType;
  const MyInputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            padding: const EdgeInsets.only(right: 14),
            margin: const EdgeInsets.only(top: 8.0),
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                TextFormField(
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  keyboardType: textInputType,
                  cursorColor:
                      Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                  controller: controller,
                  style: sunTileStyle,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: sunTileStyle,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: context.theme.backgroundColor,
                      width: 0,
                    )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: context.theme.backgroundColor,
                      width: 0,
                    )),
                  ),
                ).expand(),
                widget == null ? Container() : Container(child: widget)
              ],
            ),
          )
        ],
      ),
    );
  }
}
