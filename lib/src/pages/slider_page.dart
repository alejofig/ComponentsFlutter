import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSilder = 100.0;
  bool? _bloquarCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slider")),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              _crearSlider(),
              _checkBox(),
              Expanded(child: _crearImagen())
            ],
          )),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen",
      value: _valorSilder,
      min: 10.0,
      max: 400.0,
      onChanged: (valor) {
        setState(() {
          _valorSilder = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          "https://i.pinimg.com/originals/f3/a9/c4/f3a9c4a31f6eca03d3e2463c8f53a251.jpg"),
      width: _valorSilder,
      fit: BoxFit.contain,
    );
  }

  Widget _checkBox() {
    return Checkbox(
        value: _bloquarCheck,
        onChanged: (valor) {
          setState(() {
            _bloquarCheck = valor;
          });
        });
  }
}
