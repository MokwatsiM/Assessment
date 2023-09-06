import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_1/events/counter_events.dart';
import 'package:question_1/states/counter_states.dart';
import 'package:question_1/states/initial_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc() : super(InitiateState()) {
    on<Increment>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });

    on<Decrement>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
  }
}
