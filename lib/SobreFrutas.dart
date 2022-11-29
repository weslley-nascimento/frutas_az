import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SobreFrutas extends StatefulWidget {

  String nome;
  String descricao;
  String beneficio;
  String nutrientes;
  String image;

  SobreFrutas({
    this.nome,
    this.descricao,
    this.beneficio,
    this.nutrientes,
    this.image
  });//Carrega os valores nome e descrição da Activity Home


  @override
  _SobreFrutasState createState() => _SobreFrutasState();
}

class _SobreFrutasState extends State<SobreFrutas> {

  String _beneficio;
  String _nutrientes = " ";

  @override
  Widget build(BuildContext context) {

    if("${widget.beneficio}" != "null"){
      _beneficio = "${widget.beneficio}";
    }else{
      _beneficio = " ";
    }

    if("${widget.nutrientes}" != "null"){
      _nutrientes = "${widget.nutrientes}";
    }else{
      _nutrientes = " ";
    }

    //Cria um Button falso para o anúncio ficar em cima, pro anúncio não ficar por cima da lista
    List<Widget> fakeBottomButtons = new List<Widget>();
    fakeBottomButtons.add(new Container(
      height: 50.0,
    ));

    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text("${widget.nome}"),//Carrega o nome da fruta no título do AppBar
      ),

      body: Container(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "${widget.nome}",//Exibe o valor nome importado da Home
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                CircleAvatar(
                  radius: 45,
                  backgroundColor:Colors.teal[200],
                  backgroundImage: "${widget.image}" != null ? NetworkImage("${widget.image}"):AssetImage("dev_assets/icon-adaptive.png"),
                ),
                Padding(padding: EdgeInsets.only(top: 24)),
                Text(
                  "${widget.descricao}",//Exibe o valor descrição importado da Home
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.justify,
                ),

                Padding(padding: EdgeInsets.only(top: 12)),
                Text(
                  _beneficio,//Exibe o valor beneficio importado da Home
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.justify,
                ),

                Padding(padding: EdgeInsets.only(top: 12)),
                Text(
                  _nutrientes,//Exibe o valor vitaminas importado da Home
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                  //textAlign: TextAlign.left,
                )
              ],
            )
        ),
      ),
      //Falso Button
      persistentFooterButtons: fakeBottomButtons,
    );
  }
}
