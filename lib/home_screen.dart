import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/loading.mp4')
      ..initialize().then((_) {
        setState(() {

        });
      })
      ..setVolume(0.0).then((value) => _playVideo());

  }

  void _playVideo() async {
    _controller.play();
    await Future.delayed(const Duration(seconds: 4));

    Navigator.pushNamed(context, '/');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: _controller.value.isInitialized ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller,),)
        : Lottie.network(
            'https://assets9.lottiefiles.com/private_files/lf30_aw7fmqh1.json'),
      ),
    );
  }
}
