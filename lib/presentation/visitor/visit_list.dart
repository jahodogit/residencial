import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:residencial/presentation/providers/parking_provider.dart';
import 'package:residencial/styles.dart';

class VisitListPage extends StatelessWidget {
  const VisitListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParkingProvider parkingProvider = Provider.of<ParkingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Visitors"),
        actions: [
          IconButton(
              icon: Icon(Icons.flash_on),
              onPressed: () => parkingProvider.syncVisita())
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: kInputDecoration,
              onChanged: (value) => parkingProvider.searchVisita(value),
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
                                        "Salida: ${item.salida}",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        "Apto: ${item.lot.apto}",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "Placa: ${item.placavehiculo}",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onDoubleTap: () =>
                                      parkingProvider.updateSalidaVisita(item),
                                  child: Container(
                                    height: 140,
                                    width: 40,
                                    color: item.salida == "Sin salida"
                                        ? Colors.red
                                        : Colors.green[400],
                                    child: Icon(item.salida == "Sin salida"
                                        ? Icons.exit_to_app
                                        : Icons.check),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                  : Center(
                      child: Text("Not data found"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
