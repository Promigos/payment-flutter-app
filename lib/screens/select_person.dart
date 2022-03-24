import 'package:easy_search/easy_search.dart';
import 'package:flutter/material.dart';
class ModelExample {
  final String name;
  final int age;

  ModelExample({required this.name, required this.age});

  @override
  String toString() {
    return '$name $age';
  }
}
class Select extends StatefulWidget {
  const Select({Key? key}) : super(key: key);

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySearch(
        multipleSelect: true,
        searchResultSettings: SearchResultSettings(padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0)),
        controller: SearchItem(
          items: [
            Item(ModelExample(name: 'Tiago', age: 36), false),
            Item(ModelExample(name: 'Mel', age: 3), false),
            Item(ModelExample(name: 'Monique', age: 30), false),
          ],
        ),

        customItemBuilder: (BuildContext context, ModelExample item, bool isSelected) {
          return Container(
            decoration: !isSelected
                ? null
                : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
            ),
            child: ListTile(
              selected: isSelected,
              title: Text(item.name),
              subtitle: Text(item.age.toString()),
              leading: Icon(Icons.people),
            ),
          );
        },
      ),
    );
  }
}

