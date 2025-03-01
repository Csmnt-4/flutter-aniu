import 'package:aniu/data/values.dart';
import 'package:aniu/models/new.dart';
import 'package:flutter/material.dart';
import 'anime.dart';

Widget swiper(BuildContext context, List? items) {
  return Container(
    height: 230,
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (items ?? []).length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              _toAnimePage(context, (items ?? [])[index].id);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://aniu.ru/posters/"+(items ?? [])[index].poster+".jpg",
                    fit: BoxFit.cover,
                    height: 180,
                  ),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  width: 150,
                  height: 40,
                  child: Text(
                      (items ?? [])[index].titleRu,
                      textAlign: TextAlign.center,
                      style: smallStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis
                  ),
                ),)
              ],
            ),),
          );
        }
    ),
  );
}

Widget characterSwiper(BuildContext context, List<Role>? roles) {
  return SizedBox(
    height: 225,
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (roles ?? []).length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              // TODO?: _toCharacterPage(context, (items ?? [])[index].character.url);
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    (roles ?? [])[index].character!.images!.original!,
                    fit: BoxFit.cover,
                    height: 180,
                  ),
                ),
          Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: SizedBox(
                  width: 150,
                  height: 40,
                  child: Text(
                      (roles ?? [])[index].character!.nameRu!,
                      textAlign: TextAlign.center,
                      style: cardTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis
                  ),
                ),)
              ],
            ),
          );
        }
    ),
  );
}

void _toAnimePage(BuildContext context, String id) async {
  await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AnimePage(id: id)
      )
  );
}