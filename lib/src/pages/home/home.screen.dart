import 'package:flutter/material.dart';

import 'components/card.swiper.widget.dart';
import 'components/home.background.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Encuestas',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white54
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                '1701F0193 - ISC',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700
                ),
              )
            ],
          ),
          backgroundColor: Colors.indigoAccent,
          actions: [
            IconButton(
              onPressed: () {}, 
              icon: Icon( Icons.exit_to_app)
            )
          ],
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _swiperTarjetas()
            ],
          ),
        ),
      )
    );
  }


  Widget _swiperTarjetas() {
    return CardSwiper(encuestas: [1,2,3,4]);
  }
}