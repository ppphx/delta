import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Пустая карта событий (можно заполнить позже через API или вручную)
  final Map<DateTime, List<String>> _events = {};

  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Календарный план'),
      ),
      body: Column(
        children: [
          // Календарь
          TableCalendar(
            firstDay: DateTime.utc(2025, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday, // Начинаем неделю с понедельника
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              selectedDecoration: const BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          ),
          const SizedBox(height: 16),
          // Список событий
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _selectedDay != null && _getEventsForDay(_selectedDay!).isNotEmpty
                  ? ListView.builder(
                itemCount: _getEventsForDay(_selectedDay!).length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const Icon(Icons.event, color: Colors.teal),
                      title: Text(_getEventsForDay(_selectedDay!)[index]),
                      onTap: () {
                        // Здесь можно добавить переход на детальную страницу события
                      },
                    ),
                  );
                },
              )
                  : const Center(
                child: Text(
                  'Событий на выбранную дату нет',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}