import 'package:quizzie_thunder/utils/wonder_app_strings.dart';


class TimelineEvent {
  TimelineEvent(this.year, this.description);
  final int year;
  final String description;
}

class GlobalEventsData {
  final globalEvents = [
    TimelineEvent(-2900, AppStrings().timelineEvent2900bce),
    TimelineEvent(-2700, AppStrings().timelineEvent2700bce),
    TimelineEvent(-2600, AppStrings().timelineEvent2600bce),
    TimelineEvent(-2560, AppStrings().timelineEvent2560bce),
    TimelineEvent(-2500, AppStrings().timelineEvent2500bce),
    TimelineEvent(-2200, AppStrings().timelineEvent2200bce),
    TimelineEvent(-2000, AppStrings().timelineEvent2000bce),
    TimelineEvent(-1800, AppStrings().timelineEvent1800bce),
    TimelineEvent(-890, AppStrings().timelineEvent890bce),
    TimelineEvent(-776, AppStrings().timelineEvent776bce),
    TimelineEvent(-753, AppStrings().timelineEvent753bce),
    TimelineEvent(-447, AppStrings().timelineEvent447bce),
    TimelineEvent(-427, AppStrings().timelineEvent427bce),
    TimelineEvent(-322, AppStrings().timelineEvent322bce),
    TimelineEvent(-200, AppStrings().timelineEvent200bce),
    TimelineEvent(-44, AppStrings().timelineEvent44bce),
    TimelineEvent(-4, AppStrings().timelineEvent4bce),
    TimelineEvent(43, AppStrings().timelineEvent43ce),
    TimelineEvent(79, AppStrings().timelineEvent79ce),
    TimelineEvent(455, AppStrings().timelineEvent455ce),
    TimelineEvent(500, AppStrings().timelineEvent500ce),
    TimelineEvent(632, AppStrings().timelineEvent632ce),
    TimelineEvent(793, AppStrings().timelineEvent793ce),
    TimelineEvent(800, AppStrings().timelineEvent800ce),
    TimelineEvent(1001, AppStrings().timelineEvent1001ce),
    TimelineEvent(1077, AppStrings().timelineEvent1077ce),
    TimelineEvent(1117, AppStrings().timelineEvent1117ce),
    TimelineEvent(1199, AppStrings().timelineEvent1199ce),
    TimelineEvent(1227, AppStrings().timelineEvent1227ce),
    TimelineEvent(1337, AppStrings().timelineEvent1337ce),
    TimelineEvent(1347, AppStrings().timelineEvent1347ce),
    TimelineEvent(1428, AppStrings().timelineEvent1428ce),
    TimelineEvent(1439, AppStrings().timelineEvent1439ce),
    TimelineEvent(1492, AppStrings().timelineEvent1492ce),
    TimelineEvent(1760, AppStrings().timelineEvent1760ce),
    TimelineEvent(1763, AppStrings().timelineEvent1763ce),
    TimelineEvent(1783, AppStrings().timelineEvent1783ce),
    TimelineEvent(1789, AppStrings().timelineEvent1789ce),
    TimelineEvent(1914, AppStrings().timelineEvent1914ce),
    TimelineEvent(1929, AppStrings().timelineEvent1929ce),
    TimelineEvent(1939, AppStrings().timelineEvent1939ce),
    TimelineEvent(1957, AppStrings().timelineEvent1957ce),
    TimelineEvent(1969, AppStrings().timelineEvent1969ce),
  ];
}
