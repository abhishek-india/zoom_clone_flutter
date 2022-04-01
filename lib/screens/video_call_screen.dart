import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/meeting_option.dart';


class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({ Key? key }) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {

  bool isAudioMuted=true;
  bool isVideoMuted=true;
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods =JitsiMeetMethods();

  @override
  void initState() {
    meetingIdController=TextEditingController();
    nameController=TextEditingController(text: _authMethods.user.displayName,);
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting(){
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
      
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text('Join a meeting',
        style: TextStyle(
          fontSize: 18,
        ),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        SizedBox(
          height: 60,
          child: TextField(
            controller: meetingIdController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Room ID',
              contentPadding: EdgeInsets.fromLTRB(16, 18, 0, 18)
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: TextField(
            controller: nameController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Name',
              contentPadding: EdgeInsets.fromLTRB(16, 18, 0, 18)
            ),
          ),
        ),
        const SizedBox(height: 20,),
        InkWell(
          onTap: _joinMeeting,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text('Join',
            style: TextStyle(
              fontSize: 16,
            ),
            ),
            )
        ),
        const SizedBox(height: 60,),
        MeetingOption(text: 'Mute Audio', isMute: isAudioMuted, onChange: onAudioMuted,),
        MeetingOption(text: 'Turn off video', isMute: isVideoMuted, onChange: onVideoMuted,),
      ]),
    );
  }

  onAudioMuted(bool val){
    setState(() {
      isAudioMuted=val;
    });
  }

  onVideoMuted(bool val){
  setState(() {
      isVideoMuted=val;
    });
  }
}