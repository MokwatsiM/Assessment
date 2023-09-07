import 'package:question_2/counter_service.dart';
import 'package:question_2/counter_state.dart';

import 'package:redux/redux.dart';

final store = Store<CounterState>(AppReducer.counterReducer, initialState: CounterState(count: 0));
