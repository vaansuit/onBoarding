import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/database_helper.dart';
import '../home/home_page.dart';
import 'widgets/slide.dart';

class OnboardingPage extends StatefulWidget {
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  String? _userName;

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);

    if (seen) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      await prefs.setBool('seen', true);
    }
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
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
                          'Programado por um brasileiro (eu mesmo), o Fokus App nasceu com o objetivo de facilitar a vida dos usu??rios. Acabamos n??o percebendo quantas vezes no dia abrimos as redes sociais no celular, o que pode acabar diminuindo sua produtividade e causando problemas de concentra????o.',
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
                          'Aqui, voc?? pode bloquear seus aplicativos por um determinado per??odo de tempo, te ajudando a focar nos estudos ou naquele projeto pessoal que est?? abandonado faz um tempo.. As redes sociais s??o maravilhosas (menos o twitter), mas elas podem nos fazer perder a coisa mais preciosa das nossas vidas, o tempo..',
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 80,
                          horizontal: 20,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Voc?? poder?? configurar a quantidade de minutos/horas que seus aplicativos ficar??o bloqueados, n??o sendo poss??vel bloquear por mais de 24 horas. Est?? pronto para come??ar?',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Overpass',
                          ),
                        ),
                      ),
                      CustomImageContainer()
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
            child: SingleChildScrollView(
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
                            'Como voc?? gostaria de ser chamado?',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Overpass',
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) => _userName = value),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 30,
                          ),
                          width: 140,
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              dbHelper.updateUserName(_userName!);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                            child: const Text('Entrar!'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('img/arrow_right.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
