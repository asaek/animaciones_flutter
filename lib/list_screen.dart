import 'package:animaciones_cero/screens.dart';
import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  bool _modoLista = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _modoLista = !_modoLista;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_tree_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InicialAnimacionScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (widgetListBuilder, animation) => FadeTransition(
          opacity: animation,
          child: widgetListBuilder,
        ),
        child: _modoLista
            ? Container(
                key: const Key('Gris'),
                padding: const EdgeInsets.all(20),
                color: const Color.fromARGB(66, 128, 128, 128),
                child: Image.asset('assets/imagen02.jpeg'),
              )
            : Container(
                key: const Key('negro'),
                padding: const EdgeInsets.all(20),
                color: Colors.black,
                child: Image.asset('assets/imagen02.jpeg'),
              ),

        // ? ListView.builder(
        //     padding: EdgeInsets.zero,
        //     itemCount: 100,
        //     // itemExtent: 600,
        //     physics: const BouncingScrollPhysics(),
        //     itemBuilder: (context, index) => Padding(
        //       padding: const EdgeInsets.only(bottom: 10),
        //       child: Image.asset('assets/imagen02.jpeg'),
        //     ),
        //   )
        // : GridView.builder(
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2),
        //     itemCount: 20,
        //     itemBuilder: ((context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.all(8),
        //         child: Image.asset('assets/imagen02.jpeg'),
        //       );
        //     }),
        //   ),
      ),
    );
  }
}
