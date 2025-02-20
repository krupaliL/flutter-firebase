import 'package:flutter/material.dart';
import 'package:flutter_firebase/theme/theme_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrimaryAuthTextField extends HookConsumerWidget {
  final Function()? eyePress;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final bool isPassword;
  final String hintText;
  final Function(String val)? onChange;
  final TextInputAction textInputAction;
  final String? prefixIcon;
  final String? suffixIcon;

  const PrimaryAuthTextField({
    super.key,
    this.eyePress,
    this.textEditingController,
    this.textInputType,
    this.isPassword = false,
    this.hintText = '',
    this.onChange,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeColorsProvider);
    final isObscureText = useState(isPassword);

    return TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: isObscureText.value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: colors.textColor,
      textInputAction: textInputAction,
      style: TextStyle(
        color: colors.textColor,
        fontSize: 16.h,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: colors.bgTextFieldColor,
        hintText: hintText,
        hintStyle: TextStyle(
          color: colors.hintColor,
          fontSize: 16.h,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 22.h),
                child: SvgPicture.asset(
                  prefixIcon!,
                  colorFilter: ColorFilter.mode(
                    colors.primary,
                    BlendMode.srcIn,
                  ),
                  width: 20.h,
                  height: 20.h,
                ),
              )
            : null,
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  isObscureText.value = !isObscureText.value;
                },
                highlightColor: Colors.transparent,
                icon: SvgPicture.asset(
                  isObscureText.value
                      ? 'assets/icons/ic_eye.svg'
                      : 'assets/icons/ic_eye.svg',
                  width: 20.h,
                  height: 16.h,
                  colorFilter: ColorFilter.mode(
                    colors.hintColor,
                    BlendMode.srcIn,
                  ),
                ),
              )
            : suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Text(
                      '*',
                      style: TextStyle(
                        fontSize: 22.h,
                        color: colors.primary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : null,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          vertical: 22.h,
          horizontal: 25.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.5.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.5.r),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.5.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.5.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
