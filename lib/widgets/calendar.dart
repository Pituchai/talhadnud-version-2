import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final List<String> marketCloseDates;

  CalendarWidget({required this.onDateSelected, required this.marketCloseDates});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  bool isDateClosed(DateTime date) {
    return widget.marketCloseDates.any((closedDate) {
      DateTime parsedDate = DateTime.parse(closedDate);
      bool isClosed = date.year == parsedDate.year &&
             date.month == parsedDate.month &&
             date.day == parsedDate.day;
     // print("Checking date: ${DateFormat("yyyy-MM-dd").format(date)}");
      //print("Is closed: $isClosed");
      return isClosed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF36A690),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('MMMM yyyy').format(_focusedDay),
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.chevron_left, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.chevron_right, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      'S', 'M', 'T', 'W', 'T', 'F', 'S'
                    ].map((day) => Text(
                      day,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )).toList(),
                  ),
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
                bool isClosed = isDateClosed(date);

                return GestureDetector(
                  onTap: () {
                    if (date.isAfter(DateTime.now()) && !isClosed) {
                      setState(() {
                        _selectedDay = date;
                      });
                      widget.onDateSelected(date);
                    } else if (isClosed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("The market is closed on this day")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Can't select current day or past days")),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: (_selectedDay != null && _selectedDay!.day == day)
                          ? Border.all(color: Color(0xFF36A690), width: 2)
                          : null,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$day',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                          color: isClosed
                              ? Colors.red  
                              : (date.isAfter(DateTime.now())
                                  ? Colors.black
                                  : Colors.grey),
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
      ),
    );
  }
}