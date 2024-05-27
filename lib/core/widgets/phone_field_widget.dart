/*
 * Copyright (c) 2022 .
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:realstateAdmin/core/resources/app_colors.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget(
      {Key? key,
      this.onSaved,
      this.onChanged,
      this.initialValue,
      this.hintText,
      this.errorText,
      this.labelText,
      this.obscureText,
      this.suffixIcon,
      this.isFirst,
      this.isLast,
      this.style,
      this.textAlign,
      this.validator,
      this.suffix,
      this.initialCountryCode,
      this.countries})
      : super(key: key);

  final FormFieldSetter<PhoneNumber>? onSaved;
  final ValueChanged<PhoneNumber>? onChanged;
  final String? initialValue;
  final String? hintText;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final String? errorText;
  final TextAlign? textAlign;
  final String? labelText;
  final TextStyle? style;
  final bool? obscureText;
  final String? initialCountryCode;
  final List<String>? countries;
  final bool? isFirst;
  final bool? isLast;
  final Widget? suffixIcon;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 14, left: 20, right: 20),

      margin: EdgeInsets.only(
          top: topMargin, bottom: 20),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Get.theme.focusColor.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5)),
          ],
          border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            labelText ?? "",
            style: Get.textTheme.bodyLarge,
            textAlign: textAlign,
          ),
          IntlPhoneField(
              key: key,
              validator: validator,
              onSaved: onSaved,
              onChanged: onChanged,
              
              initialValue: initialValue ?? '',
              initialCountryCode: 'DZ' ,
              showDropdownIcon: false,
              pickerDialogStyle:
                  PickerDialogStyle(countryNameStyle: Get.textTheme.bodyMedium),
              style: style,
              textAlign: textAlign ?? TextAlign.start ,
              disableLengthCheck: true,
              autovalidateMode: AutovalidateMode.disabled,
              decoration: InputDecoration(
                hintText: hintText ?? '',
                hintStyle: Get.textTheme.bodySmall,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: const EdgeInsets.all(0),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                suffixIcon: suffixIcon,
                suffix: suffix,
                errorText: errorText,
              )),
        ],
      ),
    );
  }

  BorderRadius get buildBorderRadius {
    if (isFirst != null && isFirst!) {
      return const BorderRadius.vertical(top: Radius.circular(10));
    }
    if (isLast != null && isLast!) {
      return const BorderRadius.vertical(bottom: Radius.circular(10));
    }
    if (isFirst != null && !isFirst! && isLast != null && !isLast!) {
      return const BorderRadius.all(Radius.circular(0));
    }
    return const BorderRadius.all(Radius.circular(10));
  }

  double get topMargin {
    if ((isFirst != null && isFirst!)) {
      return 20;
    } else if (isFirst == null) {
      return 20;
    } else {
      return 0;
    }
  }

  double get bottomMargin {
    if ((isLast != null && isLast!)) {
      return 10;
    } else if (isLast == null) {
      return 10;
    } else {
      return 0;
    }
  }
}
