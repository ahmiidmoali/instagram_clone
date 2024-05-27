import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

imageUploadCamera() async {
  final PickedFile? file = await ImagePicker()
      .getImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

imageUploadGallery() async {
  final PickedFile? file = await ImagePicker()
      .getImage(source: ImageSource.gallery, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

enum RequestResult { success, failure, catchfailure }

Future<RequestResult> addRequestWithImageOne(url, data, File? image,
    [String? namerequest]) async {
  namerequest ??= "files";

  var uri = Uri.parse(url);
  var request = http.MultipartRequest("POST", uri);
  // request.headers.addAll(_myheaders);

  if (image != null) {
    var length = await image.length();
    var stream = http.ByteStream(image.openRead());
    stream.cast();
    var multipartFile = http.MultipartFile(namerequest, stream, length,
        filename: basename(image.path));
    request.files.add(multipartFile);
  }

  // add Data to request
  data.forEach((key, value) {
    request.fields[key] = value;
  });
  // add Data to request
  // Send Request
  var myrequest = await request.send();
  // For get Response Body
  var response = await http.Response.fromStream(myrequest);
  if (response.statusCode == 200 || response.statusCode == 201) {
    print(response.body);
    Map responsebody = jsonDecode(response.body);
    return RequestResult.success;
  } else {
    return RequestResult.failure;
  }
}
