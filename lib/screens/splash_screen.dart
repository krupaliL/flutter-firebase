import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../routing/app_route.dart';
import '../theme/theme_provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeColorsProvider);

    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        context.goNamed(AppRoute.loginScreen.name);
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: Image.asset(
          'assets/logo/logo_tender.png',
          width: 201.h,
          height: 201.h,
        ),
      ),
    );
  }
}
