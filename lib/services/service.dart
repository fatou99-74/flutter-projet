import 'package:flutter/cupertino.dart';
import 'package:flutter_meteo_app_projet_dar23/controllers/meteo_provider.dart';
import 'package:flutter_meteo_app_projet_dar23/services/api_service.dart';
import 'package:provider/provider.dart';

class MeteoService {
  void startActions(BuildContext context, bool isRetry) {
    Provider.of<MeteoProvider>(context, listen: false).reset();
    Provider.of<MeteoProvider>(context, listen: false).setLoading(true);
    getMeteoPays(context);
  }

  void animateMessage(BuildContext context) {
    MeteoProvider meteoProvider =
        Provider.of<MeteoProvider>(context, listen: false);
    if (!meteoProvider.isLoading) {
      return;
    }

    Future.delayed(const Duration(seconds: 6), () {
      if (meteoProvider.messageIndex == 2) {
        meteoProvider.setMessageIndex = 0;
      } else {
        meteoProvider.incrementMessageIndex(1);
      }
      if (meteoProvider.isLoading) {
        animateMessage(context);
      } else {
        meteoProvider.setMessageIndex = 0;
      }
    });
  }

  void getMeteoPays(context) {
    MeteoProvider meteoProvider =
        Provider.of<MeteoProvider>(context, listen: false);
    if (!meteoProvider.isLoading) {
      return;
    }
    if (meteoProvider.getCounter == 0) {
      animateMessage(context);
    }

    Future.delayed(const Duration(seconds: 10), () async {
      await fetchMeteo(meteoProvider.counter).then((value) async {
        meteoProvider.addWeatherList(value);
        if (meteoProvider.getCounter == 4) {
          Future.delayed(const Duration(seconds: 1), () {
            meteoProvider.setLoading(false);
          });
        } else {
          meteoProvider.incrementCounter();
          getMeteoPays(context);
        }
      });
    });
  }

  IconData getMeteoIcon(String icon) {
    switch (icon) {
      case "01d":
        return CupertinoIcons.sun_max;
      case "01n":
        return CupertinoIcons.moon;
      case "02d":
        return CupertinoIcons.cloud_sun;
      case "02n":
        return CupertinoIcons.cloud_moon;
      case "03d":
        return CupertinoIcons.cloud;
      case "04n":
        return CupertinoIcons.cloud_fill;
      case "09n":
        return CupertinoIcons.cloud_drizzle;
      case "10n":
        return CupertinoIcons.cloud_rain;
      case "11n":
        return CupertinoIcons.cloud_bolt;
      case "13n":
        return CupertinoIcons.cloud_snow;
      case "50d":
        return CupertinoIcons.cloud_fog;
      default:
        return CupertinoIcons.cloud;
    }
  }
}
