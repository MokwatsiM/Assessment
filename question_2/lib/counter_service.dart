import 'package:question_2/counter_state.dart';

enum CounterAction { increment, decrement }

class AppReducer {
  static CounterState counterReducer(CounterState state, dynamic action) {
    if (action == CounterAction.increment) {
      return CounterState(count: state.count + 1);
    } else if (action == CounterAction.decrement) {
      return CounterState(count: state.count - 1);
    }
    return state;
  }
}
