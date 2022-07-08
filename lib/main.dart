import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomePage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter task'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  late TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MaincatDropDown();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          SizedBox(
            height: 23,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Row(
            children: [
              Container(
                width: 400,
                child: DropdownButton(
                  value: _selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      _subcategories = [];
                      SubCatDropDown(maincat[newValue]);

                      _selectedCategory = "$newValue";
                    });
                  },
                  items: categories.map((category) {
                    return DropdownMenuItem(
                      child: Text(category),
                      value: category,
                    );
                  }).toList(),
                ),
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: Text('Add   Category'),
                          content: TextField(
                            autofocus: true,
                            controller: controller,
                            decoration:
                                InputDecoration(hintText: '  Category name'),
                          ),
                          actions: [
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    this._selectedCategory = controller.text;
                                    this.categories.add(this._selectedCategory);
                                  });
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: Text('Add'),
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ]),
                    );
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          SizedBox(
            height: 23,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sub categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
          Row(
            children: [
              Container(
                width: 400,
                child: DropdownButton(
                  value: _selectedSubc,
                  onChanged: (newValue) {
                    print(newValue);
                    setState(() {
                      print(newValue);
                      SubCatDropDown(maincat[newValue]);

                      _selectedSubc = "$newValue";
                    });
                  },
                  items: _subcategories.map((subcategory) {
                    return DropdownMenuItem(
                      child: Text(subcategory),
                      value: subcategory,
                    );
                  }).toList(),
                ),
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: Text('Add  Sub Category'),
                          content: TextField(
                            autofocus: true,
                            controller: controller,
                            decoration:
                                InputDecoration(hintText: ' Sub Category name'),
                          ),
                          actions: [
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedSubc = controller.text;
                                    _subcategories.add(_selectedSubc);
                                    _subcategories.length + 1;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: Text('Add'),
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ]),
                    );
                  },
                  icon: Icon(Icons.add))
            ],
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.navigate_next_outlined,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Page2()));
        },
      ),
    );
  }
}
