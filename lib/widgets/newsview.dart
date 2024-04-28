import 'package:api/model/articales.dart';
import 'package:flutter/material.dart';

class newsshow extends StatelessWidget {
  final List<article> articles;
  
  const newsshow({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder
      (itemCount: articles.length,
        itemBuilder: (context, index) {
            final article = articles[index];
             final title = article.title;
             final descreption =article.descreption;
            //final imageurl =article.image;
          return ListTile(
            title: Text(title),
            subtitle: Text(descreption),
          );  
         }
         
      ),
    );
     }
  }

