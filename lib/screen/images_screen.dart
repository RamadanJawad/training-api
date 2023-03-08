import 'package:api/api/api_read.dart';
import 'package:api/model/student.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:api/model/user_image.dart';
import 'package:flutter/material.dart';

class ImagesScreen extends StatefulWidget {
  final Student? student;
  const ImagesScreen({super.key, this.student});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  double? value;

  Future<void> requestPermissions() async {
    var status = await Permission.storage.status;
    if (status.isPermanentlyDenied) {
      // You can request multiple permissions at once.
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.camera,
      ].request();
      print(statuses[
          Permission.storage]); // it should print PermissionStatus.granted
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images of the ${widget.student!.firstName}"),
      ),
      body: FutureBuilder<List<UserImage>>(
        future: ApiReadData().readImagesByUser(widget.student!.id!),
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
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              snapshot.data![index].image!,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: value != null
                              ? CircularProgressIndicator()
                              : InkWell(
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.blueGrey,
                                    radius: 20,
                                    child: Icon(Icons.download),
                                  ),
                                  onTap: () {
                                    FileDownloader.downloadFile(
                                      url:
                                          "https://images.unsplash.com/photo-1678033950488-6628390612d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
                                              .toString(),
                                      onProgress: (fileName, progress) {
                                        setState(() {
                                          value = progress;
                                        });
                                      },
                                      onDownloadCompleted: (path) {
                                        print("path is : $path");
                                        setState(() {
                                          value = null;
                                        });
                                      },
                                      onDownloadError: (errorMessage) {
                                        print("errorMessage is $errorMessage");
                                      },
                                    );
                                  },
                                ),
                        )
                      ],
                    ),
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
