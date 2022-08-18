import 'package:charts_flutter/flutter.dart' as charts;

class ReportSeries {
  final int questionDesc;
  final double averageMarks;
  final charts.Color barColor;

  ReportSeries(
    {
      required this.questionDesc,
      required this.averageMarks,
      required this.barColor
    }
  );

  void add(ReportSeries reportSeries) {}
}