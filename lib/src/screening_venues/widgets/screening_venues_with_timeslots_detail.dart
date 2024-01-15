import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venue_with_timeslots.dart';

class ScreeningVenusWithTimelotsDetail extends StatelessWidget {
  const ScreeningVenusWithTimelotsDetail({super.key, required this.venues});
  final List<ScreeningVenueWithTimeslots> venues;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (final item in venues)
              for (final timeslot in item.orderedTimeslots)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: AppColors.gray200,
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(item.venue.fullAddress ?? item.venue.name),
                          SelectableText(
                            timeslot.displayDateTime,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.green600,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SelectableText(timeslot.displaySlots),
                          if (timeslot.hasSpecimentCollection) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: AppColors.gray400,
                              ),
                            ),
                            const SelectableText('Specimen Collection'),
                            if (!timeslot.specimenCollectionVenue.isNullOrEmpty) SelectableText('Venue: ${timeslot.specimenCollectionVenue}'),
                            if (timeslot.displaySpecimenCollectionDate != null) SelectableText('Date: ${timeslot.displaySpecimenCollectionDate}'),
                            if (!timeslot.specimenCollectionTime.isNullOrEmpty) SelectableText('Time: ${timeslot.specimenCollectionTime}'),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
