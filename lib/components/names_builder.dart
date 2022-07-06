import 'package:flutter/material.dart';
import 'package:wecode_assignment_2/models/names_model.dart';
import 'package:wecode_assignment_2/services/names_service.dart';
import 'dart:convert' as convert;

const TextStyle _style = TextStyle(
  fontSize: 20,
);

class NamesBuilder extends StatefulWidget {
  const NamesBuilder(
      {Key? key,
      required this.genderValue,
      required this.limitValue,
      required this.sortValue})
      : super(key: key);
  final String genderValue;
  final int limitValue;
  final String sortValue;
  @override
  State<NamesBuilder> createState() => _NamesBuilderState();
}

class _NamesBuilderState extends State<NamesBuilder> {
  Future<NamesModel> _getNamesData(
      {int limit = 10,
      int offset = 0,
      String gender = 'M',
      String sort = 'positive'}) async {
    final namesJson =
        await NamesService().getNames(limit, offset, gender, sort);
    Map<String, dynamic> namesMap = convert.json.decode(namesJson);
    return NamesModel.fromJson(namesMap);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<NamesModel>(
            future: _getNamesData(
                gender: widget.genderValue,
                limit: widget.limitValue,
                sort: widget.sortValue),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.data == null) {
                throw 'Data is null!';
              }
              return ListView.separated(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.namesList.length,
                separatorBuilder: (_, index) {
                  return const SizedBox(height: 8);
                },
                itemBuilder: (context, index) {
                  final nameObj = snapshot.data!.namesList[index];
                  return ExpansionTile(
                    leading: Text(nameObj.name, style: _style),
                    title: widget.sortValue == 'positive'
                        ? Text(
                            nameObj.positive_votes.toString(),
                            style: _style,
                          )
                        : Text('${nameObj.negative_votes}-'),
                    children: [
                      Text(
                        nameObj.desc,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
