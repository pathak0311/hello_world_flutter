class Movie {

  static List<Movie> getMovies() => [
    Movie("Titanic", "1980", "James", "English", "https://picsum.photos/200", ["https://picsum.photos/200", "https://picsum.photos/200", "https://picsum.photos/200"]),
    Movie("Avengers", "2000", "Stan", "English", "https://picsum.photos/200", ["https://picsum.photos/200", "https://picsum.photos/200", "https://picsum.photos/200"]),
    Movie("A Quiet Place", "2000", "Stan", "English", "https://picsum.photos/200", ["https://picsum.photos/200", "https://picsum.photos/200", "https://picsum.photos/200"]),
    Movie("The Office", "2000", "Stan", "English", "https://picsum.photos/200", ["https://picsum.photos/200", "https://picsum.photos/200", "https://picsum.photos/200"]),
    Movie("FRIENDS", "2000", "Stan", "English", "https://picsum.photos/200", ["https://picsum.photos/200", "https://picsum.photos/200", "https://picsum.photos/200"]),
  ];

  String title;
  String year;
  String director;
  String language;
  String image;
  List<String> posters;

  Movie(this.title, this.year, this.director, this.language, this.image, this.posters);
}