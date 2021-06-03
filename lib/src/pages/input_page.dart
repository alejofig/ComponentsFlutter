import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _fecha = "";
  String _opcion_seleccionada = "Volar";
  List<String> _poderes = ["Volar", "Agua", "Fuego"];
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Page"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text("Letras ${_nombre.length}"),
          hintText: "Nombre de la persona",
          labelText: "Nombre",
          helperText: "Solo es el nombre",
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es $_nombre"),
      subtitle: Text('Email $_email'),
      trailing: Text(_opcion_seleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text("Letras ${_nombre.length}"),
          hintText: "Email",
          labelText: "Email",
          helperText: "Email",
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text("Letras ${_nombre.length}"),
          hintText: "Password",
          labelText: "Password",
          helperText: "Password",
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Fecha de nacimiento",
          labelText: "Fecha de nacimiento",
          suffixIcon: Icon(Icons.perm_contact_cal),
          icon: Icon(Icons.calendar_today)),
    );
  }

  _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        firstDate: new DateTime(2018),
        initialDate: new DateTime.now(),
        locale: Locale("es", "ES"),
        lastDate: new DateTime(2025));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _opcion_seleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              _opcion_seleccionada = opt.toString();
            });
          },
        )
      ],
    );
  }
}
