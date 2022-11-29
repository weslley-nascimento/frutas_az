import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frutas_az/ad_manager.dart';
import 'dart:convert'; //Para usar o JSON
import 'SobreFrutas.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
 //   AdMobManager.showHomeBannerAd();
  }

  //Cria a lista
  List frutas;

  @override
  Widget build(BuildContext context) {

    double largura = MediaQuery.of(context).size.width * 0.7;

    //Cria um Button falso para o anúncio ficar em cima, pro anúncio não ficar por cima da lista
    List<Widget> fakeBottomButtons = new List<Widget>();
    fakeBottomButtons.add(new Container(
      height: 50.0,
    ));

    return Scaffold(

      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text("Frutas A-Z"),
      ),
      body: Container(
          padding: EdgeInsets.all(8),
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("publico/frutas.json"), //Carrega o arquivo json
            builder: (context, snapshot) {
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                      itemCount: mydata == null ? 0 : mydata.length,

                      itemBuilder: (context, indice) {
                      //  print(mydata[indice]['nome'].toString());
                        return GestureDetector(
                          onTap: (){

                          //  AdMobManager.showHomeInterstitialAd();
                            Navigator.push(//Abre a proxima activity quando algum item da lista é clicado
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SobreFrutas(
                                      //Envia o nome da fruta e a descrição para a activity SobreFrutas.dart
                                      nome: mydata[indice]['nome'],
                                      descricao: mydata[indice]["descricao"],
                                      beneficio: mydata[indice]["beneficio"],
                                      nutrientes: mydata[indice]["nutrientes"],
                                      image: mydata[indice]["imagem"],
                                    )
                                )
                            );
                          },
                          child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(

                            decoration: BoxDecoration(
                                color: Colors.teal[400],
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                            //height: 120,
                            height: 80,
                            child: Row(
                              //circuloavatar
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(3),

                                  child: CircleAvatar(
                                    backgroundColor:Colors.teal[700],
                                    radius: 38,

                                    backgroundImage: mydata[indice]["imagem"] != null ? NetworkImage(mydata[indice]["imagem"]) :
                                    AssetImage("dev_assets/icon-adaptive.png"),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Text(
                                        mydata[indice]["nome"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),);
                      },

              );
            },
          ),
        ),
      //Falso Button
      persistentFooterButtons: fakeBottomButtons,
    );
  }
}
/*
(){
                        AdMobManager.showHomeInterstitialAd();
                        Navigator.push(//Abre a proxima activity quando algum item da lista é clicado
                            context,
                            MaterialPageRoute(
                                builder: (context) => SobreFrutas(
                                  //Envia o nome da fruta e a descrição para a activity SobreFrutas.dart
                                  nome: mydata[indice]['nome'],
                                  descricao: mydata[indice]["descricao"],
                                  beneficio: mydata[indice]["beneficio"],
                                  vitaminas: mydata[indice]["vitaminas"],
                                )
                            )
                        );
                      }



                      Text(
                        mydata[indice]['nome'],
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      )


* */
