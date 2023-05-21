import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:roommate/blocs/app_cubit/auth_cubit.dart';
import 'package:roommate/blocs/login/login_cubit.dart';
import 'package:roommate/blocs/login/slider_cubit.dart';
import 'package:roommate/core/DI/dependency_injector.dart';
import 'package:roommate/core/data_sources/local/shared_perference.dart';
import 'package:roommate/repositories/auth_repo.dart';
import 'package:roommate/ui/screens/login/login_content.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SliderCubit>(
          create: (_) => SliderCubit(0),
        ),
        BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(
            authRepo: GetIt.I<AuthRepo>(),
            authCubit: GetIt.I<AuthCubit>(),
            sharedPreferencesHelper: diInstance<SharedPreferencesHelper>(),
          ),
        ),
      ],
      child: const LoginContent(),
    );
  }
}
