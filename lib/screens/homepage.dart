import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/models/movies_model.dart';
import 'package:tmdb_movie_app/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService services = ApiService();
  List<Movie> movies = [];
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu),
                    Text(
                      "TMDB Movies",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                    Icon(Icons.favorite),
                  ]),
              FutureBuilder(
                  future: services.getMovies(page: page),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      movies = [...movies, ...snapshot.data!];
                      movies = movies.toSet().toList();
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: movies.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: 0.59),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Flexible(
                                  child: Container(
                                      decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500${movies[index].posterPath}'),
                                        fit: BoxFit.fitHeight),
                                  )),
                                ),
                                Text(
                                  movies[index].title.toString(),
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            );
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      page++;
                    });
                  },
                  child: const Text("Load More"))
            ],
          ),
        ),
      ),
    );
  }
}
