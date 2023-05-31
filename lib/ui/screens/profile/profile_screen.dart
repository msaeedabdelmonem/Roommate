import 'package:flutter/material.dart';
import 'package:roommate/models/profile/profile_model.dart';
import 'package:roommate/ui/screens/profile/profile_content.dart';
import 'package:roommate/ui/widgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.profileModel}) : super(key: key);
  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBackBtn: true),
      body: SafeArea(
        child: ProfileContent(profileModel: profileModel),
      ),
    );
  }
}
