import 'package:aniu/api/pages.dart';
import 'package:aniu/pages/loading_screen.dart';
import 'package:aniu/pages/swiper.dart';
import 'package:flutter/material.dart';
import '../data/values.dart';

Widget homePage(BuildContext context) {
  Map<String, List> data;
  return FutureBuilder(
    future: fetchHome(),
    builder: (BuildContext context, AsyncSnapshot snap){
      if(snap.data == null) {
        return LoadingScreen(context);
      }
      else {
        data = snap.data;
        return ListView(
          // shrinkWrap: true,
          children: [
            const Text(
                'Аниме',
              style: h1Style
            ),
            const Text('Сейчас в тренде',
                style: h3Style
            ),
            swiper(context, data['popular']),
            const Text('Онгоинги',
                style: h3Style
            ),
            swiper(context, data['ongoings']),
            const Text('Сериалы',
                style: h3Style
            ),
            swiper(context, data['released']),
            const Text('Фильмы',
                style: h3Style
            ),
            swiper(context, data['movies']),
            const Text('Последние обновленные',
                style: h3Style
            ),
            swiper(context, data['new']),
            const Text('Сейчас смотрят',
                style: h3Style
            ),
            swiper(context, data['now']),
          ],
        );
      }
    }
  );
}