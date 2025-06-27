import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Future<Map<String, String?>> _getUserData() async {
    const storage = FlutterSecureStorage();
    final username = await storage.read(key: 'username');
    final email = await storage.read(key: 'email');
    return {
      'username': username,
      'email': email,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.blue[300],
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<Map<String, String?>>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading profile"));
          }

          final data = snapshot.data!;
          final username = data['username'] ?? 'N/A';
          final email = data['email'] ?? 'N/A';

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50),
                  ),
                  const SizedBox(height: 24),
                  Text(username, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 24),
                  Text(email, style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
