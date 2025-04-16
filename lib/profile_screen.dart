import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, String> userData;

  const ProfileScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Профиль'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ФИО:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              userData['name'] ?? 'Не указано',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'ФИО родителя:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              userData['parentName'] ?? 'Не указано',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Класс учащегося:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              userData['studentClass'] ?? 'Не указано',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Изменить почту'),
              onTap: () {
                // Заглушка для изменения почты
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Функция изменения почты в разработке')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Изменить пароль'),
              onTap: () {
                // Заглушка для изменения пароля
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Функция изменения пароля в разработке')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.brown),
              title: const Text('Выйти', style: TextStyle(color: Colors.brown)),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/auth',
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}