import 'package:equatable/equatable.dart';
import 'package:FTA/News/News.dart';

class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {}

class NewssLoadSuccess extends NewsState {
  final List<News> Newss;

  NewssLoadSuccess([this.Newss = const []]);

  @override
  List<Object> get props => [Newss];
}

class NewsOperationFailure extends NewsState {}
