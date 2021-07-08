import 'package:dashboard_1/providers/register_form_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:dashboard_1/router/router.dart';

import 'package:dashboard_1/ui/inputs/custom_inputs.dart';

import 'package:dashboard_1/ui/buttons/link_text.dart';
import 'package:dashboard_1/ui/buttons/custom_outlined_button.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);

          return Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 30),
            color: Colors.deepOrange[600],
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                    key: registerFormProvider.formKey,
                    child: Column(children: [
                      // Nombre
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Ingrese su nombre';
                            return null;
                          },
                          onChanged: (value) =>
                              registerFormProvider.password = value,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: 'Ingrese su nombre',
                            label: 'Nombre',
                            icon: Icons.person_outline_rounded,
                          )),
                      SizedBox(height: 20),

                      // Correo
                      TextFormField(
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ''))
                              return 'Ingrese un correo válido';
                            return null;
                          },
                          onChanged: (value) =>
                              registerFormProvider.email = value,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: 'Ingrese su correo',
                            label: 'Email',
                            icon: Icons.email_outlined,
                          )),
                      SizedBox(height: 20),

                      // Contraseña
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Ingrese su contraseña';
                            if (value.length <= 7)
                              return 'La contrseña debe ser mínimo de 8 caracteres';
                            return null;
                          },
                          onChanged: (value) =>
                              registerFormProvider.password = value,
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
                        text: 'Crear Cuenta',
                        onPressed: () {
                          registerFormProvider.validateForm();
                        },
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
        },
      ),
    );
  }
}
