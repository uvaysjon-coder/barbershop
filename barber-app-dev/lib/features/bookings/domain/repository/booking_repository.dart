
import 'package:barbershop/core/entities/booking_entities.dart';

import '../../../../core/exceptions/failures.dart';
import '../../../../core/utils/either.dart';

abstract interface class BookingRepository {

  Future<Either<Failure, List<BookingEntities>>>getAllBooking(String userID);

}