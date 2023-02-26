import 'package:api/api/api_read.dart';
import 'package:api/model/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: searchController,
              onChanged: (val) {
                setState(() {
                  searchController.text = val;
                });
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {
                        searchController.text = '';
                      },
                      icon: Icon(Icons.clear)),
                  hintText: "search of user..",
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Search>>(
        future: ApiReadData().searchUser(name: searchController.text),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "${snapshot.data![index].firstName!} ${snapshot.data![index].lastName}",
                      style: GoogleFonts.cairo(fontSize: 18),
                    ),
                    subtitle: Text(
                      snapshot.data![index].email!,
                      style:
                          GoogleFonts.cairo(fontSize: 16, color: Colors.grey),
                    ),
                  );
                });
          } else {
            return Center(
              child: Text("no user found"),
            );
          }
        },
      ),
    );
  }
}
