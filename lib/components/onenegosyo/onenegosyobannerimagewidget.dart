import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_fade/image_fade.dart';


class OneNegosyoBannerImageWidget extends StatefulWidget {
  String imgPath;
OneNegosyoBannerImageWidget(this.imgPath);
@override
  _OneNegosyoBannerImageWidgetState createState() => _OneNegosyoBannerImageWidgetState(this.imgPath);
}


class _OneNegosyoBannerImageWidgetState extends State<OneNegosyoBannerImageWidget>{
    String imgPath;
_OneNegosyoBannerImageWidgetState(this.imgPath);
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
                                    height: MediaQuery.of(context).size.height *(0.4),
                                    width:MediaQuery.of(context).size.width,
                                    color: Colors.black,
                                      child: ImageFade(
                                              image: NetworkImage(imgPath),
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
