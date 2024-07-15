import 'package:streak_calendar/src/models/calendar_properties.dart';
import 'package:streak_calendar/src/ui/calendar_dates_section/grid_view_elements/calendar_streak_date_widgets.dart';
import 'package:flutter/material.dart';

class GetSuitableCalendarStreakDateWidget extends StatelessWidget {
  const GetSuitableCalendarStreakDateWidget(
      {Key? key,
      required this.calendarProperties,
      required this.pageViewElementDate,
      required this.pageViewDate,
      required this.datesForStreaks})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final DateTime pageViewElementDate;
  final DateTime pageViewDate;
  final List<DateTime> datesForStreaks;

  @override
  Widget build(BuildContext context) {
    /// Called when streak date have streak date just before and just after also.
    // page element weekday starts from 1: monday, ends in 7: sunday

    var startWeekday = calendarProperties.startWeekday;
    var endWeekday = startWeekday == WeekDay.sunday ? WeekDay.saturday : WeekDay.sunday;
    // page element weekday starts from 1: monday, ends in 7: sunday
    // startWeekday or endWeekday, starts from 0: monday, ends in 6: sunday.
    var startWeekdayIndex = startWeekday.index + 1;
    var endWeekdayIndex = endWeekday.index + 1;

     DateTime firstDayOfNextMonth = (pageViewElementDate.month < 12)
      ? DateTime(pageViewElementDate.year, pageViewElementDate.month + 1, 1)
      : DateTime(pageViewElementDate.year + 1, 1, 1);
    var lastDayOfMonth = firstDayOfNextMonth.subtract(Duration(days: 1)).day;
    var firstDayOfMonth = 1;

    // print("pageview element date ${this.pageViewElementDate} ${this.pageViewElementDate.weekday}");
    // print("start week day ${calendarProperties.startWeekday} ${startWeekday.index + 1}");
    // print("end week day ${endWeekday} ${endWeekday.index + 1}");

    if (datesForStreaks
            .contains(pageViewElementDate.add(const Duration(days: 1))) &&
        datesForStreaks
            .contains(pageViewElementDate.subtract(const Duration(days: 1))) &&
        datesForStreaks.contains(pageViewElementDate) && 
        pageViewElementDate.weekday != endWeekdayIndex && pageViewElementDate.weekday != startWeekdayIndex &&
        pageViewElementDate.day != firstDayOfMonth && pageViewElementDate.day != lastDayOfMonth) {
      if (calendarProperties.enableDenseViewForDates &&
          calendarProperties.enableDenseSplashForDates) {
        return CalendarStreakBetweenDenseSplashDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (calendarProperties.enableDenseViewForDates) {
        return CalendarStreakBetweenExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (!calendarProperties.enableDenseViewForDates) {
        return CalendarStreakBetweenExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      } else {
        return const SizedBox();
      }
    }

    /// Called when streak date have a streak date just after.
    if (datesForStreaks
        .contains(pageViewElementDate.add(const Duration(days: 1))) && pageViewElementDate.weekday != endWeekdayIndex && pageViewElementDate.day != lastDayOfMonth) {
      if (calendarProperties.enableDenseViewForDates &&
          calendarProperties.enableDenseSplashForDates) {
        return CalendarStreakStartDenseSplashDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (calendarProperties.enableDenseViewForDates) {
        return CalendarStreakStartDenseDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (!calendarProperties.enableDenseViewForDates) {
        return CalendarStreakStartExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      } else {
        return const SizedBox();
      }
    }

    /// Called when streak date have a streak date just before.
    if (datesForStreaks
        .contains(pageViewElementDate.subtract(const Duration(days: 1))) && pageViewElementDate.weekday != startWeekdayIndex && pageViewElementDate.day != firstDayOfMonth) {
      if (calendarProperties.enableDenseViewForDates &&
          calendarProperties.enableDenseSplashForDates) {
        return CalendarStreakEndDenseSplashDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (calendarProperties.enableDenseViewForDates) {
        return CalendarStreakEndDenseDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (!calendarProperties.enableDenseViewForDates) {
        return CalendarStreakEndExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      } else {
        return const SizedBox();
      }
    }

    /// Called when streak date doesn't have streak date just before and just after also.
    if (datesForStreaks.contains(pageViewElementDate)) {
      if (calendarProperties.enableDenseViewForDates &&
          calendarProperties.enableDenseSplashForDates) {
        return CalendarStreakSingleDenseSplashDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (calendarProperties.enableDenseViewForDates) {
        return CalendarStreakSingleDenseDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (!calendarProperties.enableDenseViewForDates) {
        return CalendarStreakSingleExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      } else {
        return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }
}
