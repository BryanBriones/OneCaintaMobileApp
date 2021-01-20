import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_fade/image_fade.dart';


class JobsBannerImageWidget extends StatefulWidget {
  String imgPath;
JobsBannerImageWidget(this.imgPath);
@override
  _JobsBannerImageWidgetState createState() => _JobsBannerImageWidgetState(this.imgPath);
}


class _JobsBannerImageWidgetState extends State<JobsBannerImageWidget>{
    String imgPath;
_JobsBannerImageWidgetState(this.imgPath);
  String _error;
  String homepicURL;
  bool isLoading = false;
  final _key = new GlobalKey<FormState>();
@override
  Widget build(BuildContext context) { 
      return  Column(children: [
                          Stack(
                            
                             children: [ 
                              Container( 
                                    height: MediaQuery.of(context).size.height *(0.3),
                                    width:MediaQuery.of(context).size.width,
                                    color: Colors.black,
                                      child: ImageFade(
                                              image: AssetImage(imgPath),
                                              placeholder: Container(
                                                color: Color(0xFFCFCDCA).withOpacity(0.3),
                                              ),
                                              fit: BoxFit.cover,
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent event) {
                                                if (event == null) { return child; }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: event.expectedTotalBytes == null ? 0.0 : event.cumulativeBytesLoaded / event.expectedTotalBytes,
                                                    valueColor: AlwaysStoppedAnimation(Colors.blue[900])
                                                  ),
                                                );
                                              }),
                                  ),
         ],)
                          
      ],);                
}

}
