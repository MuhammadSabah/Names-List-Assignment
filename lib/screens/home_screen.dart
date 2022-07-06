import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wecode_assignment_2/components/names_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _genders = [
    'Male',
    'Female',
  ];
  String _genderValue = 'M';
  int _limitValue = 10;
  String _sortValue = 'positive';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        fontFamily: GoogleFonts.notoSansArabic().fontFamily,
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          value: 'positive',
                          child: Text('Positive'),
                        ),
                        DropdownMenuItem(
                          value: 'negative',
                          child: Text('Negative'),
                        ),
                      ],
                      value: _sortValue,
                      onChanged: (value) {
                        if (value is String) {
                          setState(() {
                            _sortValue = value;
                          });
                        }
                      },
                    ),
                    DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          value: 'M',
                          child: Text(
                            'نێر',
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'F',
                          child: Text(
                            'مێ',
                          ),
                        ),
                      ],
                      value: _genderValue,
                      onChanged: (value) {
                        if (value is String) {
                          setState(() {
                            _genderValue = value;
                          });
                        }
                      },
                    ),
                    DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          value: 10,
                          child: Text('10'),
                        ),
                        DropdownMenuItem(
                          value: 20,
                          child: Text('20'),
                        ),
                        DropdownMenuItem(
                          value: 30,
                          child: Text('30'),
                        ),
                        DropdownMenuItem(
                          value: 40,
                          child: Text('40'),
                        ),
                        DropdownMenuItem(
                          value: 50,
                          child: Text('50'),
                        ),
                      ],
                      value: _limitValue,
                      onChanged: (value) {
                        if (value is int) {
                          setState(() {
                            _limitValue = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
                NamesBuilder(
                  genderValue: _genderValue,
                  limitValue: _limitValue,
                  sortValue: _sortValue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
