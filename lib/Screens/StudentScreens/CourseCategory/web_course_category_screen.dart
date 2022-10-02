import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/logo_image.dart';
import 'package:flutter_web_1/Screens/Components/put_sgv_image.dart';
import 'package:flutter_web_1/Models/course_category.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseCategory/components/course_card_category.dart';
import 'package:flutter_web_1/constant.dart';

class WebCoursesCategory extends StatefulWidget {
  const WebCoursesCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<WebCoursesCategory> createState() => _WebCoursesCategoryState();
}

class _WebCoursesCategoryState extends State<WebCoursesCategory> {
  var searchview = TextEditingController();

  bool firstSearch = true;
  late String query = "";

  late List<CourseCategory> filterList;

  @override
  // ignore: must_call_super
  void initState() {}

  _WebCoursesCategoryState() {
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

  List<CourseCategory> listaCategorias = [
    CourseCategory(nomeCategoria: "Geral"),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        //MenuStudentSearch(title: "Categorias"),
        // menu aqui para conseguir pesquisar
        Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      "Categorias".toUpperCase(),
                      style: TextStyle(
                        fontSize: (size.height + size.width) / 60,
                        color: KPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans-bold',
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: <Widget>[
                      PutSvgImage(
                        image: "assets/icons/search_icon.svg",
                        width: (size.height + size.width) / 70,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: (size.height + size.width) / 250),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 470,
                      height: (size.height + size.width) / 50,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: searchview,
                        decoration: const InputDecoration(
                          hintText:
                              "Venha ter a liberdade de construir seu próprio conhecimento",
                          border: OutlineInputBorder(),
                          fillColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: (size.height + size.width) / 50),
                  child: Column(
                    children: <Widget>[
                      PutSvgImage(
                        image: "assets/icons/logonImage.svg",
                        width: (size.height + size.width) / 60,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

        //
        SizedBox(
          width: (size.height + size.width) / 1.7,
          height: (size.height + size.width) / 4,
          child: firstSearch ? _createListView() : _performSearch(),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 70,
            bottom: (size.height + size.width) / 200,
            top: (size.height + size.width) / 200,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              LogoImage(width: 90),
            ],
          ),
        )
      ],
    );
  }
}
