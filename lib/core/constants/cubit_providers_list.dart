import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart' as blocSrc;
import 'package:roommate/blocs/app_cubit/auth_cubit.dart';
import 'package:roommate/blocs/home/home_cubit.dart';
import 'package:roommate/blocs/localization/localization_cubit.dart';
import 'package:roommate/blocs/profile/profile_cubit.dart';
import 'package:roommate/blocs/search/city_cubit.dart';
import 'package:roommate/blocs/search/district_cubit.dart';
import 'package:roommate/blocs/search/location_cubit.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/blocs/splash/splash_cubit.dart';
import 'package:roommate/core/data_sources/local/shared_perference.dart';
import 'package:roommate/repositories/auth_repo.dart';
import 'package:roommate/repositories/home/home_repo.dart';
import 'package:roommate/repositories/home/search_repo.dart';

//[CubitProvidersList] contains all main cubits providers of app
class CubitProvidersList {
  static final List<blocSrc.SingleChildWidget> providerList = [
    BlocProvider(create: (_) => GetIt.I<LocalizationCubit>()),
    BlocProvider(create: (_) => GetIt.I<AuthCubit>()),
    BlocProvider<SearchCubit>(
      create: (_) => SearchCubit(),
    ),
    BlocProvider<LocationCubit>(create: (_) => LocationCubit()),
    BlocProvider<HomeCubit>(
        create: (_) => HomeCubit(
              homeRepo: GetIt.I<HomeRepo>(),
            )),
    BlocProvider<SearchDataCubit>(
      create: (_) => SearchDataCubit(searchRepo: GetIt.I<SearchRepo>()),
    ),
    BlocProvider<DistrictCubit>(
      create: (_) => DistrictCubit(),
    ),
    BlocProvider<CityCubit>(
      create: (_) => CityCubit(),
    ),
    BlocProvider<SplashCubit>(
      create: (_) => SplashCubit(
        authCubit: GetIt.I<AuthCubit>(),
        sharedPreferencesHelper: GetIt.I<SharedPreferencesHelper>(),
      )..emitInitialAuthState(),
    ),
    BlocProvider<ProfileCubit>(
      create: (_) => ProfileCubit(
        authRepo: GetIt.I<AuthRepo>(),
        authCubit: GetIt.I<AuthCubit>(),
      ),
    ),
  ];
}
