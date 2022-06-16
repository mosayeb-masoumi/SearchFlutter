import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MySearchDeligate());
            },
          )
        ],
      ),
    );
  }
}

class MySearchDeligate extends SearchDelegate {


  List<String> searchResults = ["Brazil", "Ian", "France", "UAE", "USA"];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null); // close search bar
              } else {
                query = "";
              }
            },
            icon: Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        close(context, null); // close search bar
      },
      icon: Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context)=> Center(
      child: Text(
        query ,
        style: TextStyle(fontSize: 64 , fontWeight: FontWeight.bold),
      ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {


    List<String> suggestions = searchResults.where((searchResult){

      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);

    }).toList();




    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {

          final suggestion  = suggestions[index];

          return ListTile(
             title: Text(suggestion),
             onTap: (){
               query = suggestion;

               showResults(context);
             },
          );
    });
  }
}
