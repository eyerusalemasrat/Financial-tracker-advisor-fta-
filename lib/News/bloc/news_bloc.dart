import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:FTA/News/Bloc/bloc.dart';
import 'package:FTA/News/News.dart';
import 'package:FTA/News/Repository/news_repository.dart';

import 'news_event.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository NewsRepository;

  NewsBloc({@required this.NewsRepository})
      : assert(NewsRepository != null),
        super(NewsLoading());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsLoad) {
      yield NewsLoading();
      try {
        final Newss = await NewsRepository.getNewss();
        yield NewssLoadSuccess(Newss);
      } catch (_) {
        yield NewsOperationFailure();
      }
    }

    if (event is NewsCreate) {
      try {
        await NewsRepository.createNews(event.News);
        final Newss = await NewsRepository.getNewss();
        yield NewssLoadSuccess(Newss);
      } catch (_) {
        yield NewsOperationFailure();
      }
    }

    if (event is NewsUpdate) {
      try {
        await NewsRepository.updateNews(event.News);
        final Newss = await NewsRepository.getNewss();
        yield NewssLoadSuccess(Newss);
      } catch (_) {
        yield NewsOperationFailure();
      }
    }

    if (event is NewsDelete) {
      try {
        await NewsRepository.deleteNews(event.News.id);
        final Newss = await NewsRepository.getNewss();
        yield NewssLoadSuccess(Newss);
      } catch (_) {
        yield NewsOperationFailure();
      }
    }
  }
}
