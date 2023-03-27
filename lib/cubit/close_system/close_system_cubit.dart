import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'close_system_state.dart';

class CloseSystemCubit extends Cubit<CloseSystemState> {
  CloseSystemCubit() : super(CloseSystemInitial());
}
