import 'package:api/api/api_read.dart';
import 'package:api/model/student.dart';
import 'package:api/model/user.dart';
import 'package:api/model/user_image.dart';
import 'package:flutter/material.dart';

class ImagesScreen extends StatefulWidget {
  final Student? student;
  const ImagesScreen({super.key, this.student});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images of the ${widget.student!.firstName}"),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder<List<UserImage>>(
        future: ApiReadData().readImages(widget.student!.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          snapshot.data![index].image!,
                          fit: BoxFit.fill,
                        )),
                  );
                });
          } else {
            return Text("no data");
          }
        },
      ),
    );
  }
}
