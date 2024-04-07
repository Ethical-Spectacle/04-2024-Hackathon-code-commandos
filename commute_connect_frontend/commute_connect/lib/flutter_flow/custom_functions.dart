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

int? newCustomFunction(
  int depart,
  int arrival,
) {
  var diff = arrival - depart;
  if (diff <= 2880) {
    return 1;
  } else if (diff >= 2880 && diff <= 5640) {
    return 2;
  } else if (diff >= 5640 && diff <= 7440) {
    return 3;
  }
  return 4;
}
