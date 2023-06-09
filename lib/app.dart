import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:roommate/blocs/app_cubit/auth_cubit.dart';
import 'package:roommate/blocs/app_cubit/auth_state.dart';
import 'package:roommate/blocs/localization/localization_cubit.dart';
import 'package:roommate/core/constants/cubit_providers_list.dart';
import 'package:roommate/core/theme/theme.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/profile/profile_model.dart';
import 'package:roommate/ui/screens/home/home_screen.dart';
import 'package:roommate/ui/screens/profile/profile_screen.dart';
import 'package:roommate/ui/screens/splash/splash_screen.dart';
import 'core/navigation/router.dart' as router;

final logger = Logger(
  printer: PrettyPrinter(
    lineLength: 90,
    methodCount: 0,
  ),
);

class RoommateApp extends StatelessWidget {


  const RoommateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: CubitProvidersList.providerList,
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return BlocListener<AuthCubit, AuthState>(
                listener: (context, state) =>
                    context.read<AuthCubit>().handleRedirectScreen(state),
                child: MaterialApp(
                  navigatorKey: navigatorKey,
                  builder: EasyLoading.init(),
                  debugShowCheckedModeBanner: false,
                  theme: Themes().buildThemeData(
                      isArabic: context
                              .watch<LocalizationCubit>()
                              .state
                              .languageCode ==
                          'ar'),
                  home: (SplashScreen()),
                  locale:  context.watch<LocalizationCubit>().state,
                  supportedLocales:
                      context.watch<LocalizationCubit>().supportedLocales,
                  onGenerateRoute: router.generateRoute,
                  localizationsDelegates:
                      context.watch<LocalizationCubit>().localizationDelegates,
                ));
          }),
    );
  }
}
