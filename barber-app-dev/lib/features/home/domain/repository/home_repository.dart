import 'package:barbershop/core/entities/home_response_entities.dart';

import '../../../../core/entities/home_query_entities.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../../core/utils/either.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeResponseEntities>> getHome(
    HomeQueryEntities homeQueryEntities,
  );
}
