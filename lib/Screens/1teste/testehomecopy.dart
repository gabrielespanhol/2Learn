// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/course_category.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseCategory/components/course_card_category.dart';

//Represents the HomeTesteLista2page widget
class HomeTesteLista2 extends StatefulWidget {
  //`createState()` will create the mutable state for this widget at
  //a given location in the tree.
  @override
  _HomeTesteLista2State createState() => _HomeTesteLista2State();
}

//Our HomeTesteLista2 state, the logic and internal state for a StatefulWidget.
class _HomeTesteLista2State extends State<HomeTesteLista2> {
  //A controller for an editable text field.
  //Whenever the user modifies a text field with an associated
  //TextEditingController, the text field updates value and the
  //controller notifies its listeners.
  var searchview = new TextEditingController();

  bool firstSearch = true;
  late String query = "";

  late List<CourseCategory> filterList;

  @override
  // ignore: must_call_super
  void initState() {}

  List<CourseCategory> listaCategorias = [
    CourseCategory(nomeCategoria: "tecnologia"),
    CourseCategory(nomeCategoria: "machine learning"),
    CourseCategory(nomeCategoria: "matemática"),
    CourseCategory(nomeCategoria: "artes"),
    CourseCategory(nomeCategoria: "gastronomia"),
    CourseCategory(nomeCategoria: "design"),
    CourseCategory(nomeCategoria: "robótica"),
    CourseCategory(nomeCategoria: "moda"),
    CourseCategory(nomeCategoria: "maquiagem"),
    CourseCategory(nomeCategoria: "idiomas"),
    CourseCategory(nomeCategoria: "historia"),
    CourseCategory(nomeCategoria: "química"),
    CourseCategory(nomeCategoria: "geometria"),
    CourseCategory(nomeCategoria: "português"),
    CourseCategory(nomeCategoria: "redação"),
    CourseCategory(nomeCategoria: "Filosofia"),
    CourseCategory(nomeCategoria: "Sociologia"),
    CourseCategory(nomeCategoria: "libras"),
    CourseCategory(nomeCategoria: "outros"),
  ];

  _HomeTesteLista2State() {
    //Register a closure to be called when the object changes.
    searchview.addListener(() {
      if (searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          firstSearch = true;
          query = "";
        });
      } else {
        setState(() {
          firstSearch = false;
          query = searchview.text;
        });
      }
    });
  }

//Build our HomeTesteLista2 widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text("SearchView ListView"),
      ),
      body: new Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          children: <Widget>[
            _createSearchView(),
            firstSearch ? _createListView() : _performSearch()
          ],
        ),
      ),
    );
  }

  //Create a SearchView
  Widget _createSearchView() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: new TextField(
        controller: searchview,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: new TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  //Create a ListView widget
  Widget _createListViewPrin11() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: listaCategorias.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.white,
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${listaCategorias[index].nomeCategoria}"),
              ),
            );
          }),
    );
  }

  //Perform actual search
  Widget _performSearchPrin11() {
    filterList = <CourseCategory>[];
    for (int i = 0; i < listaCategorias.length; i++) {
      var item = listaCategorias[i];

      if (item.nomeCategoria!.toLowerCase().startsWith(query.toLowerCase())) {
        filterList.add(item);
      }
    }
    return _createFilteredListViewPrin11();
  }

  //Create the Filtered ListView
  Widget _createFilteredListViewPrin11() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: filterList.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.white,
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${filterList[index].nomeCategoria}"),
              ),
            );
          }),
    );
  }

//
// vamos ver se vai aqui
//
// teste gridDelegate
  Widget _performSearch() {
    filterList = <CourseCategory>[];
    for (int i = 0; i < listaCategorias.length; i++) {
      var item = listaCategorias[i];

      if (item.nomeCategoria!.toLowerCase().startsWith(query.toLowerCase())) {
        filterList.add(item);
      }
    }
    return _createFilteredListView();
  }

  Widget _createFilteredListView() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: (size.height + size.width) / 1.7,
      height: (size.height + size.width) / 4,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: filterList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(40),
              child: CourseCardcategory(courseCategory: filterList[index]));
        },
      ),
    );
  }

  Widget _createListView() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: (size.height + size.width) / 1.7,
      height: (size.height + size.width) / 4,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: listaCategorias.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(40),
              child:
                  CourseCardcategory(courseCategory: listaCategorias[index]));
        },
      ),
    );
  }
}
