import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/primary_button.dart';
import 'package:flutter_firebase/theme/theme_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/primary_auth_text_field.dart';
import '../routing/app_route.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeColorsProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    // FocusNode textFieldEmail = useFocusNode();
    // FocusNode textFieldPassword = useFocusNode();
    final isButtonEnable = useState(false);

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
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 92.h),
                  Center(
                    child: Image.asset(
                      'assets/logo/logo_tender.png',
                      width: 201.h,
                      height: 201.h,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 25.h,
                      color: colors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Enter following details to login.',
                    style: TextStyle(
                      fontSize: 16.h,
                      color: colors.subTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  PrimaryAuthTextField(
                    textEditingController: emailController,
                    hintText: "Email",
                    prefixIcon: "assets/icons/ic_email.svg",
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 20.h),
                  PrimaryAuthTextField(
                    isPassword: true,
                    textEditingController: passwordController,
                    hintText: "Password",
                    prefixIcon: "assets/icons/ic_password.svg",
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.newline,
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    // onTap: () async {
                    //   await context.pushNamed(AppRoute.forgotPasswordScreen.name);
                    // },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: colors.primary,
                          fontSize: 14.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  PrimaryButton(
                    onTap: () {
                      // context.pushNamed(AppRoute.completeProfileScreen.name);
                    },
                    buttonText: 'Login',
                    isEnabled: isButtonEnable.value,
                  ),
                  const Spacer(),
                  Center(
                    child: SafeArea(
                      child: RichText(
                        text: TextSpan(
                          text: "Don’t have an account? ",
                          style: TextStyle(
                            color: colors.subTextColor,
                            fontSize: 16.h,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: colors.primary,
                                fontSize: 16.h,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () => context.pushNamed(AppRoute.signUpScreen.name),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 49.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
