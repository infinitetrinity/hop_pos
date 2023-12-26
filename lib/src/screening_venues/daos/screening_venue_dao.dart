import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venue.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venues_table.dart';

part 'screening_venue_dao.g.dart';

@DriftAccessor(tables: [ScreeningVenuesTable])
class ScreeningVenueDao extends DatabaseAccessor<AppDb>
    with _$ScreeningVenueDaoMixin {
  ScreeningVenueDao(AppDb db) : super(db);

  Future<ScreeningVenue> insertScreeningVenue(
      ScreeningVenuesTableCompanion venue) async {
    return await into(screeningVenuesTable).insertReturning(venue);
  }

  Future<List<ScreeningVenue>> insertScreeningVenues(
      List<ScreeningVenuesTableCompanion> venues) async {
    return await transaction(() async {
      List<Future<ScreeningVenue>> insertFutures = [];

      for (ScreeningVenuesTableCompanion venue in venues) {
        insertFutures.add(insertScreeningVenue(venue));
      }

      List<ScreeningVenue> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateScreeningVenue(
      ScreeningVenuesTableCompanion venue, Expression<bool> where) async {
    final count =
        await (update(screeningVenuesTable)..where((_) => where)).write(venue);
    return count > 0;
  }
}
