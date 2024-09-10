import 'package:flutter/material.dart';
import '../model/movie_model.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailScreen({super.key, required this.movie});

  @override
  MovieDetailScreenState createState() => MovieDetailScreenState();
}

class MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
          child: Column(
        children: [
          //* Put the back drop image with "https://image.tmdb.org/t/p/original/${widget.movie.backDropPath}". Don't forget there is back button on the image of left top side.
          Stack(
            children: [
              //* Backdrop image
              Container(
                width: size.width,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/original/${widget.movie.backDropPath}",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //* Back button of top left
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO: Put the title, relased date, and overview
                Row(
                  children: [
                    //* title
                    Text(
                      widget.movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    //* Released Date
                    Text(
                      " ${widget.movie.releaseDate}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                //* overview
                const SizedBox(height: 10),
                Text(
                  "${widget.movie.overview}",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../model/movie_model.dart';

// class MovieDetailScreen extends StatefulWidget {
//   final Movie movie;
//   const MovieDetailScreen({super.key, required this.movie});

//   @override
//   MovieDetailScreenState createState() => MovieDetailScreenState();
// }

// class MovieDetailScreenState extends State<MovieDetailScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.black12,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Backdrop image with back button
//             Stack(
//               children: [
//                 // Backdrop image
//                 Container(
//                   width: size.width,
//                   height: size.height * 0.4,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage(
//                         "https://image.tmdb.org/t/p/original/${widget.movie.backDropPath}",
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 // Back button
//                 Positioned(
//                   top: 40,
//                   left: 10,
//                   child: IconButton(
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//               ],
//             ),

//             Padding(
//               padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Movie Title
//                   Text(
//                     widget.movie.title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   // Released Date
//                   SizedBox(height: 10),
//                   Text(
//                     "Release Date: ${widget.movie.releaseDate}",
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                     ),
//                   ),

//                   // Overview
//                   SizedBox(height: 20),
//                   Text(
//                     "Overview",
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     widget.movie.overview,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
