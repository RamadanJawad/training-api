import 'package:api/api/api_read.dart';
import 'package:api/model/student_image.dart';
import 'package:api/screen/upload_image.dart';
import 'package:flutter/material.dart';

class GetImage extends StatefulWidget {
  const GetImage({super.key});

  @override
  State<GetImage> createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => UploadImage()));
              },
              icon: Icon(Icons.upload_rounded),
            ),
          )
        ],
      ),
      body: FutureBuilder<List<StudentImage>>(
        future: ApiReadData().readImages(),
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
                    margin: const EdgeInsets.all(5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          snapshot.data![index].imageUrl!,
                          fit: BoxFit.fill,
                        )),
                  );
                });
          } else {
            return const Center(child: Text("no data"));
          }
        },
      ),
    );
  }
}
