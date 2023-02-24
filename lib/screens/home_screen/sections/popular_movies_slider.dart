import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/schemas/movie.dart';
import 'package:flutter_movie_app/services/movies/movies_service.dart';

class PopularMoviesSlider extends StatefulWidget {
  const PopularMoviesSlider({super.key, required this.categoryId});

  final int categoryId;

  @override
  State<PopularMoviesSlider> createState() => _PopularMoviesSliderState();
}

class _PopularMoviesSliderState extends State<PopularMoviesSlider> {
  late List<Movie>? movies = [];
  bool isLoading = false;
  final movieService = MoviesService(baseUrl: "");

  @override
  void initState() {
    super.initState();
    _getPopularMovies();
  }

  void _getPopularMovies() async {
    final response = await movieService.getPopularMovies(widget.categoryId);
    setState(() {
      isLoading = true;
      movies = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 430,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            viewportFraction: 0.65,
          ),
          items: [
            for (int i = 0; i < movies!.length; i++)
              Container(
                margin: const EdgeInsets.all(6),
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            movies![i].banners[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "4.8",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      movies![i].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ],
    );
  }
}
