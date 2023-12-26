import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/screening_venues/daos/screening_venue_dao.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venue.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_venue_repository.g.dart';

@riverpod
ScreeningVenueRepository screeningVenueRepo(ScreeningVenueRepoRef ref) {
  return ScreeningVenueRepository(
    screeningVenueDao:
        ref.watch(appDbProvider.select((prov) => prov.screeningVenueDao)),
  );
}

class ScreeningVenueRepository {
  final ScreeningVenueDao screeningVenueDao;

  ScreeningVenueRepository({
    required this.screeningVenueDao,
  });

  Future<ScreeningVenue> insert(ScreeningVenuesTableCompanion venue) async {
    return await screeningVenueDao.insertScreeningVenue(venue);
  }

  Future<List<ScreeningVenue>> insertMany(
      List<ScreeningVenuesTableCompanion> venues) async {
    return await screeningVenueDao.insertScreeningVenues(venues);
  }

  Future<bool> update(
      ScreeningVenuesTableCompanion venue, Expression<bool> where) async {
    return await screeningVenueDao.updateScreeningVenue(venue, where);
  }
}
