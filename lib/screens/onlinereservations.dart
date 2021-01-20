
import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/screens/onlinereservationform.dart';
import 'package:onecaintamobileapp/utility/flutttertoast.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:smart_select/smart_select.dart';



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
  String facility;
  List<S2Choice<String>> options = [
  S2Choice<String>(value: 'Cainta Gym', title: 'Cainta Gym'),
  S2Choice<String>(value: 'Cainta Multi-Purpose Hall', title: 'Cainta Multi-Purpose Hall'),
  S2Choice<String>(value: 'Cainta Office', title: 'Cainta Office'),
];


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

   // S2Choice<String> shit = new S2Choice<String>(value: 'pekpek', title:'pekpek');
  //   options.add(shit);

   facility =options[0].value;
  
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
      daysOfWeekStyle: DaysOfWeekStyle(weekendStyle:  TextStyle().copyWith(color: Colors.blueAccent) ),
      calendarStyle: CalendarStyle(
        selectedColor: Colors.green[400],
        todayColor: Colors.blue[400],
        markersColor: Colors.blue[900],
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blueAccent),
        holidayStyle: TextStyle(color: Colors.orange[900], fontWeight: FontWeight.bold),
       

      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
             SizedBox(height: 20.0, child: Text('Reserved Slots Below:', style:TextStyle(fontWeight: FontWeight.bold))),
          RaisedButton(
              color: Colors.green[400],
              child: Text('Reserve for this day', style: TextStyle(color: Colors.white),),
              onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return OnlineReservationForm( DateFormat('MM/dd/yyyy').format(_calendarController.selectedDay), facility);})); 
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

                    body:SingleChildScrollView(child:RefreshIndicator(
                       child: Container (height: MediaQuery.of(context).size.height,
                         child:Column(
                           mainAxisSize: MainAxisSize.max,
        children: <Widget>[
           _buildTableCalendar(),
             SmartSelect<String>.single(
                                            title: 'Facility',
                                            value: facility,
                                            choiceItems: options,
                                              modalType: S2ModalType.bottomSheet,
                                            
                                            onChange: (state) => setState(() => facility = state.value)
                                        ),
           _buildButtons(),

          Scrollbar(child:SingleChildScrollView(child:Container(height:MediaQuery.of(context).size.height*.25, child: _buildEventList()))),
                                           
                                          
        ]),
                       ),onRefresh: () => refresh()
                       ),
                    ),
                    );
                 }
}
