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
                        var item = parkingProvider.visitas[index];
                        return Container(
                          height: 140,
                          child: Card(
                            color: Colors.cyan,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.person,
                                      size: 40,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.cedula,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        item.nombre,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "Entrada: ${item.entrada}",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        "Salida: ${item?.salida}",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        "Apto: apto",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "Placa: ${item.placavehiculo}",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 140,
                                  width: 40,
                                  color: Colors.red,
                                  child: Icon(Icons.exit_to_app),
                                )
                              ],
                            ),
                          ),
                        );
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
