enum ThaiDateFormatType {
  fullMonthFullYear,
  fullMonthShortYear,
  shortMonthFullYear,
  shortMonthShortYear,
}

class ThaiDateFormatter {
  static const Map<int, String> _thaiMonthsFull = {
    1: 'มกราคม',
    2: 'กุมภาพันธ์',
    3: 'มีนาคม',
    4: 'เมษายน',
    5: 'พฤษภาคม',
    6: 'มิถุนายน',
    7: 'กรกฎาคม',
    8: 'สิงหาคม',
    9: 'กันยายน',
    10: 'ตุลาคม',
    11: 'พฤศจิกายน',
    12: 'ธันวาคม',
  };

  static const Map<int, String> _thaiMonthsShort = {
    1: 'ม.ค.',
    2: 'ก.พ.',
    3: 'มี.ค.',
    4: 'เม.ย.',
    5: 'พ.ค.',
    6: 'มิ.ย.',
    7: 'ก.ค.',
    8: 'ส.ค.',
    9: 'ก.ย.',
    10: 'ต.ค.',
    11: 'พ.ย.',
    12: 'ธ.ค.',
  };

  static const Map<int, String> _thaiDaysFull = {
    1: 'จันทร์',
    2: 'อังคาร',
    3: 'พุธ',
    4: 'พฤหัสบดี',
    5: 'ศุกร์',
    6: 'เสาร์',
    7: 'อาทิตย์',
  };

  static const Map<int, String> _thaiDaysShort = {
    1: 'จ.',
    2: 'อ.',
    3: 'พ.',
    4: 'พฤ.',
    5: 'ศ.',
    6: 'ส.',
    7: 'อา.',
  };

  static String format(
    DateTime date,
    ThaiDateFormatType formatType, {
    bool useThaiNumbers = false,
    bool padDayWithZero = false,
    bool showDayOfWeek = false,
    bool shortDayOfWeek = false,
  }) {
    final day = padDayWithZero
        ? date.day.toString().padLeft(2, '0')
        : date.day.toString();
    final int month = date.month;
    final int year = date.year + 543;
    final int weekday = date.weekday;

    /// Set day of week
    String dayOfWeek = '';
    if (showDayOfWeek) {
      dayOfWeek =
          shortDayOfWeek ? _thaiDaysShort[weekday]! : _thaiDaysFull[weekday]!;
      dayOfWeek += ' ';
    }

    String result;
    switch (formatType) {
      case ThaiDateFormatType.fullMonthFullYear:
        result = '$day ${_thaiMonthsFull[month]} $year';
        break;
      case ThaiDateFormatType.shortMonthFullYear:
        result = '$day ${_thaiMonthsShort[month]} $year';
        break;
      case ThaiDateFormatType.fullMonthShortYear:
        result =
            '$day ${_thaiMonthsFull[month]} ${year.toString().substring(2)}';
        break;
      case ThaiDateFormatType.shortMonthShortYear:
        result =
            '$day ${_thaiMonthsShort[month]} ${year.toString().substring(2)}';
        break;
    }

    result = dayOfWeek + result;

    return useThaiNumbers ? ThaiNumberFormatter.toThaiNumbers(result) : result;
  }
}


/// Utility class for converting Arabic numerals to Thai numerals.
class ThaiNumberFormatter {
  static const Map<String, String> _thaiNumbers = {
    '0': '๐',
    '1': '๑',
    '2': '๒',
    '3': '๓',
    '4': '๔',
    '5': '๕',
    '6': '๖',
    '7': '๗',
    '8': '๘',
    '9': '๙',
  };

  /// Converts Arabic numerals in the input string to Thai numerals.
  static String toThaiNumbers(String input) {

    /// handle empty input
    if (input.isEmpty) return input;

    final buffer = StringBuffer();
    for (final char in input.runes) {
      /// char is unicode from input.runes
      final thaiChar = _thaiNumbers[String.fromCharCode(char)];

      /// if thaiChar cannot mapping return old character.
      buffer.write(thaiChar ?? String.fromCharCode(char));
    }

    return buffer.toString();
  }
}
