import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String item = 'Item1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: LayoutBuilder(
            builder: ((context, constraints) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  // height: constraints.maxHeight,
                  child: Column(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight / 4,
                        width: constraints.maxWidth,
                        child: Image.asset(
                          'images/image1.png',
                          cacheHeight: (constraints.maxHeight ~/ 4).toInt(),
                          cacheWidth: constraints.maxWidth.toInt(),
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight / 8,
                        alignment: Alignment.center,
                        child: const Text('Menu del gioro',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                          height: constraints.maxHeight / 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getButton(item, 'Primi piatti', 'Item1'),
                              getButton(item, 'Secondi piatti', 'Item2'),
                              getButton(item, 'Frutta e dolce', 'Item3')
                            ],
                          )),
                      getSizedBox(constraints.maxHeight, 'Item1',
                          'Pasta di semola con asparagi e gorgonzola '),
                      const SizedBox(
                        height: 10,
                      ),
                      getSizedBox(constraints.maxHeight, 'Item2',
                          'Pasta di semola al pomodora'),
                      const SizedBox(
                        height: 10,
                      ),
                      getSizedBox(constraints.maxHeight, 'Item3',
                          'Pasta di semola al pesto'),
                    ],
                  ),
                ),
              );
            }),
          ),
        ));
  }

  Widget getButton(String item, String value, String currentItem) {
    if (item == currentItem) {
      return TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
          onPressed: () {
            item = 'currentItem';
            setState(() {});
          },
          child: Text(
            value,
            style: const TextStyle(color: Colors.white),
          ));
    }

    return TextButton(
        onPressed: () {
          item = 'currentItem';
        },
        child: Text(
          value,
          style: TextStyle(color: Colors.black),
        ));
  }

  ListView? getItemCollection(String item, String value) {
    String image;
    if (item == 'Item1') {
      image = 'image2';
    } else if (item == 'Item2') {
      image = 'image3';
    } else {
      image = 'image4';
    }
    return ListView(children: [
      Row(children: [
        Image.asset(
          'images/$image.png',
          cacheHeight: 100,
          cacheWidth: 100,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 30, 0),
                child: Text(value,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(5, 10, 00, 0),
                  child: Icon(
                    IconData(0xe532, fontFamily: 'MaterialIcons'),
                    size: 20,
                  ))
            ],
          ),
        ),
      ]),
    ], scrollDirection: Axis.vertical);
  }

  Widget getSizedBox(double maxHeight, String item, String value) {
    return Flexible(
      // height: maxHeight / 7,
      child: getItemCollection(item, value)!,
    );
  }
}
