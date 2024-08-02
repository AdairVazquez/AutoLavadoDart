import 'package:adair_9ids2/Pages/ListaAutos.dart';
import 'package:flutter/material.dart';
import 'package:adair_9ids2/Pages/Home.dart';
import 'package:adair_9ids2/Pages/ListaCitas.dart';
import 'package:adair_9ids2/Pages/Citas.dart';

class paginaInicio extends StatefulWidget {
  const paginaInicio({super.key});

  @override
  State<paginaInicio> createState() => _paginaInicioState();
}

class _paginaInicioState extends State<paginaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'AutoLavado',
          style: TextStyle(
            color: Colors.white, // Cambia el color aquí
          ),
        ),
      ),
      drawer: menuLateral(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de columnas
            crossAxisSpacing: 10, // Espacio horizontal entre elementos
            mainAxisSpacing: 10, // Espacio vertical entre elementos
            childAspectRatio: 1.0, // Relación de aspecto de cada celda
          ),
          children: <Widget>[
            _buildGridItem(
              imageUrl: 'https://cdn-icons-png.freepik.com/512/8260/8260706.png',
              caption: 'Agendar nueva cita',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Citas(idCita: 0)),
                );
              },
            ),
            _buildGridItem(
              imageUrl: 'https://cdn-icons-png.flaticon.com/512/942/942759.png',
              caption: 'Lista de citas',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Listacitas()),
                );
              },
            ),
            _buildGridItem(
              imageUrl: 'https://images.vexels.com/media/users/3/146244/isolated/preview/77fd70114be4a7027595861839cbb099-coche-lavado-con-icono-de-manguera.png',
              caption: 'Lista de servicios disponibles',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            _buildGridItem(
              imageUrl: 'https://cdn-icons-png.flaticon.com/512/2555/2555021.png',
              caption: 'Mis autos',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListaAutos()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class menuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('AutoLavado'),
            accountEmail: Text(''),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          InkWell(
            child: ListTile(
              title: Text('Inicio'),
              leading: Icon(Icons.home, color: Colors.blue),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const paginaInicio()),
              );
            },
          ),
          InkWell(
            child: ListTile(
              title: Text('Nueva cita'),
              leading: Icon(Icons.schedule, color: Colors.blue),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Citas(idCita: 0)), // Actualiza aquí
              );
            },
          ),
          InkWell(
            child: ListTile(
              title: Text('Lista de citas'),
              leading: Icon(Icons.list, color: Colors.blue),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Listacitas()), // Actualiza aquí
              );
            },
          ),
          InkWell(
            child: ListTile(
              title: Text('Lista de servicios'),
              leading: Icon(Icons.settings, color: Colors.blue),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()), // Actualiza aquí
              );
            },
          ),
          InkWell(
            child: ListTile(
              title: Text('Mis autos'),
              leading: Icon(Icons.car_rental, color: Colors.blue),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaAutos()), // Actualiza aquí
              );
            },
          ),
        ],
      ),
    );
  }
}
Widget _buildGridItem({
  required String imageUrl,
  required String caption,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.0), // Espacio entre la imagen y el pie
          Text(
            caption,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
