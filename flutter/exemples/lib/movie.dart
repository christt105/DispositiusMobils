class Movie {
  String title, pg, overview;
  int year, minutes;
  String posterURL;
  List<String> genres;
  List<String> directors, writers, actors;

  Movie(
    this.title,
    this.pg,
    this.overview,
    this.year,
    this.minutes,
    this.posterURL,
    this.genres,
    this.directors,
    this.writers,
    this.actors,
  );
}

final lotr = Movie(
  'The Lord of the Rings',
  'PG-13',
  'Frodo Bolsón es un hobbit al que su tío Bilbo hace '
      'portador del poderoso Anillo Único, capaz de otorgar'
      ' un poder ilimitado al que la posea, con la finalidad '
      'de destruirlo. Sin embargo, fuerzas malignas muy '
      'poderosas quieren arrebatárselo.',
  2001,
  178,
  'assets/lotr.jpg',
  ['Adventure', 'Drama', 'Fantasy'],
  ['Peter Jackson'],
  [
    'J.R.R. Tolkien (writer)',
    'Fran Walsh (screenplay)',
    'Philippa Boyens (screenplay)',
    'Peter Jackson (screenplay)',
  ],
  [
    'Elijah Wood',
    'Sala Baker',
    'Sean Bean',
    'Cate Blanchett',
    'Orlando Bloom',
    'Billy Boyd',
    'Marton Csokas',
    'Megan Edwards',
    'Michael Elsworth',
    'Mark Ferguson',
    'Ian Holm',
    'Christopher Lee',
    'Lawrence Makoare',
    'Andy Serkis',
    'Brent McIntyre',
    'Ian McKellen',
    'Peter McKenzie',
    'Sarah McLeod',
    'Dominic Monaghan',
    'Viggo Mortensen',
    'Ian Mune',
    'Craig Parker',
    'Cameron Rhodes',
    'Davies	John Rhys-Davies',
    'Martyn Sanderson',
    'Harry Sinclair',
    'Liv Tyler',
    'David Weatherley',
    'Hugo Weaving',
  ],
);
