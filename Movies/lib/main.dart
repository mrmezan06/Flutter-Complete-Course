import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/movie.dart';

void main() {
  runApp(MaterialApp(
    home: MoviesListView(),
  ));
}

class MoviesListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  /*
  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
    "Vikings",
    "Vikings"
  ];
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Positioned(child: movieCard(movieList[index], context)),
                Positioned(
                    top: 30.0, child: movieImage(movieList[index].images[0])),
              ],
            );
            /*
            return Card(
              elevation: 4.5,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(movieList[index].images[0]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(14.9),
                    ),
                    //child: Text("H"),
                  ),
                ),
                trailing: Text("..."),
                title: Text(movieList[index].title),
                subtitle: Text("${movieList[0].title}"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetails(
                                movieName: movieList[index].title,
                                movie: movieList[index],
                              )));
                },
                //onTap: () => debugPrint("Movie name: ${movies[index]}"),
              ),
            );*/
          }),
    );
  }

  TextStyle mainTextStyle() {
    return const TextStyle(fontSize: 13.0, color: Colors.grey);
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 40.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.9),
          ),
          color: Colors.black45,
          child: Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "Rating: ${movie.imdbRating} / 10",
                        style: mainTextStyle(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Released: ${movie.released}",
                        style: mainTextStyle(),
                      ),
                      Text(
                        movie.runtime,
                        style: mainTextStyle(),
                      ),
                      Text(
                        movie.rated,
                        style: mainTextStyle(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetails(
                      movieName: movie.title,
                      movie: movie,
                    ))),
      },
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(
                imageUrl ?? "https://i.ibb.co/9Nc4HWg/43064536.jpg"),
            fit: BoxFit.cover,
          )),
    );
  }
/*Movie MovieObject(int index){
    return new Movie(movieList[index].title,
        movieList[index].year,
        movieList[index].rated,
        movieList[index].released,
        movieList[index].runtime,
        movieList[index].genre,
        movieList[index].director,
        movieList[index].writer,
        movieList[index].actors,
        movieList[index].plot,
        movieList[index].language,
        movieList[index].country,
        movieList[index].awards,
        movieList[index].poster,
        movieList[index].metascore,
        movieList[index].imdbRating,
        movieList[index].imdbVotes,
        movieList[index].imdbID,
        movieList[index].type,
        movieList[index].response,
        movieList[index].images);
  }*/
}

/*
* New route or screen
* */
class MovieDetails extends StatelessWidget {
  final Movie movie;

  final String movieName;

  const MovieDetails({Key? key, required this.movieName, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies : ${this.movieName}"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
        ],
      ),
      /*body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go Back"),
          ),
        ),
      ),*/
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key? key, required this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(thumbnail),
                fit: BoxFit.cover,
              )),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: 80,
        )
      ],
    );
  }
}
