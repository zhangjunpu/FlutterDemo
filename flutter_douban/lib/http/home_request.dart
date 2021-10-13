import 'package:flutter_douban/model/movie_item.dart';

import 'http_request.dart';

/// 首页请求页面
/// {@author junpu}
/// {@date 2020/9/18}
class HomeRequest {
  static int page = 1;
  static int pageSize = 20;

  /// 获取页码
  static int getPageNum(int page) {
    return page * 20 - 20;
  }

  /// 请求电影列表
  static Future<List<Movie>> requestMovieList(int page) async {
    int pageNum = getPageNum(page);
    var params = {"start": pageNum, "count": pageSize};
    final result = await HttpApi.get("/v2/movie/top250", params: params);

    final subjects = result["subjects"];
    final List<Movie> movies = [];
    for (var item in subjects) {
      var movie = Movie.fromJsonMap(item);
      movies.add(movie);
    }
    print("movies: $movies");
    return movies;
  }
}
