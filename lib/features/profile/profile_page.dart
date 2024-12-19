import 'package:flutter/material.dart';

/// [ProfilePage] is the page that displays the profile.
class ProfilePage extends StatefulWidget {
  /// [ProfilePage] is the page that displays the profile.
  const ProfilePage({super.key});

  /// [ProfilePage] is the page that displays the profile.
  static const name = 'profile-page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Profile'),
        ),
      );
}
