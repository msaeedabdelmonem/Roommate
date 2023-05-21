import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:roommate/blocs/home/home_cubit.dart';
import 'package:roommate/repositories/home/home_repo.dart';
import 'package:roommate/ui/screens/home/home_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (_) => HomeCubit(
              homeRepo: GetIt.I<HomeRepo>(),
            )..getRooms(),
          ),
        ],
        child: SafeArea(
          child: HomeContent(),
        ),
      ),
    );
  }
}
