import 'package:flutter/material.dart';
import 'main.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String _selectedCategory = "A";
  var maincat = {'A': 'A', 'B': 'B', 'C': 'C', 'D': 'D'};

  List categories = [];
  MaincatDropDown() {
    maincat.forEach((key, value) {
      categories.add(key);
    });
    _selectedCategory = categories[0];
  }

  String _selectedSubc = "";
  var subc = {'Q1': 'A', 'Q2': 'A', 'T1': 'B', 'Z1': 'C', 'V1': 'D'};

  List _subcategories = [];
  SubCatDropDown(catMain) {
    subc.forEach((key, value) {
      if (catMain == value) {
        _subcategories.add(key);
      }
    });
    _selectedSubc = _subcategories[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return DropdownButton<String>(
                items: categories.map((value) {
                  return DropdownMenuItem<String>(
                    value: value[_selectedCategory],
                    child: Text(value[_selectedCategory]),
                  );
                }).toList(),
                onChanged: (_) {},
              );
            },
          ),
        ));
  }
}
