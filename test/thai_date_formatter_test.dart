import 'package:flutter_test/flutter_test.dart';

import 'package:thai_date_formatter/thai_date_formatter.dart';

void main() {
  group('ThaiDateFormatter',() {

    test('Format full month and full year',() {
      final date = DateTime.parse("2025-01-01");
      final result = ThaiDateFormatter.format(
          date,
          ThaiDateFormatType.fullMonthFullYear
      );

      expect(result, '1 มกราคม 2568');

      final dateWithTime = DateTime.parse('2025-01-02 12:00:00');
      final resultDateWithTime = ThaiDateFormatter.format(
        dateWithTime,
        ThaiDateFormatType.fullMonthFullYear,
        padDayWithZero: true,
      );

      expect(resultDateWithTime, '02 มกราคม 2568');

      final dateWithTimeUseThaiFormat = DateTime.parse('2025-01-02 12:00:00');
      final resultDateWithTimeUseThaiFormat = ThaiDateFormatter.format(
        dateWithTimeUseThaiFormat,
        ThaiDateFormatType.fullMonthFullYear,
        useThaiNumbers: true,
        padDayWithZero: true,
      );

      expect(resultDateWithTimeUseThaiFormat, '๐๒ มกราคม ๒๕๖๘');

      final dateWithTimeUseThaiFormatAndWeekday = DateTime.parse('2025-01-02 12:00:00');
      final resultDateWithTimeUseThaiFormatAndWeekday = ThaiDateFormatter.format(
        dateWithTimeUseThaiFormatAndWeekday,
        ThaiDateFormatType.fullMonthFullYear,
        useThaiNumbers: true,
        padDayWithZero: true,
        showDayOfWeek: true,
      );

      expect(resultDateWithTimeUseThaiFormatAndWeekday, 'พฤหัสบดี ๐๒ มกราคม ๒๕๖๘');

      final dateWithTimeUseThaiFormatAndWeekdayShortFormat = DateTime.parse('2025-01-02 12:00:00');
      final resultDateWithTimeUseThaiFormatAndWeekdayShortFormat = ThaiDateFormatter.format(
        dateWithTimeUseThaiFormatAndWeekdayShortFormat,
        ThaiDateFormatType.fullMonthFullYear,
        useThaiNumbers: true,
        padDayWithZero: true,
        showDayOfWeek: true,
        shortDayOfWeek: true,
      );

      expect(resultDateWithTimeUseThaiFormatAndWeekdayShortFormat, 'พฤ. ๐๒ มกราคม ๒๕๖๘');
    });

    test('Format short month and full year', () {
      final date = DateTime.parse("2025-01-01");
      final result = ThaiDateFormatter.format(
          date,
          ThaiDateFormatType.shortMonthFullYear
      );

      expect(result, '1 ม.ค. 2568');

      final dateWithTime = DateTime.parse('2025-01-02 12:00:00');
      final resultDateWithTime = ThaiDateFormatter.format(
        dateWithTime,
        ThaiDateFormatType.shortMonthFullYear,
        padDayWithZero: true,
      );

      expect(resultDateWithTime, '02 ม.ค. 2568');

      final dateWithTimeUseThaiFormat = DateTime.parse('2025-01-02 12:00:00');
      final resultDateWithTimeUseThaiFormat = ThaiDateFormatter.format(
        dateWithTimeUseThaiFormat,
        ThaiDateFormatType.shortMonthFullYear,
        useThaiNumbers: true,
        padDayWithZero: true,
      );

      expect(resultDateWithTimeUseThaiFormat, '๐๒ ม.ค. ๒๕๖๘');
    });

    test('Format full month and short year', () {
      final date = DateTime.parse("2025-01-01");
      final result = ThaiDateFormatter.format(
          date,
          ThaiDateFormatType.fullMonthShortYear
      );

      expect(result, '1 มกราคม 68');

      final dateWithTime = DateTime.parse('2025-01-02 12:00:00');
      final resultDateWithTime = ThaiDateFormatter.format(
        dateWithTime,
        ThaiDateFormatType.fullMonthShortYear,
        padDayWithZero: true,
      );

      expect(resultDateWithTime, '02 มกราคม 68');

      final dateWithTimeUseThaiFormat = DateTime.parse('2025-01-02 12:00:00');
      final resultDateWithTimeUseThaiFormat = ThaiDateFormatter.format(
        dateWithTimeUseThaiFormat,
        ThaiDateFormatType.fullMonthShortYear,
        useThaiNumbers: true,
        padDayWithZero: true,
      );

      expect(resultDateWithTimeUseThaiFormat, '๐๒ มกราคม ๖๘');
    });

    test('Format short month and short year', () {
      final date = DateTime.parse("2025-01-01");
      final result = ThaiDateFormatter.format(
          date,
          ThaiDateFormatType.shortMonthShortYear
      );

      expect(result, '1 ม.ค. 68');

      final dateWithTime = DateTime.parse('2025-01-02 12:00:00');
      final resultDateWithTime = ThaiDateFormatter.format(
        dateWithTime,
        ThaiDateFormatType.shortMonthShortYear,
        padDayWithZero: true,
      );

      expect(resultDateWithTime, '02 ม.ค. 68');

      final dateWithTimeUseThaiFormat = DateTime.parse('2025-01-02 12:00:00');
      final resultDateWithTimeUseThaiFormat = ThaiDateFormatter.format(
        dateWithTimeUseThaiFormat,
        ThaiDateFormatType.shortMonthShortYear,
        useThaiNumbers: true,
        padDayWithZero: true,
      );

      expect(resultDateWithTimeUseThaiFormat, '๐๒ ม.ค. ๖๘');
    });

  });

}
