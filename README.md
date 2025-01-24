# Thai Date Formatter

A Dart package for formatting dates in Thai language and Buddhist calendar with support for Thai numerals.


## Features
- Format `DateTime` objects to Thai date formats with options for:
    - Full/short month names and years.
    - Displaying day of the week (short or full).
    - Padding day numbers with zero.
    - Using Thai numerals.
- Support for the Buddhist calendar year system.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  thai_date_formatter: ^1.0.0
```

## Usage

Basic example:

```dart
import 'package:thai_date_formatter/thai_date_formatter.dart';

void main() {
  final date = DateTime.parse("2025-01-01");
  final result = ThaiDateFormatter.format(
      date,
      ThaiDateFormatType.fullMonthFullYear
  );
  
  print(result); //Output: 1 มกราคม 2568
}
```

More features:

```dart
import 'package:thai_date_formatter/thai_date_formatter.dart';

void main() {
  final dateWithTime = DateTime.parse('2025-01-02 12:00:00');
  final resultDateWithTime = ThaiDateFormatter.format(
    dateWithTime,
    ThaiDateFormatType.shortMonthFullYear,
    padDayWithZero: true,
  );
  
  print(result); //Output: 02 ม.ค. 2568
}
```

Configuration Options

| Parameter         | Description                                | Default         |
|-------------------|--------------------------------------------|-----------------|
| `useThaiNumbers`  | Convert numbers to Thai numerals           | `false`         |
| `padDayWithZero`  | Add leading zero to day numbers            | `false`         |
| `showDayOfWeek`   | Include day of the week in the formatted date | `false`         |
| `shortDayOfWeek`  | Use short names for day of the week        | `false`         |


## Licenses

- BSD 2-Clause License


## Issues & Support

If you find any issues or have suggestions, please open an issue on GitHub.
