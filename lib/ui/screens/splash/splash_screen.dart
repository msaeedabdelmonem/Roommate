import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/splash/splash_cubit.dart';
import 'package:roommate/core/constants/image_paths.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:     BlocBuilder<SplashCubit, void>(
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePaths.splash),
                fit: BoxFit.fill,
              ),
            ),
          );
        }
        ),
    );
  }
}
