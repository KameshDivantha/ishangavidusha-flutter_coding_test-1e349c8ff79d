import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class UserProfileScreen extends StatelessWidget {
  final String userId;
  const UserProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: ChangeNotifierProvider(
        create: (_) => UserProvider()..fetchUser(userId),
        child: Consumer<UserProvider>(
          builder: (context, provider, _) {
            return Center(
              child: _buildContent(provider),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(UserProvider provider) {
    switch (provider.state) {
      case UserState.initial:
        return const SizedBox.shrink();
      case UserState.loading:
        return const CircularProgressIndicator();
      case UserState.error:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: ${provider.errorMessage}', 
              style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => provider.fetchUser(userId),
              child: const Text('Retry'),
            ),
          ],
        );
      case UserState.success:
        final user = provider.user!;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${user.name}', 
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Email: ${user.email}'),
              const SizedBox(height: 8),
              Text('Phone: ${user.phone}'),
              const SizedBox(height: 8),
              Text('Website: ${user.website}'),
            ],
          ),
        );
    }
  }
}
