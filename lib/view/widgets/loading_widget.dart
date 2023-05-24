import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../controllers/meteo_provider.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.meteoProvider,
  });

  final MeteoProvider meteoProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<MeteoProvider>(
          builder: (context, message, child) => Text(
            meteoProvider.getMessage,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: LinearPercentIndicator(
            animation: true,
            animationDuration: 60000,
            lineHeight: 40,
            percent: 1,
            backgroundColor: Colors.blue.shade200,
            barRadius: const Radius.circular(35),
            progressColor: Colors.green,
          ),
        ),
      ],
    );
  }
}
