import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart' as blocSrc;
import 'package:roommate/blocs/app_cubit/auth_cubit.dart';
import 'package:roommate/blocs/localization/localization_cubit.dart';
import 'package:roommate/blocs/splash/splash_cubit.dart';
import 'package:roommate/core/data_sources/local/shared_perference.dart';


//[CubitProvidersList] contains all main cubits providers of app
class CubitProvidersList {
  static final List<blocSrc.SingleChildWidget> providerList = [
    BlocProvider(create: (_) => GetIt.I<LocalizationCubit>()),
    BlocProvider(create: (_) => GetIt.I<AuthCubit>()),
    BlocProvider<SplashCubit>(
      create: (_) => SplashCubit(
        authCubit: GetIt.I<AuthCubit>(),
        sharedPreferencesHelper: GetIt.I<SharedPreferencesHelper>(),
      )..emitInitialAuthState(),
    ),
  ];
}
