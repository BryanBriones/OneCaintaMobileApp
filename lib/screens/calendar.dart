
import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/screens/onlinereservationform.dart';
import 'package:onecaintamobileapp/utility/flutttertoast.dart';
import 'package:table_calendar/table_calendar.dart';


import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';


class Calendar extends StatefulWidget  {
  Calendar();
 @override
 State<StatefulWidget> createState() {
    return _CalendarState();
  }
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin  {

Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

// Example holidays
// final Map<DateTime, List> _holidays = {
//   DateTime(2021, 1, 1): ['New Year\'s Day'],
//   DateTime(2021, 1, 6): ['Epiphany'],
//   DateTime(2021, 2, 14): ['Valentine\'s Day'],
//   DateTime(2021, 4, 21): ['Easter Sunday'],
//   DateTime(2021 , 4, 22): ['Easter Monday'],
// };

_CalendarState();
bool IsRefresh = false;
bool isLoading = false;

  refresh() async {

    setState(() {
        
        });
  }
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A',
        'Event B',
        'Event C'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A',
        'Event B',
        'Event C'
      ],
      _selectedDay.subtract(Duration(days: 16)): [ 'Event A',
        'Event B',
        'Event C'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A',
        'Event B',
        'Event C'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A',
        'Event B',
        'Event C'
      ],
      _selectedDay.subtract(Duration(days: 2)): [ 'Event A',
        'Event B',
        'Event C'],
      _selectedDay: [ 'Event A',
        'Event B',
        'Event C'],
      _selectedDay.add(Duration(days: 1)): [
         'Event A',
        'Event B',
        'Event C'
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from([ 'Event A',
        'Event B',
        'Event C']).toList(),
      _selectedDay.add(Duration(days: 7)): [
       'Event A',
        'Event B',
        'Event C'
      ],
      _selectedDay.add(Duration(days: 11)): [ 'Event A',
        'Event B',
        'Event C'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A',
        'Event B',
        'Event C'
      ],
      _selectedDay.add(Duration(days: 22)): [ 'Event A',
        'Event B',
        'Event C'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A',
        'Event B',
        'Event C'
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
    
  }

   // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
     // holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.blueAccent[400],
        todayColor: Colors.green[400],
        markersColor: Colors.grey[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      // onDaySelected: _onDaySelected,
      // onVisibleDaysChanged: _onVisibleDaysChanged,
      // onCalendarCreated: _onCalendarCreated,
      availableCalendarFormats:  {CalendarFormat.month: 'Month'},
    );
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
              color: Colors.green[400],
              child: Text('Reserve for this day', style: TextStyle(color: Colors.white),),
              onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return OnlineReservationForm(_calendarController.selectedDay.month.toString() + "/" + _calendarController.selectedDay.day.toString() + "/" +_calendarController.selectedDay.year.toString());})); 
              },
            ),
          ],
        ),

    
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      shrinkWrap: true,
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }

 void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "Cainta Calendar"),

                    body:RefreshIndicator(
                       child: Container (height: MediaQuery.of(context).size.height,
                         child:Column(
                           mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildTableCalendar(),
          const SizedBox(height: 8.0),
          Padding(padding:EdgeInsets.only(left:10), child:Align(alignment: Alignment.centerLeft,child:SizedBox(height: 20.0, child: Text('Events for this day', style:TextStyle(fontWeight: FontWeight.bold))))),
          Scrollbar(child:SingleChildScrollView(child:Container(height:MediaQuery.of(context).size.height*.30, child: _buildEventList()))),                        
                                          
        ]),
      ),onRefresh: () => refresh()),       
    );
  }
}
