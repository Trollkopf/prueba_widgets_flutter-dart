import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Like',
      color: Colors.white,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Like'),
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
      switch(_indiceSeleccionado){
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

  //SCAFFOLD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[IconButton(onPressed: _likeThis, icon: _corazon)],
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _likeThis,
        backgroundColor: Colors.red,
        child: _corazon,
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
              '${_visualizacion}',
              style: TextStyle(color: Colors.red, fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
