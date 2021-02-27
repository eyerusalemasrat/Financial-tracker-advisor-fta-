import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:FTA/Record/Bloc/bloc.dart';
import 'package:FTA/Record/Record.dart';
import 'package:FTA/Record/Repository/Record_repository.dart';

import 'Record_event.dart';

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  final RecordRepository RecordRepository;

  RecordBloc({@required this.RecordRepository})
      : assert(RecordRepository != null),
        super(RecordLoading());

  @override
  Stream<RecordState> mapEventToState(RecordEvent event) async* {
    if (event is RecordLoad) {
      yield RecordLoading();
      try {
        final Records = await RecordRepository.getRecords();
        yield RecordsLoadSuccess(Records);
      } catch (_) {
        yield RecordOperationFailure();
      }
    }

    if (event is RecordCreate) {
      try {
        await RecordRepository.createRecord(event.Record);
        final Records = await RecordRepository.getRecords();
        yield RecordsLoadSuccess(Records);
      } catch (_) {
        yield RecordOperationFailure();
      }
    }

    if (event is RecordUpdate) {
      try {
        await RecordRepository.updateRecord(event.Record);
        final Records = await RecordRepository.getRecords();
        yield RecordsLoadSuccess(Records);
      } catch (_) {
        yield RecordOperationFailure();
      }
    }

    if (event is RecordDelete) {
      try {
        await RecordRepository.deleteRecord(event.Record.id);
        final Records = await RecordRepository.getRecords();
        yield RecordsLoadSuccess(Records);
      } catch (_) {
        yield RecordOperationFailure();
      }
    }
  }
}
