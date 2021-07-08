import 'package:flutter/material.dart';

import 'package:dashboard_1/router/router.dart';
import 'package:dashboard_1/ui/buttons/link_text.dart';
import 'package:dashboard_1/ui/inputs/custom_inputs.dart';
import 'package:dashboard_1/ui/buttons/custom_outlined_button.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80),
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
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese su nombre',
                  label: 'Nombre',
                  icon: Icons.person,
                )),
            SizedBox(height: 20),
            TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.white),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese su correo',
                  label: 'Email',
                  icon: Icons.email_outlined,
                )),
            SizedBox(height: 20),
            TextFormField(
                obscureText: true,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.white),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese su contrseña',
                  label: 'Contraseña',
                  icon: Icons.lock_outline_rounded,
                )),
            SizedBox(height: 20),
            CustomOutlinedButton(
              onPressed: () {},
              text: 'Crear Cuenta',
            ),
            SizedBox(height: 20),
            LinkText(
              text: 'Iniciar Sesión',
              onPressed: () {
                Navigator.pushNamed(context, Flurorouter.loginRoute);
              },
            )
          ])),
        ),
      ),
    );
  }
}
