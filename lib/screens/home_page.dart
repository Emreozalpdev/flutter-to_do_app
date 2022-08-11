import 'package:flutter/material.dart';
import 'package:to_do_app/utils/utils.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: _appBar(),
      body: SingleChildScrollView(child: _body()),
      bottomNavigationBar: _bottomBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: false,
      title: const Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              'assets/images/avatar.png',
              fit: BoxFit.cover,
              width: 60,
              height: 30,
            ),
          ),
        )
      ],
    );
  }
}

Padding _body() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _calendar(),
        toDoText(),
        const ToDoCard(),
        const ToDoCard(),
        _doneText(),
        const ToDoCard(),
      ],
    ),
  );
}

CalendarTimeline _calendar() {
  return CalendarTimeline(
    locale: 'en_ISO',
    initialDate: DateTime.now(),
    firstDate: DateTime.utc(2022, 01, 01),
    lastDate: DateTime.utc(2030, 12, 31),
    onDateSelected: (date) => print(date),
    dayColor: Colors.white,
    activeDayColor: Colors.black,
    activeBackgroundDayColor: Colors.amber,
    monthColor: Colors.white54,
  );
}

Padding toDoText() {
  return const Padding(
    padding: EdgeInsets.only(top: 15.0),
    child: Text(
      toDo,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
    ),
  );
}

Padding _doneText() {
  return const Padding(
    padding: EdgeInsets.only(top: 15.0),
    child: Text(
      doneText,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
    ),
  );
}

class ToDoCard extends StatelessWidget {
  const ToDoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.yellow,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: 80,
                width: 10,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    cardCategory,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                  Text(
                    cardTitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    cardClock,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
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

BottomNavigationBar _bottomBar() {
  return BottomNavigationBar(
    showSelectedLabels: false,
    items: [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.grey,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.list_alt,
          color: Colors.grey,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: FloatingActionButton.small(
          backgroundColor: Colors.orange,
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.query_stats,
          color: Colors.grey,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
          color: Colors.grey,
        ),
        label: '',
      ),
    ],
  );
}
