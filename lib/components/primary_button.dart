import 'package:flutter/material.dart';
import 'package:flutter_firebase/theme/theme_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrimaryButton extends HookConsumerWidget {
  const PrimaryButton({
    required this.onTap,
    required this.buttonText,
    this.isEnabled = true,
    this.bgColor,
    this.textColor,
    this.disableColor,
    this.iconColor,
    this.textWeight,
    this.prefixIcon = '',
    this.suffixIcon = '',
    super.key,
  });

  final String buttonText;
  final Function() onTap;
  final bool isEnabled;
  final Color? bgColor;
  final Color? textColor;
  final Color? disableColor;
  final Color? iconColor;
  final FontWeight? textWeight;
  final String prefixIcon;
  final String suffixIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeColorsProvider);
    return ElevatedButton(
      // TODO: Disable button if isEnabled is false
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: null,
        foregroundColor: colors.buttonTxtColor,
        // backgroundColor: isEnabled ? bgColor ?? colors.primary : disableColor ?? colors.buttonDisableColor,
        backgroundColor: colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.5.r),
        ),
      ),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon.isNotEmpty)
              SvgPicture.asset(
                prefixIcon,
                width: 20.h,
                height: 20.h,
              ),
            if (prefixIcon.isNotEmpty) SizedBox(width: 6.h),
            Expanded(
              flex: 0,
              child: Text(
                textAlign: TextAlign.center,
                buttonText,
                style: TextStyle(
                  color: textColor ?? colors.buttonTxtColor,
                  fontSize: 16.h,
                  fontWeight: textWeight ?? FontWeight.w600,
                ),
              ),
            ),
            if (suffixIcon.isNotEmpty) SizedBox(width: 10.h),
            if (suffixIcon.isNotEmpty)
              SvgPicture.asset(
                suffixIcon,
                width: 15.h,
                height: 20.25.h,
              ),
          ],
        ),
      ),
    );
  }
}
