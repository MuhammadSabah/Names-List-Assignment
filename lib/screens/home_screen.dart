import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wecode_assignment_2/components/names_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _genderParams = ['Male', 'Female'];
  final List<int> _limits = [10, 20, 30, 40, 50, 60, 70];
  final List<String> _sortParams = ['positive', 'negative'];

  String _genderValue = 'M';
  int _limitValue = 10;
  String _sortValue = 'positive';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        fontFamily: GoogleFonts.notoSansArabic().fontFamily,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Names List'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton(
                    hint: const Text(
                      'Sort by',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: _sortParams.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value is String) {
                        setState(() {
                          _sortValue = value;
                        });
                      }
                    },
                  ),
                  DropdownButton(
                    hint: const Text(
                      'Gender',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: _genderParams.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value is String) {
                        setState(() {
                          if (value == "Female") {
                            _genderValue = 'F';
                          } else if (value == "Male") {
                            _genderValue = 'M';
                          }
                        });
                      }
                    },
                  ),
                  DropdownButton(
                    hint: const Text(
                      'Limit',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: _limits.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
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
              Directionality(
                textDirection: TextDirection.rtl,
                child: NamesBuilder(
                  genderValue: _genderValue,
                  limitValue: _limitValue,
                  sortValue: _sortValue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
