import 'package:flutter/material.dart';
import 'package:flutter_meteo_app_projet_dar23/utils/constants.dart';

import '../../controllers/meteo_provider.dart';
import '../../services/service.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    Key? key,
    required this.meteoProvider,
  }) : super(key: key);

  final MeteoProvider meteoProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/back.png"),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  //return TableRows according to weatherList provided
                  ...List.generate(
                      meteoProvider.weatherList.length,
                      (index) => TableRow(
                              decoration: (index !=
                                      meteoProvider.weatherList.length - 1)
                                  ? const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.black)))
                                  : const BoxDecoration(),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(cities[index],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Row(
                                    children: [
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.thermostat_outlined,
                                            size: 30,
                                          ),
                                          Icon(
                                            Icons.water_drop,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${meteoProvider.weatherList[index].temperature}°C",
                                              style: const TextStyle(
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Text(
                                                "${meteoProvider.weatherList[index].humidity}%",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      size: 85,
                                      MeteoService().getMeteoIcon(meteoProvider
                                          .weatherList[index].icon),
                                    ),
                                  ),
                                ),
                              ]))
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      meteoProvider.reset();
                      meteoProvider.setLoading(true);
                      MeteoService().startActions(context, false);
                    },
                    child: const Text(
                      "Recommencer",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
