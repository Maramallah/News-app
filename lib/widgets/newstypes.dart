import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String title;
  final String image;

  const MyWidget({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => NewsScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200.0,  // Specify the width of the container
          height: 300.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(image),
              
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Center(
        child: Text("News and more news here!"),
      ),
    );
  }
}
