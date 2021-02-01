import 'package:flutter/material.dart';
import 'package:loja_virtual/app/presentation/ui/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/shared/resources/strings.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  bool animationStart = false;
  String text = "CLIQUE EM MIM SE VC FOR A MONYNY";
  double margin = 300;
  String animation = 'assets/naruto.json';
  bool repeat = false;

  @override
  void initState() {
    super.initState();
        repeat = false;

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(HOME_LABEL),
      ),
      body: ListView(
        children: [
          Visibility(
            visible: animationStart,
            child: Lottie.asset(
              animation,
              repeat: repeat,
              reverse: false,
              animate: animationStart,
            ),
          ),
          AnimatedContainer(
            margin: EdgeInsets.only(top: margin),
            duration: Duration(seconds: 2),
                      child: SizedBox(
              height: 44,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: RaisedButton(
                  textColor: Colors.deepOrange,
                  color: Colors.white,
                  onPressed: repeat == false ? () {
                    setState(() {
                      animationStart = true;
                      margin = 150;
                      
                      if(text.contains("CLIQUE EM MIM SE VC FOR A MONYNY")) {
                        text = "NAO CLIQUE EM MIM DE NOVO!";
                      } else {
                        text = "EU AVISEI!!!!!!!";
                        animation = 'assets/cachorro.json';
                        animationStart = true;
                        repeat = true;
                      }
                    });
                  } : null,
                  child: Text(text),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
