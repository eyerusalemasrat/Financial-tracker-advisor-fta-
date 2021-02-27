import 'package:meta/meta.dart';
import 'package:FTA/News/News.dart';

class NewsRepository {
  final NewsDataProvider dataProvider;

  NewsRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Future<News> createNews(News News) async {
    return await dataProvider.createNews(News);
  }

  Future<List<News>> getNewss() async {
    return await dataProvider.getNewss();
  }

  Future<void> updateNews(News News) async {
    await dataProvider.updateNews(News);
  }

  Future<void> deleteNews(String id) async {
    await dataProvider.deleteNews(id);
  }
}
