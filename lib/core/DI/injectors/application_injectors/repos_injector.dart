import 'package:roommate/core/DI/injectors/base_injector.dart';

/// [ReposInjector] hold all application repos dependencies
class ReposInjector extends BaseInjector {
  static final reposInjectors = [];

  /// iterate and inject all repos
  @override
  void injectModules() {
    for (final repoInjector in reposInjectors) {
      repoInjector.call();
    }
  }
}
