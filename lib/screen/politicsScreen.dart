import 'package:api/model/articales.dart';
import 'package:api/services/politicsArticles.dart';
import 'package:api/widgets/newsview.dart';
import 'package:flutter/material.dart';

class Politics extends StatefulWidget {
  const Politics({super.key});

  @override
  State<Politics> createState() => _PoliticsState();
}

class _PoliticsState extends State<Politics> {
  List<article> P_articles = [];
   @override
  void initState() {
    // TODO: implement initState
    fetchPolitics();
    super.initState();
  }
   Future<void> fetchPolitics() async {
    final response = await PoliticsArticle.fetchPolitics();
    setState(() {
      P_articles = response;
    });
    print("Articles fetched: ${P_articles.length}"); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'ビジネス',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'ニュース',
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 9, 120, 211),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: newsshow(articles: P_articles,),
            )
          ],
        ),
      ),
    );
  }
}