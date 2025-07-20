import 'package:equatable/equatable.dart';

import 'barber_entities.dart';

/*"totalItems": 20,
"totalPages": 2,
"currentPage": 1,
"pageSize": 10,
"barbers": [ */

class HomeResponseEntities extends Equatable {
  final int totalItems;
  final int totalPages;
  final int currentPage;
  final int pageSize;
  final List<BarberEntities> barbers;

  const HomeResponseEntities({
    this.totalItems = 0,
    this.totalPages = 0,
    this.currentPage = 1,
    this.pageSize = 0,
    this.barbers = const [],
  });

  @override
  List<Object?> get props =>
      [totalItems, totalPages, currentPage, pageSize, barbers];

  @override
  String toString() {
    return 'HomeResponseEntities{totalItems: $totalItems, totalPages: $totalPages, currentPage: $currentPage, pageSize: $pageSize, barbers: $barbers}';
  }
}
