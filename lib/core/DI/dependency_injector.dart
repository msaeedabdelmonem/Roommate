import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:roommate/blocs/localization/localization_cubit.dart';
import 'package:roommate/blocs/search/location_cubit.dart';
import 'package:roommate/core/DI/injectors/injector_holder.dart';
import 'package:roommate/core/data_sources/local/shared_perference.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/utils/tools/device_info_details.dart';
import 'package:roommate/core/utils/tools/dynamic_link.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

final diInstance = GetIt.instance;

class DependencyInjector {
  DependencyInjector() : super();

  /// injectModules that used in app-runner
  Future<void> injectModules() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Future.wait(
        [DeviceInfoDetails().initPlatformState(), Firebase.initializeApp()]);

    customizeLoader();

    /// Loads the SharedPreferences asynchronously only once before calling runApp
    ///
    /// Eliminates the need to retrieve the sharedPrefs asynchronously everytime we
    /// retrieve data from the shared preferences
    GetIt.I.registerLazySingletonAsync<SharedPreferencesHelper>(() async =>
        SharedPreferencesHelper(
            preferences: (await SharedPreferences.getInstance())));
    await GetIt.I.getAsync<SharedPreferencesHelper>();
    GetIt.I.registerLazySingleton<DynamicLink>(
            () => DynamicLink());
   LocalizationCubit.storedLanguageCode = await diInstance<SharedPreferencesHelper>().getLanguageCode();
    /// Injects all modules in app
    InjectorHolder.injectAllApplicationModules();
  }

  void customizeLoader() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45
      ..textColor = Colors.black
      ..radius = 20
      ..backgroundColor = Colors.transparent
      ..maskColor = Colors.white
      ..indicatorColor = ConstantsColors.mainBackgroundColor
      ..userInteractions = false
      ..dismissOnTap = false
      ..boxShadow = <BoxShadow>[]
      ..indicatorType = EasyLoadingIndicatorType.threeBounce;
  }
}
