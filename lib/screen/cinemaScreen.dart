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
    // TODO: implement initState
    fetchCinema();
    super.initState();
  }
   Future<void>fetchCinema () async {
    final response = await CinemaArticle.fetchCinema();
    setState(() {
      Carticles = response;
    });
    print("Articles fetched: ${Carticles.length}"); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cinema News "),
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