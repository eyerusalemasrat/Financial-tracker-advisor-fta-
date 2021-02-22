import 'package:equatable/equatable.dart';
import 'package:login/News/news.dart';

class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {}

class NewssLoadSuccess extends NewsState {
  final List<News> courses;

  NewssLoadSuccess([this.courses = const []]);

  @override
  List<Object> get props => [courses];
}

class NewsOperationFailure extends NewsState {}
