import 'package:flutter/material.dart';
import 'package:flutter_firebase/theme/theme_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/primary_auth_text_field.dart';
import '../components/primary_button.dart';
import '../routing/app_route.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeColorsProvider);
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    // FocusNode textFieldEmail = useFocusNode();
    // FocusNode textFieldPassword = useFocusNode();
    final isButtonEnable = useState(true);

    bool isEmailValid(String email) {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
      return emailRegex.hasMatch(email);
    }

    // Password validation function
    bool isPasswordValid(String password) {
      return password.length >= 6; // Example: Minimum 6 characters
    }

    void updateButtonState() {
      isButtonEnable.value = firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty &&
          isEmailValid(emailController.text) &&
          isPasswordValid(passwordController.text);
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 72.h),
                  Center(
                    child: Image.asset(
                      'assets/logo/logo_tender.png',
                      width: 121.h,
                      height: 121.h,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'Tell us about\nYourself!',
                    style: TextStyle(
                      fontSize: 30.h,
                      color: colors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Let’s get to know each other',
                    style: TextStyle(
                      fontSize: 16.h,
                      color: colors.subTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  PrimaryAuthTextField(
                    textEditingController: firstNameController,
                    hintText: "First Name",
                    prefixIcon: "assets/icons/ic_profile.svg",
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onChange: (val) {
                      updateButtonState();
                    },
                  ),
                  SizedBox(height: 20.h),
                  PrimaryAuthTextField(
                    textEditingController: lastNameController,
                    hintText: "Last Name",
                    prefixIcon: "assets/icons/ic_profile.svg",
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onChange: (val) {
                      updateButtonState();
                    },
                  ),
                  SizedBox(height: 20.h),
                  PrimaryAuthTextField(
                    textEditingController: emailController,
                    hintText: "Email",
                    prefixIcon: "assets/icons/ic_email.svg",
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChange: (val) {
                      updateButtonState();
                    },
                  ),
                  SizedBox(height: 20.h),
                  PrimaryAuthTextField(
                    isPassword: true,
                    textEditingController: passwordController,
                    hintText: "Password",
                    prefixIcon: "assets/icons/ic_password.svg",
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.newline,
                    onChange: (val) {
                      updateButtonState();
                    },
                  ),
                  SizedBox(height: 50.h),
                  PrimaryButton(
                    onTap: () {
                      context.pushNamed(AppRoute.addressScreen.name);
                    },
                    buttonText: 'Continue',
                    isEnabled: isButtonEnable.value,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
