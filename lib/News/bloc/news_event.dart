import 'package:equatable/equatable.dart';
import 'package:login/News/news.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class NewsLoad extends NewsEvent {
  const NewsLoad();

  @override
  List<Object> get props => [];
}

class NewsCreate extends NewsEvent {
  final News course;

  const NewsCreate(this.course);

  @override
  List<Object> get props => [course];

  @override
  String toString() => 'News Created {course: $course}';
}

class NewsUpdate extends NewsEvent {
  final News course;

  const NewsUpdate(this.course);

  @override
  List<Object> get props => [course];

  @override
  String toString() => 'News Updated {course: $course}';
}

class NewsDelete extends NewsEvent {
  final News course;

  const NewsDelete(this.course);

  @override
  List<Object> get props => [course];

  @override
  toString() => 'News Deleted {course: $course}';
}
