import 'package:flutter/material.dart';

import '../../../../../domain/models/booking.dart';
import 'home_booking_item_card.dart';

class HomeBookingItemsListContainer extends StatelessWidget {
  const HomeBookingItemsListContainer({
    super.key,
    required this.bookings,
  });
  final List<Booking> bookings;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return HomeBookingItemCard(
          booking: booking,
        );
      },
      itemCount: bookings.length,
    );
  }
}
