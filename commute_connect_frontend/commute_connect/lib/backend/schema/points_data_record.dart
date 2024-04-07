import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PointsDataRecord extends FirestoreRecord {
  PointsDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "latitude" field.
  List<double>? _latitude;
  List<double> get latitude => _latitude ?? const [];
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  List<double>? _longitude;
  List<double> get longitude => _longitude ?? const [];
  bool hasLongitude() => _longitude != null;

  // "colors" field.
  List<Color>? _colors;
  List<Color> get colors => _colors ?? const [];
  bool hasColors() => _colors != null;

  // "start_times" field.
  List<String>? _startTimes;
  List<String> get startTimes => _startTimes ?? const [];
  bool hasStartTimes() => _startTimes != null;

  // "end_times" field.
  List<String>? _endTimes;
  List<String> get endTimes => _endTimes ?? const [];
  bool hasEndTimes() => _endTimes != null;

  void _initializeFields() {
    _latitude = getDataList(snapshotData['latitude']);
    _longitude = getDataList(snapshotData['longitude']);
    _colors = getColorsList(snapshotData['colors']);
    _startTimes = getDataList(snapshotData['start_times']);
    _endTimes = getDataList(snapshotData['end_times']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('points_data');

  static Stream<PointsDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PointsDataRecord.fromSnapshot(s));

  static Future<PointsDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PointsDataRecord.fromSnapshot(s));

  static PointsDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PointsDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PointsDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PointsDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PointsDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PointsDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPointsDataRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PointsDataRecordDocumentEquality implements Equality<PointsDataRecord> {
  const PointsDataRecordDocumentEquality();

  @override
  bool equals(PointsDataRecord? e1, PointsDataRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.latitude, e2?.latitude) &&
        listEquality.equals(e1?.longitude, e2?.longitude) &&
        listEquality.equals(e1?.colors, e2?.colors) &&
        listEquality.equals(e1?.startTimes, e2?.startTimes) &&
        listEquality.equals(e1?.endTimes, e2?.endTimes);
  }

  @override
  int hash(PointsDataRecord? e) => const ListEquality()
      .hash([e?.latitude, e?.longitude, e?.colors, e?.startTimes, e?.endTimes]);

  @override
  bool isValidKey(Object? o) => o is PointsDataRecord;
}
