import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/image_model.dart';

class ImageRepository{
  Future<List<ImageModel>> getNetworkImages() async {
    var endpointUrl = Uri.parse('https://pixelford.com/api2/images');

    /// getting response string & convert to dart obj
    final response = await http.get(endpointUrl);

    /// better with error handling
    if(response.statusCode == 200){

      /// decoding the list of dynamics & converting to list
      final List<dynamic> decodedList = jsonDecode(response.body) as List;

      /// converting the response to a list of Image
      final List<ImageModel> _imglist = decodedList.map((listItems){
        return ImageModel.fromJson(listItems);
      }).toList();

      print(_imglist[0].urlFullSize);
      return _imglist;
    }
    else{
      throw Exception('API not successfull');
    }
  }

}