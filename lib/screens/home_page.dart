import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants/consts.dart';
import 'package:movie_app/functions/functions.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screens/detailsScreen.dart';
import 'package:movie_app/widgets/movies_widget.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  Functions _functions = Functions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //     child: Image.network(
      //         "https://th.bing.com/th/id/OIF.SOjYr1LIUr6REFlMdGN4HQ?w=329&h=144&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
      //     preferredSize: Size(double.infinity, 120)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              elevation: 0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                //  title: Text('Sliver AppBar Example'),
                background: Image.network(
                  "https://th.bing.com/th/id/OIF.SOjYr1LIUr6REFlMdGN4HQ?w=329&h=144&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Popular Movies",
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Container(
                    height: 300,
                    child: FutureBuilder<List<Movie>?>(
                      future: _functions.getPopularMovies(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return CarouselSlider.builder(
                            itemCount: snapshot.data!.length,
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              animateToClosest: true,
                              viewportFraction: 0.5,
                              autoPlay: true,
                              height: 300,
                            ),
                            itemBuilder: (context, index, realIndex) {
                              return InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          movie: snapshot.data![index]),
                                    )),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.network(
                                      "${Const.imagePath}${snapshot.data![index].posterPath}"),
                                ),
                              );
                            },
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  Text(
                    "Top Rated Movies",
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  FutureBuilder<List<Movie>?>(
                    future: _functions.getTopRatedMovies(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return MoviesWidget(
                          movie: snapshot.data!,
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Upcoming Movies",
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  FutureBuilder<List<Movie>?>(
                    future: _functions.getUpcomingMovies(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return MoviesWidget(
                          movie: snapshot.data!,
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      //  SingleChildScrollView(
      //     child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(
      //       "Tending Movies",
      //       style: GoogleFonts.aBeeZee(
      //         color: Colors.white,
      //         fontSize: 25,
      //       ),
      //     ),
      //     CarouselSlider.builder(
      //       itemCount: 10,
      //       options: CarouselOptions(
      //         enlargeCenterPage: true,
      //         animateToClosest: true,
      //         viewportFraction: 0.5,
      //         autoPlay: true,
      //         height: 300,
      //       ),
      //       itemBuilder: (context, index, realIndex) {
      //         return Container(
      //           margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      //           decoration: BoxDecoration(
      //               color: Colors.amber,
      //               borderRadius: BorderRadius.circular(20)),
      //         );
      //       },
      //     ),
      //     Text(
      //       "Top Rated Movies",
      //       style: GoogleFonts.aBeeZee(
      //         color: Colors.white,
      //         fontSize: 25,
      //       ),
      //     ),
      //     MoviesWidget(),
      //     SizedBox(
      //       height: 20,
      //     ),
      //     Text(
      //       "Upcoming Movies",
      //       style: GoogleFonts.aBeeZee(
      //         color: Colors.white,
      //         fontSize: 25,
      //       ),
      //     ),
      //     MoviesWidget()
      //   ],
      // )),
    );
  }
}
