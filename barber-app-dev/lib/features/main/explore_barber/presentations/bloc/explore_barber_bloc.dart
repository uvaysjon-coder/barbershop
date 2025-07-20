import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'explore_barber_event.dart';
part 'explore_barber_state.dart';

class ExploreBarberBloc extends Bloc<ExploreBarberEvent, ExploreBarberState> {
  ExploreBarberBloc() : super(ExploreBarberInitial()) {
    on<ExploreBarberEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
