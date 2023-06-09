import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Widgets Flutter',
      color: Colors.white,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Detección de plataforma'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //CONSTANTES/VARIABLES
  Icon _corazon = Icon(Icons.favorite, color: Colors.white);
  bool _likeBool = true;
  int _indiceSeleccionado = 0;
  String _visualizacion = "0: Inicio";
  String etiquetaIconoNav = "Inicio";

  //FUNCIONES
  void _likeThis() {
    setState(() {
      if (_likeBool) {
        _corazon = Icon(Icons.favorite_border, color: Colors.white);
        _likeBool = false;
      } else {
        _corazon = Icon(Icons.favorite, color: Colors.white);
        _likeBool = true;
      }
    });
  }

  void _itemPulsado(int index) {
    setState(() {
      _indiceSeleccionado = index;
      switch (_indiceSeleccionado) {
        case 0:
          {
            _visualizacion = '$_indiceSeleccionado: Inicio';
          }
          break;
        case 1:
          {
            _visualizacion = '$_indiceSeleccionado: Mi Cuenta';
          }
          break;
        case 2:
          {
            _visualizacion = '$_indiceSeleccionado: Estadísticas';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? cupertino() : material();
  }

  //MATERIAL PARA ANDROID
  @override
  Widget material() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[IconButton(onPressed: _likeThis, icon: _corazon)],
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _likeThis,
        backgroundColor: Colors.red,
        child: const Icon(Icons.favorite_outline_sharp),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: String.fromEnvironment('Inicio'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Colors.white,
            ),
            label: String.fromEnvironment('Mi Cuenta'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assessment,
              color: Colors.white,
            ),
            label: String.fromEnvironment('Estadísticas'),
          ),
        ],
        backgroundColor: Colors.red,
        onTap: _itemPulsado,
        currentIndex: _indiceSeleccionado,
      ),

      //  APPBAR CON BOTON DE LIKE AL CENTRO
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.red,
      //   child: Container(
      //     height: 50,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: <Widget>[
      //         IconButton(
      //             icon: Icon(
      //               Icons.add_location,
      //               color: Colors.white,
      //             ),
      //             onPressed: null
      //         ),
      //         IconButton(
      //             icon: Icon(
      //               Icons.forward,
      //               color: Colors.white,
      //             ),
      //             onPressed: null
      //         ),
      //       ],
      //     ),
      //   ),
      //   shape: CircularNotchedRectangle(),
      // ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _visualizacion,
              style: const TextStyle(color: Colors.red, fontSize: 40),
            )
          ],
        ),
      ),

      drawer: const Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menú navegación',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Text(
              'Enlace 1',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Enlace 2',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Enlace 3',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }


  // CUPERTINO PARA IOS
  Widget cupertino() {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'estilo Cupertino',
              style: TextStyle(fontSize: 20, decoration: TextDecoration.none),
            )
          ],
        ),
      ),
      navigationBar: CupertinoNavigationBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        automaticallyImplyLeading: true,
        middle: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.add_shopping_cart,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
