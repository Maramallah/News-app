import 'package:api/model/articales.dart';
import 'package:api/services/cinemaArticles.dart';
import 'package:api/widgets/newsview.dart';
import 'package:flutter/material.dart';

class Cinema extends StatefulWidget {
  const Cinema({super.key});

  @override
  State<Cinema> createState() => _CinemaState();
}

class _CinemaState extends State<Cinema> {
  List<article> Carticles = [];
  @override
  void initState() {
    
    fetchCinema();
    super.initState();
  }
   Future<void> fetchCinema() async {
  final response = await CinemaArticle.fetchCinema();
  setState(() {
    Carticles = response;
  });
  print("Articles fetched: ${Carticles.length}"); // Add this debug print
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'エンターテイメント',
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
                  color: Color.fromARGB(255, 197, 9, 200),
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
          newsshow(articles: Carticles,)
        ],
      ),
    );
  }
}