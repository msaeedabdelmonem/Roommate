import 'package:roommate/blocs/app_cubit/auth_cubit.dart';
import 'package:roommate/blocs/localization/localization_cubit.dart';
import 'package:roommate/core/DI/dependency_injector.dart';
import 'package:roommate/core/DI/injectors/base_injector.dart';
import 'package:roommate/core/data_sources/local/shared_perference.dart';

/// [CubitsInjector] hold all application cubits dependencies
///
/// global cubits are injected here not the APIs cubits, other cubits are used via blocProviders
class CubitsInjector extends BaseInjector {
  static final cubitsInjectors = [
        () => diInstance.registerLazySingleton<LocalizationCubit>(
          () => LocalizationCubit(
        sharedPrefsClient: diInstance<SharedPreferencesHelper>(),
      ),
    ),
        () => diInstance.registerLazySingleton<AuthCubit>(
          () => AuthCubit(),
    ),
  ];

  @override
  void injectModules() {
    for (final cubitInjector in cubitsInjectors) {
      cubitInjector.call();
    }
  }
}
