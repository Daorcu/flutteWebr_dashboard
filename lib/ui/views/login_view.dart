import 'package:dashboard_1/router/router.dart';
import 'package:dashboard_1/ui/buttons/custom_outlined_button.dart';
import 'package:dashboard_1/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 30),
      color: Colors.deepOrange[600],
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
              child: Column(children: [
            TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.white),
                decoration: buildInputDecoration(
                  hint: 'Ingrese su correo',
                  label: 'Email',
                  icon: Icons.email_outlined,
                )),
            SizedBox(height: 20),
            TextFormField(
                obscureText: true,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.white),
                decoration: buildInputDecoration(
                  hint: 'Ingrese su contrseña',
                  label: 'Contraseña',
                  icon: Icons.lock_outline_rounded,
                )),
            SizedBox(height: 20),
            CustomOutlinedButton(
              text: 'Ingresar',
              onPressed: () {},
            ),
            SizedBox(height: 20),
            LinkText(
              text: 'Crear Cuenta',
              onPressed: () {
                print('Registro');
                Navigator.pushNamed(context, Flurorouter.registerRoute);
              },
            )
          ])),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(20)),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.white),
      labelStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: Colors.white),
      focusColor: Colors.white,
      hoverColor: Colors.red,
      fillColor: Colors.black,
    );
  }
}
