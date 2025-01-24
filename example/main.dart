import 'package:flutter/material.dart';
import 'package:thai_date_formatter/thai_date_formatter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Thai Date Formatter'),
        ),
        body: Center(
          child: Column(
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Input (DateTime.now) : '),
                    TextSpan(text: '${DateTime.now()}', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
                ),
              ),
              SizedBox(height: 10.0),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Full month and full year: '),
                      TextSpan(
                          text: ThaiDateFormatter.format(
                          DateTime.now(),
                          ThaiDateFormatType.fullMonthFullYear
                          ), style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Full month and short year: '),
                      TextSpan(
                          text: ThaiDateFormatter.format(
                              DateTime.now(),
                              ThaiDateFormatType.fullMonthShortYear
                          ), style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Short month and full year: '),
                      TextSpan(
                          text: ThaiDateFormatter.format(
                              DateTime.now(),
                              ThaiDateFormatType.shortMonthFullYear
                          ), style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Short month and short year: '),
                      TextSpan(
                          text: ThaiDateFormatter.format(
                              DateTime.now(),
                              ThaiDateFormatType.shortMonthShortYear
                          ), style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Short month, short year and show day of week (short): '),
                      TextSpan(
                          text: ThaiDateFormatter.format(
                            DateTime.now(),
                            ThaiDateFormatType.shortMonthShortYear,
                            showDayOfWeek: true,
                            shortDayOfWeek: true,
                          ), style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Short month, short year and show day of week: '),
                      TextSpan(
                          text: ThaiDateFormatter.format(
                            DateTime.now(),
                            ThaiDateFormatType.shortMonthShortYear,
                            showDayOfWeek: true,
                            shortDayOfWeek: false,
                          ), style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ]
                ),
              ),
              SizedBox(height: 10.0),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Specific date 2025-01-01 (none padding) : '),
                      TextSpan(
                          text: ThaiDateFormatter.format(
                            DateTime.parse('2025-01-01'),
                            ThaiDateFormatType.fullMonthFullYear,
                          ), style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Specific date 2025-01-01 (with padding) : '),
                      TextSpan(
                          text: ThaiDateFormatter.format(
                            DateTime.parse('2025-01-01'),
                            ThaiDateFormatType.fullMonthFullYear,
                            padDayWithZero: true
                          ), style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ]
                ),
              ),
              SizedBox(height: 10.0),
              Text('Advance' ,style: TextStyle(fontWeight: FontWeight.bold)),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Specific date 2025-01-02 (padding and Thai numbers) : '),
                      TextSpan(
                          text: ThaiDateFormatter.format(
                            DateTime.parse('2025-01-02'),
                            ThaiDateFormatType.fullMonthFullYear,
                            padDayWithZero: true,
                            useThaiNumbers: true,
                          ), style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ]
                ),
              ),
            ],
          ),
        ),
      )
    );

  }

}