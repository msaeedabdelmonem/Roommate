import 'package:roommate/core/DI/injectors/base_injector.dart';

import 'application_injectors/index.dart';

/// [InjectorHolder] hold all applicationInjectors e.g [CubitsInjector] ,[ReposInjector] ...
///
class InjectorHolder {
  static final List<BaseInjector> _applicationInjectors = [
    ReposInjector(),
    CubitsInjector(),
  ];

  /// iterate and inject all application modules
  static void injectAllApplicationModules() {
    for (var injector in _applicationInjectors) {
      injector.injectModules();
    }
  }
}
