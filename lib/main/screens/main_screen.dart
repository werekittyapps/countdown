import 'package:countdown/functions/orientations.dart';
import 'package:countdown/main/providers/main_provider.dart';
import 'package:countdown/global_values.dart' as global;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setPortrait();
    global.displayWidth = MediaQuery.of(context).size.width;
    global.displayWidth = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        ),
      ],
      child: _MainScreen(),
    );
  }
}

class _MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown'),
      ),
      body: Stack(children: [
        ListView(children: [
          Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
              alignment: Alignment.center,
              child: Text(
                provider.target == 0 ? 'Common!': provider.target.toString(),
                style: TextStyle(fontSize: 24.0),
              )
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 6,
                  left: MediaQuery.of(context).size.width / 5,
                  right: MediaQuery.of(context).size.width / 5
              ),
              height: 40.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).hintColor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Text('LET\'S COUNTDOWN'),
            ),
            onTap: provider.numbers.length != 6 ? null : () {
              provider.setTargetWithSolution(steps: (4 + provider.random.nextInt(3)));
              /// provider.setTarget();
            },
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Text(
                          provider.numbers.length < 1 ? '' : provider.numbers[0].toString(),
                          style: TextStyle(fontSize: 24.0)),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    height: 40.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Text(
                          provider.numbers.length < 2 ? '' : provider.numbers[1].toString(),
                          style: TextStyle(fontSize: 24.0)),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    height: 40.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Text(
                          provider.numbers.length < 3 ? '' : provider.numbers[2].toString(),
                          style: TextStyle(fontSize: 24.0)),
                    ),
                  ),
                ]),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Text(
                          provider.numbers.length < 4 ? '' : provider.numbers[3].toString(),
                          style: TextStyle(fontSize: 24.0)),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    height: 40.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Text(
                          provider.numbers.length < 5 ? '' : provider.numbers[4].toString(),
                          style: TextStyle(fontSize: 24.0)),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    height: 40.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Text(
                          provider.numbers.length < 6 ? '' : provider.numbers[5].toString(),
                          style: TextStyle(fontSize: 24.0)),
                    ),
                  ),
                ]),
          ),
        ]),
        if (provider.numbers.length != 6)
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
                    child: InkWell(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0, left: 20.0),
                        padding: EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        height: 50.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).hintColor, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text(
                            'Добавить большое',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16.0)),
                      ),
                      onTap: () {
                        provider.setBigOne();
                      },
                    ),
                  ),
                  Expanded(flex: 5, child: SizedBox(height: 50.0)),
                  Expanded(
                    flex: 6,
                    child: InkWell(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0, right: 20.0),
                        padding: EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        height: 50.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).hintColor, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Container(
                          child: Text(
                              'Добавить маленькое',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.0)),
                        ),
                      ),
                      onTap: () {
                        provider.setLittleOne();
                      },
                    ),
                  ),
                ]),
          ),
        if (provider.numbers.length == 6)
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                height: 40.0,
                width: 40.0,
                child: Icon(Icons.refresh, size: 36.0),
              ),
              onTap: () {
                provider.refresh();
              },
            ),
          )
      ]),
    );
  }
}
