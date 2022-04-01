import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';

class JitsiMeetMethods{

  final AuthMethods _authMethods =AuthMethods();
  final FireStoreMethods _fireStoreMethods =FireStoreMethods();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username='',
    }) async {
try {
	  FeatureFlag featureFlag = FeatureFlag();
	  featureFlag.welcomePageEnabled = false;
	  featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION; // Limit video resolution to 360p
	  
    String name;
    if(username.isEmpty){
      name=_authMethods.user.displayName!;
    }
    else{
      name=username;
    }
      var options = JitsiMeetingOptions(
        room:roomName
        )
        // ..room = "myroom" // Required, spaces will be trimmed
        // ..serverURL = "https://someHost.com"
        // ..subject = "Meeting with Gunschu"
        ..userDisplayName = name
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL
        // ..audioOnly = true
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
        
      _fireStoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
}
}