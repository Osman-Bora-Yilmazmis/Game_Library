import 'package:flutter/material.dart';

import 'data.dart';
import 'main.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class FavDescp extends StatefulWidget {
  const FavDescp({Key? key}) : super(key: key);

  @override
  State<FavDescp> createState() => _FavDescpState();
}

int fav_index = 0;

class _FavDescpState extends State<FavDescp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return SizedBox(
            child: MaterialButton(
              onPressed: () {
                favori_list_guncelle(oyun_listesi, favori);
                Navigator.popUntil(context, ((route) => route.isFirst));
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Color.fromRGBO(0, 122, 255, 1),
                  ),
                ],
              ),
            ),
          );
        }),
        actions: [
          MaterialButton(
            onPressed: () {
              if (favori[fav_index].oyun_favori_mi == true) {
                favori[fav_index].oyun_favori_mi = false;
              } else {
                favori[fav_index].oyun_favori_mi = true;
              }
            },
            child: Row(
              children: const [
                Text(
                  "Favourite",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 122, 255, 1),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Color.fromRGBO(255, 255, 255, 0.92),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  child: Image.network(
                    favori[fav_index].oyun_asseti,
                    height: 291,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Text(
                        favori[fav_index].oyun_ismi,
                        style: const TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text(
                        "Game Description",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Text(favori[fav_index].oyun_tanitimi),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    onPressed: () {},
                    child: Container(
                      width: double.infinity,
                      child: Text("Visit reddit"),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    onPressed: () {},
                    child: Container(
                      width: double.infinity,
                      child: Text("Visit website"),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}

class _FavPageState extends State<FavPage> {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromRGBO(248, 248, 248, 0.92),
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            flexibleSpace: const FlexibleSpaceBar(
              titlePadding: EdgeInsets.fromLTRB(16, 0, 0, 9),
              expandedTitleScale: 1,
              title: PreferredSize(
                preferredSize: Size(double.infinity, 41),
                child: Text(
                  "Favorites",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 0.41,
                  ),
                ),
              ),
            ),
            expandedHeight: 140,
          ),
          SliverList(
            //Gamebox tipinde oluşturulan verilerin ekrana liste üzerinden oluşturulması ve ekrana gösterilmesi
            delegate: SliverChildBuilderDelegate((context, index) {
              final oyun = favori[index];
              return MaterialButton(
                onPressed: () {
                  fav_index = index;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavDescp(),
                    ),
                  );
                },
                child: Container(
                  height: 136,
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child: Row(children: [
                    Image.network(
                      oyun.oyun_asseti,
                      height: 120,
                      width: 104,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              oyun.oyun_ismi,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(text: "metacritic: "),
                                TextSpan(
                                  text: "${oyun.oyun_puani}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(216, 0, 0, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Text(
                            oyun.oyun_kategorisi,
                            style: TextStyle(
                                color: Color.fromRGBO(138, 138, 143, 1)),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            }, childCount: favori.length),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 83,
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(10),
            color: const Color.fromRGBO(248, 248, 248, 0.92),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 80,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.accessibility_new_rounded,
                          size: 30,
                          color: ColorSelect.greyColor,
                        ),
                        SizedBox(
                          height: 12,
                          child: Text(
                            "Games",
                            style: TextStyle(
                              color: ColorSelect.greyColor,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.star,
                          size: 30,
                          color: ColorSelect.blueColor,
                        ),
                        SizedBox(
                          height: 12,
                          child: Text(
                            "Favorites",
                            style: TextStyle(
                              color: ColorSelect.blueColor,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
