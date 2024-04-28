import 'package:api/model/articales.dart';
import 'package:api/screen/cinemaScreen.dart';
import 'package:api/screen/politicsScreen.dart';
import 'package:api/screen/sportsScreen.dart';
import 'package:api/services/articels.dart';
import 'package:api/widgets/newstypes.dart';
import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {

  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
List<MyWidget> widgetlist =[ const MyWidget(title: 'Sports', image: 'assets/images/images.jpeg', screen: Sports(),),
         const MyWidget(title: 'Cinema', image: 'assets/images/download (1).jpeg', screen: Cinema(),),
          const MyWidget(title: 'Politics', image: 'assets/images/images (1).jpeg',screen: Politics(),)];

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
    return  Scaffold(
     appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'NEWS ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'HERE',
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
      body:
       Column(
         children: [
           SizedBox(
            width: 500,
           
            child: ListView.builder(itemCount: widgetlist.length,
            scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  widgetlist[index];
                  
                },
            ),
                 ),
     
                
            Expanded(
            child: ListView.builder(
              
                itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          final title = article.title;
          final descreption =article.descreption;
          final imageurl =article.image;
          return Container(
            width: 500,
           
            padding: const EdgeInsets.all(5.0),
            child:  Column(
              children: [
                Container(
                  width: 500,
                  height: 100,
                  decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(imageurl),
              fit: BoxFit.cover,
            ),
          ),
                ),
                Text(title , style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold , color: Colors.black),),
               
            ],
            ),
            
            // child: ListTile(
            //   leading: CircleAvatar(
            //     child: Image.network(imageurl),
            //   ),
            //   title: Text(title),
            //   subtitle: Text(descreption),
            // ),
          );
          
        },
            ),
          ),
          const SizedBox(height: 10,)
                  ],
                 
                
        
         
       ), 
    );
  }
  
}
