part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {}

class ChangePageIndex extends HomeEvent {
  final int index;

  ChangePageIndex(this.index);

  @override
  List<Object?> get props => [index];
}

class FilterSummitButton extends HomeEvent {
  FilterSummitButton();

  @override
  List<Object?> get props => [];
}

class BuildState extends HomeEvent {
  BuildState();

  @override
  List<Object?> get props => [];
}

class ExploreBarber extends HomeEvent {

  ExploreBarber();

  @override
  List<Object?> get props => [];
}

class UserLocation extends HomeEvent {
  final Position position;
  UserLocation(this.position);

  @override
  List<Object?> get props => [position];
}

class UserDeniedLocation extends HomeEvent {
  UserDeniedLocation();

  @override
  List<Object?> get props => [];
}
class HomePageEntered extends HomeEvent {
  HomePageEntered();

  @override
  List<Object?> get props => [];
}

class GetBarber extends HomeEvent {
  final String id;

  GetBarber(this.id);

  @override
  List<Object?> get props => [id];


}

class SearchBarber extends HomeEvent {
  final String query;
  SearchBarber(this.query);

  @override
  List<Object?> get props => [query];
}

class PaginationBarbers extends HomeEvent {
  PaginationBarbers();

  @override
  List<Object?> get props => [];
}

class RefreshBarbers extends HomeEvent {
  RefreshBarbers();

  @override
  List<Object?> get props => [];
}

class FilterHaircutStyles extends HomeEvent {
  final String haircutStyles;
  FilterHaircutStyles(this.haircutStyles);

  @override
  List<Object?> get props => [haircutStyles];
}

class FilterMinRating extends HomeEvent {
  final double minRating;
  FilterMinRating(this.minRating);

  @override
  List<Object?> get props => [minRating];
}

class FilterNearestDistance extends HomeEvent {
  final double nearestDistance;
  FilterNearestDistance(this.nearestDistance);

  @override
  List<Object?> get props => [nearestDistance];
}

class FilterFarthestDistance extends HomeEvent {
  final double farthestDistance;
  FilterFarthestDistance(this.farthestDistance);

  @override
  List<Object?> get props => [farthestDistance];
}

class FilterReset extends HomeEvent {
  FilterReset();

  @override
  List<Object?> get props => [];
}

class FilterSaveButton extends HomeEvent {
  FilterSaveButton();

  @override
  List<Object?> get props => [];
}