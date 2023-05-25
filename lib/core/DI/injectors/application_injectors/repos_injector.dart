import 'package:roommate/core/DI/dependency_injector.dart';
import 'package:roommate/core/DI/injectors/base_injector.dart';
import 'package:roommate/repositories/auth_repo.dart';
import 'package:roommate/repositories/home/home_repo.dart';
import 'package:roommate/repositories/home/search_repo.dart';

/// [ReposInjector] hold all application repos dependencies
class ReposInjector extends BaseInjector {
  static final reposInjectors = [
    () => diInstance.registerLazySingleton<AuthRepo>(
          () => AuthRepoImp(),
        ),
        () => diInstance.registerLazySingleton<HomeRepo>(
          () => HomeRepoImp(),
    ),
        () => diInstance.registerLazySingleton<SearchRepo>(
          () => SearchRepoImp(),
    ),
  ];

  /// iterate and inject all repos
  @override
  void injectModules() {
    for (final repoInjector in reposInjectors) {
      repoInjector.call();
    }
  }
}
