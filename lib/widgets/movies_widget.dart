import 'package:flutter/material.dart';
import 'package:movie_app/constants/consts.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screens/detailsScreen.dart';

class MoviesWidget extends StatelessWidget {
  final List<Movie> movie;
  const MoviesWidget({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      height: 260,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movie.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(movie: movie[index]),
              )),
          child: Container(
            height: 200,
            width: 160,
            margin: EdgeInsets.symmetric(horizontal: 6, vertical: 15),
            child: Image.network(
                "${Const.imagePath}${movie[index].posterPath.toString()}"),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          ),
        ),
      ),
    );
  }
}
