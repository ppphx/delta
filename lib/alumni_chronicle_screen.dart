import 'package:flutter/material.dart';

class AlumniChronicleScreen extends StatelessWidget {
  const AlumniChronicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> alumni = [
      {'name': 'Иван Иванов', 'year': '2015', 'achievement': 'Основатель стартапа'},
      {'name': 'Анна Петрова', 'year': '2018', 'achievement': 'Ученый в области биологии'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Летопись выпускников'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Истории наших выпускников',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: alumni.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(alumni[index]['name']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Выпуск ${alumni[index]['year']}'),
                          Text(alumni[index]['achievement']!),
                        ],
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('История ${alumni[index]['name']}')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Отправка истории...')),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Поделиться своей историей'),
            ),
          ],
        ),
      ),
    );
  }
}