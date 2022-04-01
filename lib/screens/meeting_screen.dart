import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({ Key? key }) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods=JitsiMeetMethods();

  createNewMeeting() async{
    var random=Random();
    String roomName=(random.nextInt(10000000)+10000000).toString();
      _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true,);
  }

  joinMeeting(BuildContext context){
    Navigator.pushNamed(context, '/video-call');
  } 


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         HomeMeetingButton(
           onPressed: createNewMeeting,
            icon: Icons.videocam,
            text: 'New Meeting',
          ),
          HomeMeetingButton(
          onPressed: () => joinMeeting(context),
            icon: Icons.add_box_rounded,
            text: 'Join meeting', // Not going to be implemented in app
          ),
          HomeMeetingButton(
           onPressed: () {
             const snackBar = SnackBar(
              content: Text('Under Development'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }, 
            icon: Icons.calendar_today,
            text: 'Schedule', // Not going to be implemented in app
          ),
          HomeMeetingButton(
           onPressed: () {
             const snackBar = SnackBar(
              content: Text('Available in Meeting Screen'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }, 
            icon: Icons.arrow_upward_rounded,
            text: 'Share Screen',
          ),
       ],
      ),
      const SizedBox(height: 60,),
      Center(
        child: Image.asset('assets/images/meet_screen.png'),
        ),
      const SizedBox(height:60,),
      const Text('Create or Join a meeting',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white70,
        ),
        ),
    ]);
  }
}