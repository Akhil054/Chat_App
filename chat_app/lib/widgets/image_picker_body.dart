import 'package:chat_app/repository/img_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/image_model.dart';

class ImagePickerBody extends StatelessWidget {


  final ImageRepository _imgRepo = ImageRepository();


  ImagePickerBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageModel>>(
        future: _imgRepo.getNetworkImages(), builder: (BuildContext context, AsyncSnapshot<List<ImageModel>> snapshot){
      if(snapshot.hasData) {
        return GridView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index){
          return Image.network(snapshot.data![index].urlSmallSize);
        },
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5
            ),
        );
      }

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      );
    });

  }
}
