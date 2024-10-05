import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:talhadnad/src/screen/payment_page.dart';
import 'package:talhadnad/widgets/status_area.dart';
import '../../widgets/market_layout.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math;

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  String? selectedSlot;
  Map<String, SlotStatus> slotStatuses = {};
  late TransformationController _transformationController;
  bool _showZoomOutButton = false;
  final double _zoomThreshold = 1.2;
  bool _isZoomedOut = false;
  DateTime _focusedDay = DateTime.now().add(const Duration(days: 1)); // Start from tomorrow
  DateTime? _selectedDay;

  CalendarFormat _calendarFormat = CalendarFormat.month;

  final double _defaultScale = 0.55;
  final double _minScale = 0.5;
  final double _maxScale = 3;

  late Matrix4 _initialMatrix;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    initializeSlots();

    _transformationController = TransformationController();
    _transformationController.addListener(_onTransformationChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Size size = MediaQuery.of(context).size;
      final scale = 0.88;
      final double defaultX = (size.width - (size.width * scale)) / 1.40;

      final double topContainerHeight = size.height * 0.25;
      final double defaultY = topContainerHeight - 180;

      _initialMatrix = Matrix4.identity()
        ..translate(defaultX, defaultY)
        ..scale(scale);

      _transformationController.value = _initialMatrix;
    });
  }

  bool _isCurrentDay(DateTime day) {
    final now = DateTime.now();
    return day.year == now.year && day.month == now.month && day.day == now.day;
  }

  void initializeSlots() {
    slotStatuses = {
      'A1': SlotStatus.Unselected,
      'A2': SlotStatus.Unselected,
      'B1': SlotStatus.Unselected,
      'B2': SlotStatus.Unselected,
    };
  }

  void updateSlotStatus(String slotId) {
    setState(() {
      if (selectedSlot == slotId) {
        slotStatuses[slotId] = SlotStatus.Unselected;
        selectedSlot = null;
      } else {
        if (selectedSlot != null) {
          slotStatuses[selectedSlot!] = SlotStatus.Unselected;
        }
        slotStatuses[slotId] = SlotStatus.Selected;
        selectedSlot = slotId;
      }
    });
  }

  void _onTransformationChange() {
    final scale = _transformationController.value.getMaxScaleOnAxis();
    setState(() {
      _showZoomOutButton = scale > _zoomThreshold;
    });
  }

  @override
  void dispose() {
    _transformationController.removeListener(_onTransformationChange);
    _transformationController.dispose();
    super.dispose();
  }

  void _showCalendarDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select Date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                TableCalendar(
                  firstDay: DateTime.now().add(const Duration(days: 1)), // Start from tomorrow
                  lastDay: DateTime.now().add(const Duration(days: 365)),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!_isCurrentDay(selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  calendarStyle: const CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Color(0xFF14213D),
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  enabledDayPredicate: (day) => !_isCurrentDay(day),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5CB793),
                        minimumSize: const Size(120, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'OK',
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Quicksand"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _resetZoom() {
    setState(() {
      _transformationController.value = _initialMatrix;
      _showZoomOutButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String selectedDateText = _selectedDay != null
        ? '${_selectedDay!.day} ${DateFormat('MMMM').format(_selectedDay!)}'
        : 'No Date Selected';

    bool isBookingAllowed = selectedSlot != null && 
                            _selectedDay != null && 
                            !_isCurrentDay(_selectedDay!);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 208, 208, 208),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  color: const Color(0xFF14213D),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height:
                              (MediaQuery.of(context).size.height * 0.25) / 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.calendar_today,
                                    color: Colors.white),
                                onPressed: _showCalendarDialog,
                              ),
                              IconButton(
                                icon: const Icon(Icons.more_vert,
                                    color: Colors.white),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Kmutt Market',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '6:00 AM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_today,
                                    color: Colors.white, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  selectedDateText,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Quicksand',
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '11:59 PM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 18,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 208, 208, 208),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      InteractiveViewer(
                        transformationController: _transformationController,
                        constrained: true,
                        boundaryMargin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        minScale: _minScale,
                        maxScale: _maxScale,
                        onInteractionEnd: (_) {
                          _onTransformationChange();
                        },
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: 0.8,
                            child: MarketLayout(
                              onSlotSelected: updateSlotStatus,
                              slotStatuses: slotStatuses,
                            ),
                          ),
                        ),
                      ),
                      if (_showZoomOutButton)
                        Positioned(
                          right: 16,
                          bottom: 16,
                          child: FloatingActionButton(
                            onPressed: _resetZoom,
                            child: Icon(Icons.zoom_out),
                            backgroundColor: Color(0xFF14213D),
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 110,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              selectedSlot != null
                                  ? 'ZONE - ${selectedSlot!.split('-')[0]}'
                                  : 'No Zone Selected',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              selectedSlot != null
                                  ? selectedSlot!.split('-')[1]
                                  : 'No Slot Selected',
                              style: const TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: isBookingAllowed
                              ? () {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(_selectedDay!);
                                  print(
                                      'Booked slot: $selectedSlot for date: $formattedDate');
                                  final queryParams = {
                                    'selectedSlot': selectedSlot,
                                    'selectedDate': formattedDate,
                                  };
                                  final uri = Uri(
                                    path: '/payment',
                                    queryParameters: queryParams,
                                  );
                                  context.go(uri.toString());
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5CB793),
                            minimumSize: const Size(120, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Confirm',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.229,
              left: MediaQuery.of(context).size.width * 0.02,
              width: MediaQuery.of(context).size.width * 0.95,
              child: const StatusArea(),
            ),
          ],
        ),
      ),
    );
  }
}