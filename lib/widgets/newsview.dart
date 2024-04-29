import 'package:api/model/articales.dart';
import 'package:flutter/material.dart';

class newsshow extends StatelessWidget {
  final List<article> articles;
  
  const newsshow({super.key, required this.articles});

  @override
Widget build(BuildContext context) {
  print("Number of articles in newsshow: ${articles.length}"); 
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 700,
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          final title = article.title;
          final description = article.descreption; 
          final imageurl =article.image;
          return Container(
  padding: const EdgeInsets.all(5.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.network(
        imageurl,
        fit: BoxFit.contain, // Adjust how the image fits the container
      ),
      SizedBox(height: 8), // Add some space between image and title
      Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      SizedBox(height: 8), // Add some space below the title
      Text(
        description,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      Divider(), // Optional: Add a divider between articles
    ],
  ),
);
          
        },
      ),
    ),
  );
}}