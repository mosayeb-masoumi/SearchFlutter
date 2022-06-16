import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_list_futter/example2/Book.dart';





class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var controller = TextEditingController();

  List<Book> books = allBooks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(35),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "book title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue))),
              onChanged: searchBook,
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];

                    return ListTile(
                      leading: Image.network(
                        book.urlImage,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(book.title),
                      onTap: () {},
                    );
                  }))
        ],
      ),
    );
  }

  void searchBook(String query) {
    final suggestion = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);
    }).toList();

    setState(() {
      books = suggestion;
    });
  }
}
