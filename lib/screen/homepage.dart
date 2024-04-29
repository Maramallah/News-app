import 'package:api/model/articales.dart';
import 'package:api/screen/cinemaScreen.dart';
import 'package:api/screen/politicsScreen.dart';
import 'package:api/screen/sportsScreen.dart';
import 'package:api/services/articels.dart';
import 'package:api/widgets/newstypes.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

List<MyWidget> widgetlist = [
  const MyWidget(title: 'スポーツ', image: 'assets/images/images.jpeg', screen: Sports()),
  const MyWidget(title: 'エンターテイメント', image: 'assets/images/download (1).jpeg', screen: Cinema()),
  const MyWidget(title: 'ビジネス', image: 'assets/images/images (1).jpeg', screen: Politics()),
];

class _HomepageState extends State<Homepage> {
  List<article> articles = [];

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  Future<void> fetchUsers() async {
    final response = await Articleapi.fetchUsers();
    setState(() {
      articles = response;
    });
    print("Articles fetched: ${articles.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'ニュース ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'こちら',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: widgetlist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return widgetlist[index];
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final article = articles[index];
                final title = article.title;
                final imageurl = article.image;
                return Container(
                  width: 500,
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Container(
  padding: const EdgeInsets.all(5.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.network(
        imageurl,
        fit: BoxFit.contain, 
      ),
      SizedBox(height: 8), 
      Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      Divider(),
    ],
  ),
),

                    ],
                  ),
                );
              },
              childCount: articles.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
        ],
      ),
    );
  }
}
