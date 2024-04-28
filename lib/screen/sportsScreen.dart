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
      appBar: AppBar(
        title: Text("Sports News "),
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