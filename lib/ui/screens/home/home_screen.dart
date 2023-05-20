import 'package:flutter/material.dart';
import 'package:roommate/ui/screens/home/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeContent(),
      ),
    );
  }
}
