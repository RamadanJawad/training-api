import 'dart:io';
import 'package:api/api/api_read.dart';
import 'package:api/api/api_response.dart';
import 'package:api/model/student_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  XFile? file;
  double? value = 0;
  late ImagePicker imagePicker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Image"),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            minHeight: 7,
            color: Colors.green,
            value: value,
          ),
          Expanded(
              child: file != null
                  ? Image.file(File(file!.path))
                  : IconButton(
                      onPressed: () async {
                        await _pickImage();
                      },
                      icon: const Icon(
                        Icons.photo_library_rounded,
                        size: 70,
                        color: Colors.grey,
                      ))),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                  onPressed: () async {
                    await upload();
                  },
                  icon: const Icon(Icons.cloud_upload_rounded),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.blueGrey),
                  label: Text(
                    "upload",
                    style: GoogleFonts.cairo(fontSize: 18),
                  )))
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        file = image;
      });
    }
  }

  Future<void> upload() async {
    updateProgress();
    ApiResponse<StudentImage> apiResponse =
        await ApiReadData().uploadImages(path: file!.path);
    updateProgress(val: apiResponse.success ? 1 : 0);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${apiResponse.message}"),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
    ));
  }

  void updateProgress({double? val}) {
    setState(() {
      value = val;
    });
  }
}
