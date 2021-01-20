
import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/screens/onlinereservationform.dart';
import 'package:onecaintamobileapp/utility/flutttertoast.dart';
import 'package:table_calendar/table_calendar.dart';



import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';


class OnlineReservation extends StatefulWidget  {
  OnlineReservation();
 @override
 State<StatefulWidget> createState() {
    return _OnlineReservationState();
  }
}

class _OnlineReservationState extends State<OnlineReservation> with TickerProviderStateMixin  {

//DIALOG
BuildContext dialogContext;


//CALENDARS

Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2021, 1, 1): ['New Year\'s Day'],
  DateTime(2021, 1, 6): ['Epiphany'],
  DateTime(2021, 2, 14): ['Valentine\'s Day'],
  DateTime(2021, 4, 21): ['Easter Sunday'],
  DateTime(2021 , 4, 22): ['Easter Monday'],
};

_OnlineReservationState();
bool IsRefresh = false;
bool isLoading = false;

  refresh() async {

    setState(() {
        
        });
  }
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

 WidgetsBinding.instance.addPostFrameCallback((_) => showAlertDialog(dialogContext));
  
    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Reservation A 1PM -2PM',
        'Reservation B 2PM -3PM',
        'Reservation C 3PM - 4PM'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A 1PM -2PM'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
       'Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM'],
      _selectedDay: ['Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM',
        'Reservation D 4PM-5PM',
         'Reservation D 4PM-5PM'],
      _selectedDay.add(Duration(days: 1)): [
        'Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM'
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM'
      ],
      _selectedDay.add(Duration(days: 11)): ['Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM'],
      _selectedDay.add(Duration(days: 17)): [
        'Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM'
      ],
      _selectedDay.add(Duration(days: 22)): ['Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM'],
      _selectedDay.add(Duration(days: 26)): [
        'Reservation A 1PM-2PM',
        'Reservation B 2PM-3PM',
        'Reservation C 3PM-4PM'
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
      holidays: _holidays,
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
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
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


showAlertDialog(BuildContext dialogContext) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("Got it!"),
    onPressed: () {
      Navigator.of(dialogContext).pop();
     },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Welcome to Cainta Online Reservations"),
    content: Text("Here you can reserve facilities and check availabilities in the calendar.\n\nSelect the date you want to reserve and click 'Reserve for this day'"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
       dialogContext = context;
      return alert;
    },
  );
}

 void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }
  @override
  Widget build(BuildContext context) {

 
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "Online Reservations"),

                    body:RefreshIndicator(
                       child: Container (height: MediaQuery.of(context).size.height,
                         child:Column(
                           mainAxisSize: MainAxisSize.max,
        children: <Widget>[

           _buildTableCalendar(),
          const SizedBox(height: 8.0),
          _buildButtons(),
          Padding(padding:EdgeInsets.only(left:10), child:Align(alignment: Alignment.centerLeft,child:SizedBox(height: 20.0, child: Text('Reserved Slots', style:TextStyle(fontWeight: FontWeight.bold))))),

          Scrollbar(child:SingleChildScrollView(child:Container(height:MediaQuery.of(context).size.height*.30, child: _buildEventList()))),
                                           
                                          
        ]),
                       ),onRefresh: () => refresh()),
            
                    );
                 }
}
