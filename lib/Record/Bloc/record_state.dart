import 'package:equatable/equatable.dart';
import 'package:FTA/Record/Record.dart';

class RecordState extends Equatable {
  const RecordState();

  @override
  List<Object> get props => [];
}

class RecordLoading extends RecordState {}

class RecordsLoadSuccess extends RecordState {
  final List<Record> Records;

  RecordsLoadSuccess([this.Records = const []]);

  @override
  List<Object> get props => [Records];
}

class RecordOperationFailure extends RecordState {}
