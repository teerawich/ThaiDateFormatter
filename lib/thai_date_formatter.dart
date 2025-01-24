/// Defines Thai date formats with full/short month names and years.
enum ThaiDateFormatType {
  /// Full month name with full year (e.g., 01 มกราคม 2568).
  fullMonthFullYear,

  /// Full month name with short year (e.g., 01 มกราคม 68).
  fullMonthShortYear,

  /// Short month name with full year (e.g., 01 ม.ค. 2568).
  shortMonthFullYear,

  /// Short month name with short year (e.g., 01 ม.ค. 68).
  shortMonthShortYear,
}

class ThaiDateFormatter {
  /// Thai month full name mapping.
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

  /// Thai month short name mapping.
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

  /// Thai days full name mapping.
  static const Map<int, String> _thaiDaysFull = {
    1: 'จันทร์',
    2: 'อังคาร',
    3: 'พุธ',
    4: 'พฤหัสบดี',
    5: 'ศุกร์',
    6: 'เสาร์',
    7: 'อาทิตย์',
  };

  /// Thai days short name mapping.
  static const Map<int, String> _thaiDaysShort = {
    1: 'จ.',
    2: 'อ.',
    3: 'พ.',
    4: 'พฤ.',
    5: 'ศ.',
    6: 'ส.',
    7: 'อา.',
  };

  /// Formats a DateTime object into a Thai date string based on the given format type.
  static String format(
    DateTime date,
    ThaiDateFormatType formatType, {
    bool useThaiNumbers = false, // Convert arabic numbers to Thai numerals.
    bool padDayWithZero = false, // Ensure day is always two digits (e.g., 01).
    bool showDayOfWeek = false, // Include the day of the week in the output.
    bool shortDayOfWeek = false, // Use short form for the day of the week.
  }) {
    /// Format day with optional padding
    final day = padDayWithZero
        ? date.day.toString().padLeft(2, '0')
        : date.day.toString();

    /// Extract date components
    final int month = date.month;
    final int year = date.year + 543;
    final int weekday = date.weekday;

    /// Determine day of the week (if needed)
    String dayOfWeek = '';
    if (showDayOfWeek) {
      dayOfWeek =
          shortDayOfWeek ? _thaiDaysShort[weekday]! : _thaiDaysFull[weekday]!;
      dayOfWeek += ' ';
    }

    /// Build the formatted date string
    final String result = switch (formatType) {
      ThaiDateFormatType.fullMonthFullYear => '$day ${_thaiMonthsFull[month]} $year',
      ThaiDateFormatType.fullMonthShortYear =>'$day ${_thaiMonthsFull[month]} ${year.toString().substring(2)}',
      ThaiDateFormatType.shortMonthFullYear => '$day ${_thaiMonthsShort[month]} $year',
      ThaiDateFormatType.shortMonthShortYear => '$day ${_thaiMonthsShort[month]} ${year.toString().substring(2)}'
    };

    /// Add day of week and convert to Thai numbers if needed,
    final String formattedDate = dayOfWeek + result;
    return useThaiNumbers ? ThaiNumberFormatter.toThaiNumbers(formattedDate) : formattedDate;
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
    for (final rune in input.runes) {
      /// Convert Unicode to a character and map it to Thai numerals if available.
      final thaiChar = _thaiNumbers[String.fromCharCode(rune)];

      /// Write the Thai numeral or the original character if no mapping exists.
      buffer.write(thaiChar ?? String.fromCharCode(rune));
    }

    return buffer.toString();
  }
}
