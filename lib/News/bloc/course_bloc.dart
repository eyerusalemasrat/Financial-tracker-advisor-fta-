import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/News/bloc/bloc.dart';
import 'package:login/News/News.dart';
import 'package:login/News/repository/repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc({@required this.newsRepository})
      : assert(newsRepository != null),
        super(NewsLoading());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsLoad) {
      yield NewsLoading();
      try {
        final newss = await newsRepository.getNewss();
        yield NewssLoadSuccess(newss);
      } catch (_) {
        yield NewsOperationFailure();
      }
    }

    if (event is NewsCreate) {
      try {
        await newsRepository.createNews(event.news);
        final newss = await newsRepository.getNewss();
        yield NewssLoadSuccess(newss);
      } catch (_) {
        yield NewsOperationFailure();
      }
    }

    if (event is NewsUpdate) {
      try {
        await newsRepository.updateNews(event.news);
        final newss = await newsRepository.getNewss();
        yield NewssLoadSuccess(newss);
      } catch (_) {
        yield NewsOperationFailure();
      }
    }

    if (event is NewsDelete) {
      try {
        await newsRepository.deleteNews(event.news.id);
        final newss = await newsRepository.getNewss();
        yield NewssLoadSuccess(newss);
      } catch (_) {
        yield NewsOperationFailure();
      }
    }
  }
}
