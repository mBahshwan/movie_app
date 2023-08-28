import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/constants/consts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

class VideoPlayerPage extends StatefulWidget {
  final int videoId;
  const VideoPlayerPage({super.key, required this.videoId});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  String? videoUrl;
  YoutubePlayerController? _controller;

  Future<void> getVideoUrl() async {
    final String apiUrl =
        'https://api.themoviedb.org/3/movie/${widget.videoId}/videos?api_key=${Const.api_key}';
    print(widget.videoId);

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final key = data['results'][0]['key'] as String;
        print(key);
        if (key.isNotEmpty) {
          setState(() {
            videoUrl = 'https://www.youtube.com/watch?v=$key';
            final videoId = YoutubePlayer.convertUrlToId(videoUrl!);
            _controller = YoutubePlayerController(
                initialVideoId: videoId!,
                flags: YoutubePlayerFlags(
                  autoPlay: false,
                ));
          });

          print(videoUrl);
        }
      }
    } catch (error) {
      print('Error fetching movie details: $error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getVideoUrl();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("try youtube !!"),
      // ),
      // body: Container(
      //   child: videoUrl == null
      //       ? CircularProgressIndicator()
      //       : Text(
      //           "$videoUrl",
      //           style: TextStyle(color: Colors.white),
      //         ),
      // ),
      body: _controller == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: YoutubePlayer(
                showVideoProgressIndicator: true,
                controller: _controller!,
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(isExpanded: true),
                  FullScreenButton(),
                  RemainingDuration(),
                  PlaybackSpeedButton()
                  //TotalDuration(),
                ],
              ),
            ),
    );
  }
}
