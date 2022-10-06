

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';

class ReportSeries {
  final int questionDesc;
  final double averageMarks;

  ReportSeries(
    {
      required this.questionDesc,
      required this.averageMarks,
    }
  );

  void add(ReportSeries reportSeries) {}
}