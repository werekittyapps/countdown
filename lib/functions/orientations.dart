import 'package:flutter/services.dart';

void setPortrait() async{
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,

  ]);
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
}

void setAllOrientations() async{
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,

  ]);
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
}