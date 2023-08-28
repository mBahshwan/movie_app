import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants/consts.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screens/video_player.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;
  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar.large(
          leading: Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(top: 16, left: 16),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 46, 44, 44),
                borderRadius: BorderRadius.circular(8)),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                )),
          ),
          floating: true,
          pinned: true,
          expandedHeight: 400,
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Image.network("${Const.imagePath}${movie.posterPath}",
                  fit: BoxFit.fill),
            ),
            title: Text(
              movie.title.toString(),
              style: GoogleFonts.belleza(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  backgroundColor: Colors.black.withOpacity(0.4)),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "OVerview",
                style: GoogleFonts.openSans(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                movie.overView.toString(),
                style: GoogleFonts.belleza(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VideoPlayerPage(videoId: movie.id!.toInt()),
                    )),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  height: 46,
                  margin: EdgeInsets.all(10),
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Play",
                        style: GoogleFonts.akshar(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                height: 40,
                child: Text(
                  "Release date: ${movie.releaseDate}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                height: 40,
                width: 180,
                child: Row(
                  children: [
                    Text(
                      "Rating",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      "${movie.voteAverage}/10",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.all(10),
              //       decoration: BoxDecoration(
              //           border: Border.all(color: Colors.white),
              //           borderRadius: BorderRadius.circular(20)),
              //       height: 40,
              //       child: Text(
              //         "Release date: ${movie.releaseDate}",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //     Container(
              //       padding: EdgeInsets.all(10),
              //       decoration: BoxDecoration(
              //           border: Border.all(color: Colors.white),
              //           borderRadius: BorderRadius.circular(20)),
              //       height: 40,
              //       child: Row(
              //         children: [
              //           Text(
              //             "Rating",
              //             style: TextStyle(color: Colors.white),
              //           ),
              //           Icon(
              //             Icons.star,
              //             color: Colors.amber,
              //           ),
              //           Text(
              //             "${movie.voteAverage}/10",
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
            ]),
          ),
        )
      ]),
    );
  }
}
