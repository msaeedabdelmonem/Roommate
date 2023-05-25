import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:roommate/blocs/home/home_cubit.dart';
import 'package:roommate/blocs/request_state.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/repositories/home/home_repo.dart';
import 'package:roommate/ui/screens/home/home_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().getRooms();
    context.read<SearchDataCubit>().getAllData();
    return Scaffold(
      body:BlocBuilder<SearchDataCubit, RequestState>(
        builder: (context, state) {
      return SafeArea(
          child: HomeContent(),
        );})
    );
  }
}
