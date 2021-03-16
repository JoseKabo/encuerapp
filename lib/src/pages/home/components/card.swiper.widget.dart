import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper(
    {
      Key key,
      @required this.encuestas
    }
  ) : super(key: key);

  final List<dynamic> encuestas;


  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return  Container(
      padding: EdgeInsets.only(
        top: 15
      ),
      
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.85,
        itemHeight: _screenSize.height * 0.7,
        itemBuilder: (BuildContext context,int index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.cover,)
            );
        },
        itemCount: encuestas.length,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}