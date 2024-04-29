import 'package:api/model/articales.dart';
import 'package:api/services/sportsArticles.dart';
import 'package:api/widgets/newsview.dart';
import 'package:flutter/material.dart';

class Sports extends StatefulWidget {
  const Sports({super.key});

  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  List<article> Sarticles = [];
   @override
  void initState() {
    // TODO: implement initState
    fetchSports();
    super.initState();
  }
   Future<void> fetchSports() async {
    final response = await SportsArticles.fetchSports();
    setState(() {
      Sarticles = response;
    });
    print("Articles fetched: ${Sarticles.length}"); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
       title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'スポーツ',
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
                  color: Color.fromARGB(255, 5, 229, 31),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        ),
      body: Column(
        children: [
          newsshow(articles: Sarticles,)
        ],
      ),
    );
  }
}