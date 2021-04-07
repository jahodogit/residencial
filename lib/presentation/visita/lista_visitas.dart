import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:residencial/presentation/providers/parking_provider.dart';
import 'package:residencial/styles.dart';

class ListaVisitasPage extends StatelessWidget {
  const ListaVisitasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParkingProvider parkingProvider = Provider.of<ParkingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Visitantes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: kInputDecoration,
            ),
            Expanded(
              child: parkingProvider.visitas.isNotEmpty
                  ? ListView.builder(
                      itemCount: parkingProvider.visitas.length,
                      itemBuilder: (context, index) {
                        return Text("Hola");
                      })
                  : Center(
                      child: Text("No se encontraron datos"),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed("/visita");
        },
      ),
    );
  }
}
