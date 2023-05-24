import 'package:flutter/material.dart';
import 'package:flutter_meteo_app_projet_dar23/services/service.dart';
import 'package:flutter_meteo_app_projet_dar23/view/pages/show_meteo_screen.dart';
import 'package:provider/provider.dart';

import 'controllers/meteo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MeteoProvider>(
          create: (_) => MeteoProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MeteoApp',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MeteoApp')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text(
                'Bienvenue sur MeteoApp !!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: AutofillHints.organizationName,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 3.0,
                        color: Colors.white,
                        offset: Offset(1.0, 1.0),
                      ),
                    ]),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 40,
                width: 180,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      shadowColor: Colors.black,
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShowMeteoScreen()));
                      MeteoService().startActions(context, false);
                    },
                    child: const Text('Obtenir la météo',
                        style: TextStyle(fontSize: 17.0))),
              ),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
