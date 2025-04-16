import 'package:flutter/material.dart';

class MuseumScreen extends StatelessWidget {
  const MuseumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Наш музей'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Школьный музей',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Добро пожаловать в наш школьный музей! Здесь собраны экспонаты, рассказывающие об истории лицея.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Здесь можно добавить логику, например, переход на экран с историей лицея
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Цвет фона как у Card в EventsScreen
                      foregroundColor: Colors.black, // Цвет текста
                      elevation: 4, // Тень, как у Card
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history, size: 48, color: Colors.teal), // Цвет иконки как в EventsScreen
                        SizedBox(height: 8),
                        Text(
                          'История лицея',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Здесь можно добавить логику, например, переход на экран с достижениями
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Цвет фона как у Card в EventsScreen
                      foregroundColor: Colors.black, // Цвет текста
                      elevation: 4, // Тень, как у Card
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, size: 48, color: Colors.teal), // Цвет иконки как в EventsScreen
                        SizedBox(height: 8),
                        Text(
                          'Достижения',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}