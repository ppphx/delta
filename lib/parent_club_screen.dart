import 'package:flutter/material.dart';

class ParentsClubScreen extends StatelessWidget {
  const ParentsClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Родительский клуб'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            // Раздел 1: День родительских профессий
            Card(
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'День родительских профессий',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Мероприятие, где родители делятся опытом и рассказывают о своих профессиях. '
                          'Это отличная возможность для детей узнать о различных карьерных путях и вдохновиться!',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // Раздел 2: Мои герои (Родители на СВО)
            Card(
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Мои герои (Родители на СВО)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Раздел посвящен историям родителей, участвующих в специальной военной операции. '
                          'Мы гордимся их мужеством и хотим сохранить их подвиги для будущих поколений.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // Раздел 3: Родительский патруль
            Card(
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Родительский патруль',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Инициатива, созданная родителями для обеспечения безопасности и поддержки школьной среды. '
                          'Родители самостоятельно подгружают информацию, делятся идеями и координируют действия.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}