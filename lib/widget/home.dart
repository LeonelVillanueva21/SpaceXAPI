import 'package:flutter/material.dart';
import 'package:spacex/api/api_spacex.dart';
import 'package:spacex/model/space_model.dart';

class SpaceHome extends StatefulWidget {
  const SpaceHome({super.key});

  @override
  State<SpaceHome> createState() => _SpaceHomeState();
}

class _SpaceHomeState extends State<SpaceHome> {
  final SpaceXAPI client = SpaceXAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Center(
          child: Text(
            "SpaceX NOTICIAS",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: client.getnwspace(),
        builder: (BuildContext context, AsyncSnapshot<List<Space>> snapshot) {
          if (snapshot.hasData) {
            List<Space>? spaceNews = snapshot.data;
            return ListView.builder(
              itemCount: spaceNews?.length,
              itemBuilder: (context, index) {
                final space = spaceNews![index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (space.imageUrl.isNotEmpty) 
                          Image.network(space.imageUrl),
                        const SizedBox(height: 8.0),
                        Text(
                          space.name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Fecha de lanzamiento: ${space.dateUtc}',
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Estado: ${space.success ? "Exito" : "Fracaso"}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: space.success ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
