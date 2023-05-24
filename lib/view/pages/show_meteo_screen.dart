import 'package:flutter/material.dart';
import 'package:flutter_meteo_app_projet_dar23/controllers/meteo_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/loading_widget.dart';
import '../widgets/weather_widget.dart';

class ShowMeteoScreen extends StatefulWidget {
  const ShowMeteoScreen({super.key});

  @override
  State<ShowMeteoScreen> createState() => _ShowMeteoScreenState();
}

class _ShowMeteoScreenState extends State<ShowMeteoScreen> {
  @override
  Widget build(BuildContext context) {
    MeteoProvider meteoProvider = Provider.of<MeteoProvider>(context);
    return (meteoProvider.isLoading)
        ? Scaffold(
            appBar: AppBar(
              title: const Text(
                style: TextStyle(color: Colors.white),
                "Chargement",
                overflow: TextOverflow.ellipsis,
              ),
              leading: const Text(''),
            ),
            body: Center(
              child: LoadingWidget(meteoProvider: meteoProvider),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                style: TextStyle(color: Colors.white),
                "Météo",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            body: Center(child: WeatherWidget(meteoProvider: meteoProvider)),
          );
  }
}
