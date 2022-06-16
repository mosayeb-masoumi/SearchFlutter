
import 'package:flutter/material.dart';
import 'package:search_list_futter/example3_original/user_model.dart';



class Example3Page extends StatefulWidget {
  const Example3Page({Key? key}) : super(key: key);

  @override
  _Example3PageState createState() => _Example3PageState();
}

class _Example3PageState extends State<Example3Page> {

  List<UserModel> listAll = [];
  void initializeAllList() {
    listAll.add(UserModel("علی", "رضایی"));
    listAll.add(UserModel("حسن", "قربانی"));
    listAll.add(UserModel("مینا", "رسولی"));
    listAll.add(UserModel("رسول", "مینایی"));
  }

  List<UserModel> searchedList = [];



  @override
  void initState() {
    initializeAllList();
    searchedList = listAll;   //copy all list into searchedList
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search page'),
      ),
      body: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              // calls the _searchChanged on textChange
              decoration: InputDecoration(
                hintText: "جستجو نام خانوادگی...",
                prefixIcon: Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.search)
                ),
              ),
              onChanged: (search) => _searchChanged(search),
            ),
          ),

          SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
              itemCount: searchedList.length,
              itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(5),
                  child: createItem(searchedList[index])
                // Text(searchedList[index].family),
              ),
            ),
          ),
        ],
      ),
    );
  }



  // changes the filtered name based on search text and sets state.
  void _searchChanged(String searchText) {
    if (searchText != null && searchText.isNotEmpty) {
      setState(() {
        searchedList = List.from(listAll.where((x) => x.family.contains(searchText)));
      });
    }
    else {
      setState(() {
        searchedList = List.from(listAll);
      });
    }
  }


  Widget createItem(UserModel searchedModel) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      margin: EdgeInsets.only(right: 10,left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.lightBlueAccent
      ),
      child: Column(
        children: [

          Text(searchedModel.name , textAlign: TextAlign.end, style: TextStyle(color: Colors.white ,fontSize: 15),),
          SizedBox(height: 5,),
          Text(searchedModel.family ,textAlign: TextAlign.end, style: TextStyle(color: Colors.white ,fontSize: 15),)

        ],
      ),
    );
  }

}
