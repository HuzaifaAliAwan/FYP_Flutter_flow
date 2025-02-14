import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getGoogleMapUrl(
  LatLng? propertyLngLat,
  LatLng? currentLngLat,
) {
  if (propertyLngLat == null || currentLngLat == null) {
    return null; // Return null if any of the locations are not provided
  }

  final String googleMapsUrl =
      "https://www.google.com/maps/dir/?api=1&origin=${currentLngLat.latitude},${currentLngLat.longitude}&destination=${propertyLngLat.latitude},${propertyLngLat.longitude}&travelmode=driving";

  return googleMapsUrl;
}

bool isBookingAvailable(
  DateTime newCheckin,
  DateTime newCheckout,
  List<BookingRecord> bookings,
) {
  Set<DateTime> bookedDates = {};

  // Loop through all existing bookings
  for (var booking in bookings) {
    DateTime? checkIn = booking.checkInDate;
    DateTime? checkOut = booking.checkOutDate;

    // Add all booked dates to the set
    for (int i = 0; i <= checkOut!.difference(checkIn!).inDays; i++) {
      bookedDates.add(DateTime(checkIn.year, checkIn.month, checkIn.day + i));
    }
  }

  // Check if any date in the new range is already booked
  for (int i = 0; i <= newCheckout.difference(newCheckin).inDays; i++) {
    if (bookedDates.contains(
        DateTime(newCheckin.year, newCheckin.month, newCheckin.day + i))) {
      return false; // Collision found, booking is not available
    }
  }

  return true; // No collision, booking is available
}

double totalPriceOfBooking(
  DateTime checkIn,
  DateTime checkOut,
  double pricePerDay,
) {
  int numberOfDays = checkOut.difference(checkIn).inDays; // Get the total days
  return numberOfDays * pricePerDay; // Multiply by price per day
}
