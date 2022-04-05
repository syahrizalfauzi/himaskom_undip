import 'package:flutter/material.dart';

class ProfilePagePresentational extends StatelessWidget {
  final String? avatarUrl;
  final String name;
  final String email;
  final Function() onLogOut;

  const ProfilePagePresentational({
    Key? key,
    this.avatarUrl,
    required this.name,
    required this.email,
    required this.onLogOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 45,
                foregroundImage: avatarUrl == null
                    ? const AssetImage('assets/avatar.png')
                    : NetworkImage(avatarUrl!) as ImageProvider,
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 12),
                  Text(email, style: Theme.of(context).textTheme.labelMedium)
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            'Made with ❤ from DR, SF, & FA️',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
