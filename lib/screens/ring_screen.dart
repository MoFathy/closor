//import 'package:audioplayers/audioplayers.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:closor/helper/navigator.dart';
import 'package:closor/model/lead.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class RingScreen extends StatefulWidget {
  @override
  _RingScreenState createState() => _RingScreenState();
}

class _RingScreenState extends State<RingScreen> {
//  AudioPlayer audioPlayer =
//  AudioPlayer();
  final assetsAudioPlayer = AssetsAudioPlayer();


  @override
  void initState() {
    // TODO: implement initState
//    audioPlayer.set
//    audioPlayer.play('assets/ringtone.mp3', isLocal: true);
    assetsAudioPlayer.open(
        Audio("assets/ringtone.mp3"),
        autoStart: true,
        loopMode: LoopMode.single
    );
    super.initState();
  }

  @override
  void dispose() {
//    audioPlayer.dispose();
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Lead lead = ModalRoute
        .of(context)
        .settings
        .arguments;
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Color(0xff4385F6),
      body: Stack(
        children: [
          buildCircle(size.width / 1.25),
          buildCircle(size.width / 1.4),
          buildCircle(size.width / 1.8),
          Center(
            child: Text(
              'You Got Lead!',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Positioned(
            right: size.width / 2 - (size.width / 4) / 2,
            bottom: 10,
            child: InkWell(
              onTap: () =>
                  Navigator.of(context)
                      .popAndPushNamed(LEAD_INFO, arguments: lead),
              child: Image.asset(
                'assets/icons/Actions.png',
                width: size.width / 4,
//              height: 100,
              ),
            ),
          )
        ],
      ),
    );
  }

  Center buildCircle(double size) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          color: Colors.white.withAlpha(15),
        ),
        width: size,
        height: size,
      ),
    );
  }
}
