import 'package:flutter/material.dart';
import 'package:montra_tracker/core/utils/colors.dart';

class LaunchSreen extends StatefulWidget {
  const LaunchSreen({super.key});

  @override
  State<LaunchSreen> createState() => _LaunchSreenState();
}

class _LaunchSreenState extends State<LaunchSreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
child: Container(
  decoration: BoxDecoration(
    color: AppColors.primary
  ),
  child: Center(
    child: Text('Montra_tracker'),
  ),
),
      ),
    );
  }
}