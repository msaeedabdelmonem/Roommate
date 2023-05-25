import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/request_state.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/ui/screens/search/search_content.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
          child:
        BlocBuilder<SearchDataCubit, RequestState>(builder: (context, state) {
      return
          SearchContent();})
        ),
    );
  }
}
