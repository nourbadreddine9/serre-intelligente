import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:app/models/analyse_plante_model.dart';
import 'package:app/screens/analyse_image_screen.dart';
import 'package:app/screens/test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImportImage extends StatefulWidget {
  const ImportImage({Key? key}) : super(key: key);

  @override
  _ImportImageState createState() => _ImportImageState();
}

class _ImportImageState extends State<ImportImage> {
  Uint8List? fileBytes;
  List<File> images = [];
  html.File? pickedFile;
AnalysePlanteModel? analysePlanteModel;
  File? _image;
// api ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  analysPlante() async {
    print('analyse plante');
    if (fileBytes != null && pickedFile != null) {
      FormData formData = FormData.fromMap({
        "image": MultipartFile.fromBytes(
          fileBytes!,
          filename: pickedFile!.name,
        ),
      });
print('data========>${formData}');
      var dio = Dio();
      var response = await dio.request(
        'http://127.0.0.1:5000/predict',
        options: Options(
          method: 'POST',
        ),
        data: formData,
      );

      if (response.statusCode == 200) {
        print("response========>${json.encode(response.data)}");
        analysePlanteModel=AnalysePlanteModel.fromJson(response.data);
        // pour prendre la maladie from response
        print('name==============${analysePlanteModel!.predictedClassName}');
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnalyseImageScreen(nameMaladie:analysePlanteModel!.predictedClassName ,),));

      } else {
        print("error===============>${response.statusMessage}");
      }
    }
  }

  String? tempPath;

  void _pickFile() {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        final reader = html.FileReader();
        reader.readAsArrayBuffer(files[0]);
        reader.onLoadEnd.listen((event) {
          setState(() {
            pickedFile = files[0];
            fileBytes = reader.result as Uint8List?;
          });
        });
      }
    });
  }

// api ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  File? imageTemporary;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  void analysePlante() {
    analysPlante();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF159148),
        title: Row(
          children: [
            Text("Choisir une image",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PoppinsRegular',
                )),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            _image != null
                ? Image.file(
                    _image!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : Image.network('https://picsum.photos/250?image=9'),
            SizedBox(height: 40),
            CustomButton(
              title: ' Choisir  depuis la galerie',
              icon: Icons.image_outlined,
              onClick: () => _pickFile(),
            ),
            SizedBox(height: 30),
            CustomButton(
                title: "Analyse des données  ",
                icon: Icons.image_outlined,
                onClick:() =>  analysePlante()),
          ],
        ),
      ),
    );
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 280,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon, color: Colors.green[700]),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.green[700],
              fontFamily: 'PoppinsRegular',
            ),
          ),
        ],
      ),
    ),
  );
}
