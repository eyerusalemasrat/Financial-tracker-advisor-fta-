import 'package:meta/meta.dart';
import 'package:login/news/news.dart';

class NewsRepository {
  final NewsDataProvider dataProvider;

  NewsRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<News> createNews(News news) async {
    return await dataProvider.createNews(news);
  }

  Future<List<News>> getNewss() async {
    return await dataProvider.getNewss();
  }

  Future<void> updateNews(News news) async {
    await dataProvider.updateNews(news);
  }

  Future<void> deleteNews(String id) async {
    await dataProvider.deleteNews(id);
  }
}
