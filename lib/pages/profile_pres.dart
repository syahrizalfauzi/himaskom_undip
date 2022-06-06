import 'package:flutter/material.dart';

class ProfilePagePresentational extends StatelessWidget {
  final String? avatarUrl;
  final String name;
  final String email;

  const ProfilePagePresentational({
    Key? key,
    this.avatarUrl,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                children: [
                  Text(name, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 12),
                  Text(email, style: Theme.of(context).textTheme.labelMedium)
                ],
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
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
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
    );
  }
}
