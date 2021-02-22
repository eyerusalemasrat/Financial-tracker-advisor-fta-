import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/News/bloc/bloc.dart';
import 'package:login/News/news.dart';
import 'package:login/News/repository/repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository courseRepository;

  NewsBloc({@required this.courseRepository})
      : assert(courseRepository != null),
        super(NewsLoading());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsLoad) {
      yield NewsLoading();
      try {
        final courses = await courseRepository.getNewss();
        yield NewssLoadSuccess(courses);
      } catch (_) {
        yield NewsOperationFailure();
      }
    }

    if (event is NewsCreate) {
      try {
        await courseRepository.createNews(event.course);
        final courses = await courseRepository.getNewss();
        yield NewssLoadSuccess(courses);
      } catch (_) {
        yield NewsOperationFailure();
      }
    }

    if (event is NewsUpdate) {
      try {
        await courseRepository.updateNews(event.course);
        final courses = await courseRepository.getNewss();
        yield NewssLoadSuccess(courses);
      } catch (_) {
        yield NewsOperationFailure();
      }
    }

    if (event is NewsDelete) {
      try {
        await courseRepository.deleteNews(event.course.id);
        final courses = await courseRepository.getNewss();
        yield NewssLoadSuccess(courses);
      } catch (_) {
        yield NewsOperationFailure();
      }
    }
  }
}
