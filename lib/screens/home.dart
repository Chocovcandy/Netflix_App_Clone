import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app_clone/api/api.dart';
import '../model/movie_model.dart';
import 'movie_detailed_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //* Create variables for popularMovies
  late Future<List<Movie>> popularMovies;

  //* Create variables for upcomingMovies
  late Future<List<Movie>> upcomingMovies;

  //* Create variables for topRatedMovies
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    //* Initialize popularMovies
    upcomingMovies = Api().getPopularMovies();

    //* Initialize upcomingMovies
    upcomingMovies = Api().getUpcomingMovies();

    //* Initialize topRatedMovies
    popularMovies = Api().getTopRatedMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* Set background color with Colors.black12
      backgroundColor: Colors.black12,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        //* Create "Netflix logo"
        leading: Image.asset('assets/netflix.png', height: 50),

        //* Create "User icon"
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/user_logo.png'),
          ),
          SizedBox(width: 15),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              //* Create upcoming movie section. Use 'CarouselSlider.builder' instead of 'ListView.builder' . Use backDropPath as url of network image. Refer below Popular section!!

              //* Upcoming Movies
              const Text(
                'Upcoming',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final movies = snapshot.data!;
                    return CarouselSlider.builder(
                      options: CarouselOptions(height: 200, autoPlay: true),
                      itemCount: movies.length,
                      itemBuilder: (context, index, realIdx) {
                        final movie = movies[index];
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(
                                    movie: movies[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 150,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ));
                      },
                    );
                  },
                ),
              ),

              //* Popular Movies
              const Text(
                'Popular',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final movies = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];

                        return InkWell(
                            onTap: () {
                              //* You should understand it. It gives movie data to MovieDetailScreen.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(
                                    movie: movies[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 150,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ));
                      },
                    );
                  },
                ),
              ),

              //* Create Top Rated movie section. Use posterPath as url of network image. Refer Popular section!!
              const Text(
                'Top Rated',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final movies = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];

                        return InkWell(
                            onTap: () {
                              //* You should understand it. It gives movie data to MovieDetailScreen.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(
                                    movie: movies[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 150,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ));
                      },
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
