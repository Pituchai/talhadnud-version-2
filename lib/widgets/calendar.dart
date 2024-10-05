import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  CalendarWidget({required this.onDateSelected});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat('MMMM yyyy').format(_focusedDay)),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () {
                      setState(() {
                        _focusedDay = DateTime(
                            _focusedDay.year, _focusedDay.month - 1, 1);
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () {
                      setState(() {
                        _focusedDay = DateTime(
                            _focusedDay.year, _focusedDay.month + 1, 1);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1,
          ),
          itemCount: 7 * 6, // 7 columns, 6 rows
          itemBuilder: (context, index) {
            final int day = index -
                DateTime(_focusedDay.year, _focusedDay.month, 1).weekday +
                2;
            final DateTime date =
                DateTime(_focusedDay.year, _focusedDay.month, day);

            if (day > 0 && date.month == _focusedDay.month) {
              return GestureDetector(
                onTap: () {
                  if (date.isAfter(DateTime.now())) {
                    setState(() {
                      _selectedDay = date;
                    });
                    widget.onDateSelected(date);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              "Can't make a reservation for the current day or past days")),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedDay != null && _selectedDay!.day == day
                        ? Colors.teal
                        : null,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '$day',
                      style: TextStyle(
                        color: date.isAfter(DateTime.now())
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
