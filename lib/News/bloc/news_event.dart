import 'package:FTA/News/news.dart';
import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class NewsLoad extends NewsEvent {
  const NewsLoad();

  @override
  List<Object> get props => [];
}

class NewsCreate extends NewsEvent {
  final News News;

  const NewsCreate(this.News);

  @override
  List<Object> get props => [News];

  @override
  String toString() => 'News Created {News: $News}';
}

class News {}

class NewsUpdate extends NewsEvent {
  final News News;

  const NewsUpdate(this.News);

  @override
  List<Object> get props => [News];

  @override
  String toString() => 'News Updated {News: $News}';
}

class NewsDelete extends NewsEvent {
  final News News;

  const NewsDelete(this.News);

  @override
  List<Object> get props => [News];

  @override
  toString() => 'News Deleted {News: $News}';
}
