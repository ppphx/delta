import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> events = [
      {'title': 'Спорт', 'icon': Icons.sports_basketball},
      {'title': 'Интеллект', 'icon': Icons.book},
      {'title': 'Волонтерство', 'icon': Icons.favorite},
      {'title': 'Творчество', 'icon': Icons.brush},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мероприятия'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.0,
          ),
          itemCount: events.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      events[index]['icon'],
                      size: 48,
                      color: Colors.teal,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      events[index]['title'],
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.yellow,
            child: const Icon(Icons.lightbulb, color: Colors.black),
            tooltip: 'Предложи идею',
          ),
          const SizedBox(height: 8), // Отступ между кнопкой и текстом
          const Text(
            'Предложи идею',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}