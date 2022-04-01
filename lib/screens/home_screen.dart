import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/history_meeting_screen.dart';
import 'package:zoom_clone/screens/meeting_screen.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/settings_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _page=0;
  onPageChanged(int page){
    setState(() {
      _page=page;
    });
  }

  List<Widget> pages=[
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Center(child: Text('Feature coming soon')),
    SettingsPage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('ZOOM CLONE',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),

      body: pages[_page],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank
              ),
          label:'Meeting'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock
              ),
          label:'History'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline
              ),
          label:'Contacts'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined
              ),
          label:'Settings'),
      ]
      ),
    );
  }
}
