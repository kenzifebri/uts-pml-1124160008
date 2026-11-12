import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.asset,
    required this.inisial,
    this.radius = 46,
  });

  final String asset;
  final String inisial;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return CircleAvatar(
      radius: radius,
      backgroundColor: theme.colorScheme.surface,
      foregroundColor: theme.colorScheme.primary,
      foregroundImage: AssetImage(asset),
      child: Text(
        inisial,
        style: theme.textTheme.headlineSmall?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
