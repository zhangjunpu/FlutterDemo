var movieRankIndex = 0;

/// 电影Item
/// {@author junpu}
/// {@date 2020/9/18}
class Movie {
  int rank = ++movieRankIndex;
  List<Person>? casts;
  int comments_count;
  List<String>? countries;
  List<Person>? directors;
  List<String>? genres;
  int id;
  Images? images;
  String? original_title;
  Rating? rating;
  int reviews_count;
  String? summary;
  String? title;
  String? warning;
  int wish_count;
  int year;

  Movie.fromJsonMap(Map<String, dynamic> map)
      : casts = List<Person>.from(map["casts"].map((it) => Person.fromJsonMap(it))),
        comments_count = map["comments_count"],
        countries = List<String>.from(map["countries"]),
        directors = List<Person>.from(
            map["directors"].map((it) => Person.fromJsonMap(it))),
        genres = List<String>.from(map["genres"]),
        id = map["id"],
        images = Images.fromJsonMap(map["images"]),
        original_title = map["original_title"],
        rating = Rating.fromJsonMap(map["rating"]),
        reviews_count = map["reviews_count"],
        summary = map["summary"],
        title = map["title"],
        warning = map["warning"],
        wish_count = map["wish_count"],
        year = map["year"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['casts'] = this.casts?.map((v) => v.toJson()).toList();
    data['comments_count'] = comments_count;
    data['countries'] = countries;
    data['directors'] = this.directors?.map((v) => v.toJson()).toList();
    data['genres'] = genres;
    data['id'] = id;
    data['images'] = images?.toJson();
    data['original_title'] = original_title;
    data['rating'] = rating?.toJson();
    data['reviews_count'] = reviews_count;
    data['summary'] = summary;
    data['title'] = title;
    data['warning'] = warning;
    data['wish_count'] = wish_count;
    data['year'] = year;
    return data;
  }
}

/// 演员
/// {@author junpu}
/// {@date 2020/9/18}
class Person {
  Images? avatars;
  String? name;

  Person.fromJsonMap(Map<String, dynamic> map)
      : avatars = Images.fromJsonMap(map["avatars"]),
        name = map["name"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatars'] = avatars?.toJson();
    data['name'] = name;
    return data;
  }
}

/// 图片
/// {@author junpu}
/// {@date 2020/9/18}
class Images {
  String? large;

  Images.fromJsonMap(Map<String, dynamic> map) : large = map["large"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = large;
    return data;
  }
}

/// 评分
/// {@author junpu}
/// {@date 2020/9/18}
class Rating {
  double average;
  int max;
  int min;
  String? stars;

  Rating.fromJsonMap(Map<String, dynamic> map)
      : average = map["average"],
        max = map["max"],
        min = map["min"],
        stars = map["stars"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = average;
    data['max'] = max;
    data['min'] = min;
    data['stars'] = stars;
    return data;
  }
}
