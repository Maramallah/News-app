import 'package:api/model/articales.dart';
import 'package:flutter/material.dart';

class newsshow extends StatelessWidget {
  final article articlee;
  const newsshow({super.key, required this.articlee});

  @override
  Widget build(BuildContext context) {
    return  Container(
       width: 200.0,  // Specify the width of the container
          height: 300.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),

    ),
    child: Column(
      children: [
        
        Text(articlee.title,  style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
              Text(articlee.descreption,style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.bold,) )
      ],
    ),
    );
  }
  }
