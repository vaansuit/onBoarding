import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'slide.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String userName = '';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _checkFirstSeen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return SlideableScreen(
                controller: PageController(initialPage: 0),
                children: [
                  Scaffold(
                    backgroundColor: const Color.fromRGBO(202, 223, 237, 1),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(152, 196, 236, 1),
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(10, 10),
                              ),
                            ),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 80,
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Programado por um brasileiro (eu mesmo), o Fokus App nasceu com o objetivo de facilitar a vida dos usuários. Acabamos não percebendo quantas vezes no dia abrimos as redes sociais no celular, o que pode acabar diminuindo sua produtividade e causando problemas de concentração.',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Overpass',
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('img/arrow_right.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Scaffold(
                    backgroundColor: const Color.fromRGBO(202, 223, 237, 1),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(152, 196, 236, 1),
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(10, 10),
                              ),
                            ),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 80,
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Aqui, você pode bloquear seus aplicativos por um determinado período de tempo, te ajudando a focar nos estudos ou naquele projeto pessoal que está abandonado faz um tempo.. As redes sociais são maravilhosas (menos o twitter), mas elas podem nos fazer perder a coisa mais preciosa das nossas vidas, o tempo..',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Overpass',
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('img/arrow_right.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Scaffold(
                    backgroundColor: const Color.fromRGBO(202, 223, 237, 1),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(152, 196, 236, 1),
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(10, 10),
                              ),
                            ),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 80,
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Você poderá configurar a quantidade de minutos/horas que seus aplicativos ficarão bloqueados, não sendo possível bloquear por mais de 24 horas. Está pronto para começar?',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Overpass',
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('img/arrow_right.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: Text('Main Content'),
                ),
              );
            }
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  Future<bool> _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);

    if (!seen) {
      prefs.setBool('seen', true);
    }
    return !seen;
  }
}
