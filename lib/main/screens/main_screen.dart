import 'package:countdown/main/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        ),
      ],
      child: BidsModifier(),
    );
  }
}

class BidsModifier extends StatefulWidget {
  @override
  _BidsModifierScreenState createState() => _BidsModifierScreenState();
}

class _BidsModifierScreenState extends State<BidsModifier> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainProvider>(context);
    return Scaffold();
  }
}
