import 'package:flutter/material.dart';
import 'package:flutternews/helper/news.dart';
import 'package:flutternews/views/home.dart';
import 'package:flutternews/views/category_news.dart';
import 'package:flutternews/models/categrie_model.dart';
import 'package:flutternews/helper/data.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Khabar Brief',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyApp1(),
    );
  }
}

class MyApp1 extends StatefulWidget {
  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  List<CategoryModel> categories = new List.empty();
  //List<ArticleModel> articles = new List.empty();
  bool _loading = true;
  var articles;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  void getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Khabar"),
            Text(
              "Brief",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 0.0,
      ),
      drawer: Drawer(
        elevation: 50.0,
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Khabar"),
                Text(
                  "Brief",
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
            _loading
                ? Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          /// Categories
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 800,
                            child: ListView.builder(
                                itemCount: categories.length,
                                // shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return CategoryTile(
                                    imageUrl: categories[index].imageUrl,
                                    categoryName:
                                        categories[index].categoryName,
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
      body: Home(),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryTile({required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 300,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
