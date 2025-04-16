import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'events_screen.dart';
import 'calendar_screen.dart';
import 'stay_informed_screen.dart';
import 'museum_screen.dart';
import 'theater_screen.dart';
import 'train_safety_screen.dart';
import 'parent_club_screen.dart'; // Оставляем имя файла, но класс теперь ParentsClubScreen
import 'school_for_parents_screen.dart';
import 'alumni_chronicle_screen.dart';

class HomeScreen extends StatelessWidget {
  final Map<String, String> userData;

  const HomeScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> buttonTitles = [
      {'title': 'Профиль', 'screen': ProfileScreen(userData: userData)},
      {'title': 'Календарный план', 'screen': const CalendarScreen()},
      {'title': 'Мероприятия', 'screen': const EventsScreen()},
      {'title': 'В курсе!\nПроконтролируй!', 'screen': const StayInformedScreen()},
      {'title': 'Наш музей', 'screen': const MuseumScreen()},
      {'title': 'Театр', 'screen': const TheaterScreen()},
      {'title': 'Поезд безопасности', 'screen': const TrainSafetyScreen()},
      {'title': 'Школа для родителей', 'screen': const ParentsSchoolScreen()},
      {'title': 'Родительский клуб', 'screen': const ParentsClubScreen()}, // Заменили ParentClubScreen
      {'title': 'Летопись выпускников', 'screen': const AlumniChronicleScreen()},
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final int crossAxisCount = 2;
    final int rowCount = (buttonTitles.length / crossAxisCount).ceil();

    final appBarHeight = AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
    const double paddingHorizontal = 16.0;
    const double paddingTop = 16.0;
    const double paddingBottom = 32.0;
    const double spacing = 8.0;

    final availableWidth = screenWidth - (paddingHorizontal * 2) - (spacing * (crossAxisCount - 1));
    final availableHeight = screenHeight - appBarHeight - paddingTop - paddingBottom - (spacing * (rowCount - 1));

    final buttonWidth = availableWidth / crossAxisCount;
    final buttonHeight = availableHeight / rowCount;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_circle),
        title: const Text('Дельта'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              'Выбрать, узнать,\nразвиться!',
              style: TextStyle(
                color: Colors.black,
                fontSize: (screenWidth * 0.025).clamp(8.0, 12.0),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(paddingHorizontal, paddingTop, paddingHorizontal, paddingBottom),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: buttonWidth / buttonHeight,
          ),
          itemCount: buttonTitles.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  if (buttonTitles[index]['screen'] != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => buttonTitles[index]['screen'],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8.0),
                ),
                child: Text(
                  buttonTitles[index]['title'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (screenWidth * 0.035).clamp(12.0, 16.0),
                    height: 1.1,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}