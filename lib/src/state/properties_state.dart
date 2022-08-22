import 'package:flutter/material.dart';

List<String> listOfWeekDaysSymbol = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];

List<String> listOfMonthsSymbol = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

/// - DatePickerSelectionMode, Provides different modes for date selection.
enum DatePickerCalendarView {
  /// - DatePickerCalendarView.monthView, Shows calendar as month view.
  monthView,

  /// - DatePickerCalendarView.weekView, Shows calendar as week view.
  weekView,

  /// - DateRangePickerSelection.multiple, Allows multiple date selection,
  /// selecting a new date will not remove the selection for previous dates,
  /// allows to select as many dates as possible.
  // multiple,

  /// - DateRangePickerSelection.range, Allows to select a single range of
  /// dates.
  // range,

  /// - DateRangePickerSelection.multiRange, Allows to select a multiple ranges
  /// of dates.
  // multiRange,
}

/// - DatePickerSelectionMode, Provides different modes for date selection.
enum DatePickerSelectionMode {
  /// - DateRangePickerSelectionMode.single, Allows to select a single date,
  /// selecting a new date will remove the selection for previous date and
  /// updates selection to the new selected date.
  disable,

  /// - DateRangePickerSelectionMode.single, Allows to select a single date,
  /// selecting a new date will remove the selection for previous date and
  /// updates selection to the new selected date.
  single,

  /// - DateRangePickerSelection.multiple, Allows multiple date selection,
  /// selecting a new date will not remove the selection for previous dates,
  /// allows to select as many dates as possible.
  // multiple,

  /// - DateRangePickerSelection.range, Allows to select a single range of
  /// dates.
  // range,

  /// - DateRangePickerSelection.multiRange, Allows to select a multiple ranges
  /// of dates.
  // multiRange,
}

class DecorationProperties {
  /// - datesBackgroundColor, changes the dates background color
  final Color? datesBackgroundColor;

  /// - datesTextColor, changes the dates text color
  final Color? datesTextColor;

  /// - datesTextStyle, changes the dates text style
  final TextStyle? datesTextStyle;

  /// - datesBorderColor, changes the dates border color
  final Color? datesBorderColor;

  /// - datesBorderRadius, changes the dates border radius
  final double? datesBorderRadius;

  DecorationProperties({
    this.datesBackgroundColor,
    this.datesTextColor,
    this.datesTextStyle,
    this.datesBorderColor,
    this.datesBorderRadius,
  });

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'DatesProperties{datesBackgroundColor: $datesBackgroundColor, datesTextColor: $datesTextColor, datesTextStyle: $datesTextStyle, datesBorderColor: $datesBorderColor, datesBorderRadius: $datesBorderRadius}';
  }
}

class DatesProperties {
  /// - decorationProperties, changes the dates decorationProperties
  final DecorationProperties? decorationProperties;

  /// - disable, disable dates
  final bool? disable;

  /// - hide, hide dates
  final bool? hide;

  DatesProperties({
    this.decorationProperties,
    this.disable,
    this.hide,
  });

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'DatesProperties{decorationProperties: $decorationProperties, disable: $disable}';
  }
}

class CalendarPropertiesState extends ChangeNotifier {
  late DatesProperties _streakDatesProperties;
  DatesProperties get streakDatesProperties => _streakDatesProperties;

  late DatesProperties _currentDateProperties;
  DatesProperties get currentDateProperties => _currentDateProperties;

  late DatesProperties _generalDatesProperties;
  DatesProperties get generalDatesProperties => _generalDatesProperties;

  late DatesProperties _leadingTrailingDatesProperties;
  DatesProperties get leadingTrailingDatesProperties =>
      _leadingTrailingDatesProperties;

  late DatesProperties _selectedDatesProperties;
  DatesProperties get selectedDatesProperties => _selectedDatesProperties;

  late DatesProperties _selectedRangeBetweenDatesProperties;
  DatesProperties get selectedRangeBetweenDatesProperties =>
      _selectedRangeBetweenDatesProperties;

  late bool _enableDenseViewForDates;
  bool get enableDenseViewForDates => _enableDenseViewForDates;

  late bool _enableDenseSplashForDates;
  bool get enableDenseSplashForDates => _enableDenseSplashForDates;

  late DateTime? _startDateOfCalendar;
  DateTime get startDateOfCalendar =>
      _startDateOfCalendar ?? DateTime.utc(0000, 1, 1);

  late DateTime? _endDateOfCalendar;
  DateTime get endDateOfCalendar =>
      _endDateOfCalendar ?? DateTime.utc(9999, 1, 1);

  late DatePickerSelectionMode _dateSelectionMode;
  DatePickerSelectionMode get dateSelectionMode => _dateSelectionMode;

  late bool _disablePastDates;
  bool get disablePastDates => _disablePastDates;

  late DateTime _initialViewMonthDateTime;
  DateTime get initialViewMonthDateTime => _initialViewMonthDateTime;

  late DateTime _currentDateOfCalendar;
  DateTime get currentDateOfCalendar => _currentDateOfCalendar;

  late List<DateTime> _datesForStreaks;
  List<DateTime> get datesForStreaks => _datesForStreaks;

  late List<DateTime> _selectedDates;
  List<DateTime> get selectedDates => _selectedDates;

  late ValueChanged<List<DateTime>> _onSelectedDates;
  ValueChanged<List<DateTime>> get onSelectedDates => _onSelectedDates;

  late DatePickerCalendarView _datePickerCalendarView;
  DatePickerCalendarView get datePickerCalendarView => _datePickerCalendarView;

  initializeProperties({
    required DatePickerCalendarView? datePickerCalendarView,
    required DatesProperties? streakDatesProperties,
    required DatesProperties? currentDateProperties,
    required DatesProperties? generalDatesProperties,
    required DatesProperties? leadingTrailingDatesProperties,
    required DatesProperties? selectedDatesProperties,
    required DatesProperties? selectedRangeBetweenDatesProperties,
    required bool? enableDenseViewForDates,
    required bool? enableDenseSplashForDates,
    required DateTime? startDateOfCalendar,
    required DateTime? endDateOfCalendar,
    required DatePickerSelectionMode? dateSelectionMode,
    required bool? disablePastDates,
    required DateTime? initialViewMonthDateTime,
    required DateTime? currentDateOfCalendar,
    required List<DateTime>? datesForStreaks,
    required List<DateTime>? selectedDates,
    required ValueChanged<List<DateTime>>? onSelectedDates,
    required BuildContext context,
  }) {
    final ThemeData theme = Theme.of(context);

    _datePickerCalendarView =
        datePickerCalendarView ?? DatePickerCalendarView.monthView;

    _streakDatesProperties = DatesProperties(
      decorationProperties: DecorationProperties(
          datesBackgroundColor: streakDatesProperties
                  ?.decorationProperties?.datesBackgroundColor ??
              theme.colorScheme.surfaceVariant,
          datesTextColor:
              streakDatesProperties?.decorationProperties?.datesTextColor ??
                  theme.colorScheme.onSurfaceVariant,
          datesTextStyle:
              streakDatesProperties?.decorationProperties?.datesTextStyle ??
                  const TextStyle(),
          datesBorderColor:
              streakDatesProperties?.decorationProperties?.datesBorderColor ??
                  theme.colorScheme.onSurface,
          datesBorderRadius:
              streakDatesProperties?.decorationProperties?.datesBorderRadius ??
                  12),
      disable: streakDatesProperties?.disable ?? false,
      hide: streakDatesProperties?.hide ?? false,
    );

    _currentDateProperties = DatesProperties(
      decorationProperties: DecorationProperties(
          datesBackgroundColor:
              currentDateProperties?.decorationProperties?.datesBackgroundColor,
          datesTextColor:
              currentDateProperties?.decorationProperties?.datesTextColor,
          datesTextStyle:
              currentDateProperties?.decorationProperties?.datesTextStyle,
          datesBorderColor:
              currentDateProperties?.decorationProperties?.datesBorderColor ??
                  theme.colorScheme.primary,
          datesBorderRadius:
              currentDateProperties?.decorationProperties?.datesBorderRadius ??
                  12),
      disable: currentDateProperties?.disable ?? false,
      hide: currentDateProperties?.hide ?? false,
    );

    _generalDatesProperties = DatesProperties(
      decorationProperties: DecorationProperties(
          datesBackgroundColor: generalDatesProperties
                  ?.decorationProperties?.datesBackgroundColor ??
              Colors.transparent,
          datesTextColor:
              generalDatesProperties?.decorationProperties?.datesTextColor ??
                  theme.colorScheme.onSurface,
          datesTextStyle:
              generalDatesProperties?.decorationProperties?.datesTextStyle ??
                  const TextStyle(),
          datesBorderColor:
              generalDatesProperties?.decorationProperties?.datesBorderColor ??
                  theme.colorScheme.onSurface.withOpacity(0.5),
          datesBorderRadius:
              generalDatesProperties?.decorationProperties?.datesBorderRadius ??
                  12),
      disable: generalDatesProperties?.disable ?? false,
      hide: generalDatesProperties?.hide ?? false,
    );

    _leadingTrailingDatesProperties =
        _datePickerCalendarView == DatePickerCalendarView.monthView
            ? DatesProperties(
                decorationProperties: DecorationProperties(
                    datesBackgroundColor: leadingTrailingDatesProperties
                            ?.decorationProperties?.datesBackgroundColor ??
                        theme.colorScheme.surface,
                    datesTextColor: leadingTrailingDatesProperties
                            ?.decorationProperties?.datesTextColor ??
                        theme.disabledColor,
                    datesTextStyle: leadingTrailingDatesProperties
                            ?.decorationProperties?.datesTextStyle ??
                        const TextStyle(),
                    datesBorderColor: leadingTrailingDatesProperties
                            ?.decorationProperties?.datesBorderColor ??
                        theme.dividerColor,
                    datesBorderRadius: leadingTrailingDatesProperties
                            ?.decorationProperties?.datesBorderRadius ??
                        12),
                disable: leadingTrailingDatesProperties?.disable ?? false,
                hide: leadingTrailingDatesProperties?.hide ?? false,
              )
            : DatesProperties(
                decorationProperties: DecorationProperties(
                    datesBackgroundColor: generalDatesProperties
                            ?.decorationProperties?.datesBackgroundColor ??
                        Colors.transparent,
                    datesTextColor: generalDatesProperties
                            ?.decorationProperties?.datesTextColor ??
                        theme.colorScheme.onSurface,
                    datesTextStyle: generalDatesProperties
                            ?.decorationProperties?.datesTextStyle ??
                        const TextStyle(),
                    datesBorderColor: generalDatesProperties
                            ?.decorationProperties?.datesBorderColor ??
                        theme.colorScheme.onSurface.withOpacity(0.5),
                    datesBorderRadius: generalDatesProperties
                            ?.decorationProperties?.datesBorderRadius ??
                        12),
                disable: generalDatesProperties?.disable ?? false,
                hide: generalDatesProperties?.hide ?? false,
              );

    _selectedDatesProperties = DatesProperties(
      decorationProperties: DecorationProperties(
          datesBackgroundColor: selectedDatesProperties
                  ?.decorationProperties?.datesBackgroundColor ??
              theme.colorScheme.primary,
          datesTextColor:
              selectedDatesProperties?.decorationProperties?.datesTextColor ??
                  theme.colorScheme.onPrimary,
          datesTextStyle:
              selectedDatesProperties?.decorationProperties?.datesTextStyle ??
                  const TextStyle(),
          datesBorderColor:
              selectedDatesProperties?.decorationProperties?.datesBorderColor ??
                  theme.colorScheme.primary,
          datesBorderRadius: selectedDatesProperties
                  ?.decorationProperties?.datesBorderRadius ??
              12),
      disable: selectedDatesProperties?.disable ?? false,
      hide: selectedDatesProperties?.hide ?? false,
    );

    _selectedRangeBetweenDatesProperties = DatesProperties(
      decorationProperties: DecorationProperties(
          datesBackgroundColor: selectedRangeBetweenDatesProperties
                  ?.decorationProperties?.datesBackgroundColor ??
              theme.colorScheme.surfaceVariant,
          datesTextColor: selectedRangeBetweenDatesProperties
                  ?.decorationProperties?.datesTextColor ??
              theme.colorScheme.onSurfaceVariant,
          datesTextStyle: selectedRangeBetweenDatesProperties
                  ?.decorationProperties?.datesTextStyle ??
              const TextStyle(),
          datesBorderColor: selectedRangeBetweenDatesProperties
                  ?.decorationProperties?.datesBorderColor ??
              Colors.transparent,
          datesBorderRadius: selectedRangeBetweenDatesProperties
                  ?.decorationProperties?.datesBorderRadius ??
              12),
      disable: selectedDatesProperties?.disable ?? false,
      hide: selectedDatesProperties?.hide ?? false,
    );

    _enableDenseViewForDates = enableDenseViewForDates ?? false;
    _enableDenseSplashForDates = enableDenseSplashForDates ?? false;
    _startDateOfCalendar = startDateOfCalendar ?? DateTime.utc(0000, 1, 1);
    _endDateOfCalendar = endDateOfCalendar ?? DateTime.utc(9999, 1, 1);
    _dateSelectionMode = dateSelectionMode ?? DatePickerSelectionMode.disable;
    _disablePastDates = disablePastDates ?? false;
    _initialViewMonthDateTime = initialViewMonthDateTime != null
        ? (_startDateOfCalendar!.isBefore(initialViewMonthDateTime)
            ? initialViewMonthDateTime
            : _startDateOfCalendar!)
        : currentDateOfCalendar != null
            ? (_startDateOfCalendar!.isBefore(DateTime.utc(
                    currentDateOfCalendar.year,
                    currentDateOfCalendar.month,
                    currentDateOfCalendar.day))
                ? DateTime.utc(currentDateOfCalendar.year,
                    currentDateOfCalendar.month, currentDateOfCalendar.day)
                : _startDateOfCalendar!)
            : _startDateOfCalendar!.isBefore(DateTime.now())
                ? DateTime.utc(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day)
                : _startDateOfCalendar!;
    _currentDateOfCalendar = currentDateOfCalendar ?? DateTime.now();
    _datesForStreaks = datesForStreaks != null
        ? List.generate(
            datesForStreaks.length,
            (index) => DateTime.utc(datesForStreaks[index].year,
                datesForStreaks[index].month, datesForStreaks[index].day))
        : [];
    _selectedDates = selectedDates != null
        ? List.generate(
            selectedDates.length,
            (index) => DateTime.utc(selectedDates[index].year,
                selectedDates[index].month, selectedDates[index].day))
        : [];

    _onSelectedDates = onSelectedDates ??
        (List<DateTime> selectedDates) {
          // print(selectedDates);
        };
  }

  updateProperties({
    required DatePickerCalendarView? datePickerCalendarView,
    required DatesProperties? streakDatesProperties,
    required DatesProperties? currentDateProperties,
    required DatesProperties? generalDatesProperties,
    required DatesProperties? leadingTrailingDatesProperties,
    required DatesProperties? selectedDatesProperties,
    required DatesProperties? selectedRangeBetweenDatesProperties,
    required bool? enableDenseViewForDates,
    required bool? enableDenseSplashForDates,
    required DateTime? startDateOfCalendar,
    required DateTime? endDateOfCalendar,
    required DatePickerSelectionMode? dateSelectionMode,
    required bool? disablePastDates,
    required DateTime? initialViewMonthDateTime,
    required DateTime? currentDateOfCalendar,
    required List<DateTime>? datesForStreaks,
    required List<DateTime>? selectedDates,
    required ValueChanged<List<DateTime>>? onSelectedDates,
    required BuildContext context,
  }) {
    final ThemeData theme = Theme.of(context);

    _datePickerCalendarView =
        datePickerCalendarView ?? DatePickerCalendarView.monthView;

    _streakDatesProperties = DatesProperties(
      decorationProperties: DecorationProperties(
          datesBackgroundColor: streakDatesProperties
                  ?.decorationProperties?.datesBackgroundColor ??
              theme.colorScheme.surfaceVariant,
          datesTextColor:
              streakDatesProperties?.decorationProperties?.datesTextColor ??
                  theme.colorScheme.onSurfaceVariant,
          datesTextStyle:
              streakDatesProperties?.decorationProperties?.datesTextStyle ??
                  const TextStyle(),
          datesBorderColor:
              streakDatesProperties?.decorationProperties?.datesBorderColor ??
                  theme.colorScheme.onSurface,
          datesBorderRadius:
              streakDatesProperties?.decorationProperties?.datesBorderRadius ??
                  12),
      disable: streakDatesProperties?.disable ?? false,
      hide: streakDatesProperties?.hide ?? false,
    );

    _currentDateProperties = DatesProperties(
      decorationProperties: DecorationProperties(
          datesBackgroundColor:
              currentDateProperties?.decorationProperties?.datesBackgroundColor,
          datesTextColor:
              currentDateProperties?.decorationProperties?.datesTextColor,
          datesTextStyle:
              currentDateProperties?.decorationProperties?.datesTextStyle,
          datesBorderColor:
              currentDateProperties?.decorationProperties?.datesBorderColor ??
                  theme.colorScheme.primary,
          datesBorderRadius:
              currentDateProperties?.decorationProperties?.datesBorderRadius ??
                  12),
      disable: currentDateProperties?.disable ?? false,
      hide: currentDateProperties?.hide ?? false,
    );

    _generalDatesProperties = DatesProperties(
      decorationProperties: DecorationProperties(
          datesBackgroundColor: generalDatesProperties
                  ?.decorationProperties?.datesBackgroundColor ??
              Colors.transparent,
          datesTextColor:
              generalDatesProperties?.decorationProperties?.datesTextColor ??
                  theme.colorScheme.onSurface,
          datesTextStyle:
              generalDatesProperties?.decorationProperties?.datesTextStyle ??
                  const TextStyle(),
          datesBorderColor:
              generalDatesProperties?.decorationProperties?.datesBorderColor ??
                  theme.colorScheme.onSurface.withOpacity(0.5),
          datesBorderRadius:
              generalDatesProperties?.decorationProperties?.datesBorderRadius ??
                  12),
      disable: generalDatesProperties?.disable ?? false,
      hide: generalDatesProperties?.hide ?? false,
    );

    _leadingTrailingDatesProperties =
        _datePickerCalendarView == DatePickerCalendarView.monthView
            ? DatesProperties(
                decorationProperties: DecorationProperties(
                    datesBackgroundColor: leadingTrailingDatesProperties
                            ?.decorationProperties?.datesBackgroundColor ??
                        theme.colorScheme.surface,
                    datesTextColor: leadingTrailingDatesProperties
                            ?.decorationProperties?.datesTextColor ??
                        theme.disabledColor,
                    datesTextStyle: leadingTrailingDatesProperties
                            ?.decorationProperties?.datesTextStyle ??
                        const TextStyle(),
                    datesBorderColor: leadingTrailingDatesProperties
                            ?.decorationProperties?.datesBorderColor ??
                        theme.dividerColor,
                    datesBorderRadius: leadingTrailingDatesProperties
                            ?.decorationProperties?.datesBorderRadius ??
                        12),
                disable: leadingTrailingDatesProperties?.disable ?? false,
                hide: leadingTrailingDatesProperties?.hide ?? false,
              )
            : DatesProperties(
                decorationProperties: DecorationProperties(
                    datesBackgroundColor: generalDatesProperties
                            ?.decorationProperties?.datesBackgroundColor ??
                        Colors.transparent,
                    datesTextColor: generalDatesProperties
                            ?.decorationProperties?.datesTextColor ??
                        theme.colorScheme.onSurface,
                    datesTextStyle: generalDatesProperties
                            ?.decorationProperties?.datesTextStyle ??
                        const TextStyle(),
                    datesBorderColor: generalDatesProperties
                            ?.decorationProperties?.datesBorderColor ??
                        theme.colorScheme.onSurface.withOpacity(0.5),
                    datesBorderRadius: generalDatesProperties
                            ?.decorationProperties?.datesBorderRadius ??
                        12),
                disable: generalDatesProperties?.disable ?? false,
                hide: generalDatesProperties?.hide ?? false,
              );

    _selectedDatesProperties = DatesProperties(
      decorationProperties: DecorationProperties(
          datesBackgroundColor: selectedDatesProperties
                  ?.decorationProperties?.datesBackgroundColor ??
              theme.colorScheme.primary,
          datesTextColor:
              selectedDatesProperties?.decorationProperties?.datesTextColor ??
                  theme.colorScheme.onPrimary,
          datesTextStyle:
              selectedDatesProperties?.decorationProperties?.datesTextStyle ??
                  const TextStyle(),
          datesBorderColor:
              selectedDatesProperties?.decorationProperties?.datesBorderColor ??
                  theme.colorScheme.primary,
          datesBorderRadius: selectedDatesProperties
                  ?.decorationProperties?.datesBorderRadius ??
              12),
      disable: selectedDatesProperties?.disable ?? false,
      hide: selectedDatesProperties?.hide ?? false,
    );

    _selectedRangeBetweenDatesProperties = DatesProperties(
      decorationProperties: DecorationProperties(
          datesBackgroundColor: selectedRangeBetweenDatesProperties
                  ?.decorationProperties?.datesBackgroundColor ??
              theme.colorScheme.surfaceVariant,
          datesTextColor: selectedRangeBetweenDatesProperties
                  ?.decorationProperties?.datesTextColor ??
              theme.colorScheme.onSurfaceVariant,
          datesTextStyle: selectedRangeBetweenDatesProperties
                  ?.decorationProperties?.datesTextStyle ??
              const TextStyle(),
          datesBorderColor: selectedRangeBetweenDatesProperties
                  ?.decorationProperties?.datesBorderColor ??
              Colors.transparent,
          datesBorderRadius: selectedRangeBetweenDatesProperties
                  ?.decorationProperties?.datesBorderRadius ??
              12),
      disable: selectedDatesProperties?.disable ?? false,
      hide: selectedDatesProperties?.hide ?? false,
    );

    _enableDenseViewForDates = enableDenseViewForDates ?? false;
    _enableDenseSplashForDates = enableDenseSplashForDates ?? false;
    _startDateOfCalendar = startDateOfCalendar ?? DateTime.utc(0000, 1, 1);
    _endDateOfCalendar = endDateOfCalendar ?? DateTime.utc(9999, 1, 1);
    _dateSelectionMode = dateSelectionMode ?? DatePickerSelectionMode.disable;
    _disablePastDates = disablePastDates ?? false;
    _initialViewMonthDateTime = initialViewMonthDateTime != null
        ? (_startDateOfCalendar!.isBefore(initialViewMonthDateTime)
            ? initialViewMonthDateTime
            : _startDateOfCalendar!)
        : currentDateOfCalendar != null
            ? (_startDateOfCalendar!.isBefore(DateTime.utc(
                    currentDateOfCalendar.year,
                    currentDateOfCalendar.month,
                    currentDateOfCalendar.day))
                ? DateTime.utc(currentDateOfCalendar.year,
                    currentDateOfCalendar.month, currentDateOfCalendar.day)
                : _startDateOfCalendar!)
            : _startDateOfCalendar!.isBefore(DateTime.now())
                ? DateTime.utc(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day)
                : _startDateOfCalendar!;
    _currentDateOfCalendar = currentDateOfCalendar ?? DateTime.now();
    _datesForStreaks = datesForStreaks != null
        ? List.generate(
            datesForStreaks.length,
            (index) => DateTime.utc(datesForStreaks[index].year,
                datesForStreaks[index].month, datesForStreaks[index].day))
        : [];
    _selectedDates = selectedDates != null
        ? List.generate(
            selectedDates.length,
            (index) => DateTime.utc(selectedDates[index].year,
                selectedDates[index].month, selectedDates[index].day))
        : [];

    _onSelectedDates = onSelectedDates ??
        (List<DateTime> selectedDates) {
          // print(selectedDates);
        };

    notifyListeners();
  }

  updateSelectedDates({required List<DateTime> selectedDates}) {
    _selectedDates = selectedDates;
    _onSelectedDates.call(_selectedDates);
    notifyListeners();
  }
}
