import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:email_validator/email_validator.dart';

import 'package:dashboard_1/router/router.dart';

import 'package:dashboard_1/providers/auth_provider.dart';
import 'package:dashboard_1/providers/login_form_provider.dart';

import 'package:dashboard_1/ui/buttons/link_text.dart';
import 'package:dashboard_1/ui/inputs/custom_inputs.dart';
import 'package:dashboard_1/ui/buttons/custom_outlined_button.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);

          return Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 30),
            color: Colors.deepOrange[600],
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                    key: loginFormProvider.formKey,
                    child: Column(children: [
                      // Correo
                      TextFormField(
                          onFieldSubmitted: (_) =>
                              onFormSubmit(loginFormProvider, authProvider),
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ''))
                              return 'Email no válido';
                            return null;
                          },
                          onChanged: (value) => loginFormProvider.email = value,
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
                          onFieldSubmitted: (_) =>
                              onFormSubmit(loginFormProvider, authProvider),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Ingrese su contraseña';
                            if (value.length <= 7)
                              return 'La contrseña debe ser mínimo de 8 caracteres';
                            return null;
                          },
                          onChanged: (value) =>
                              loginFormProvider.password = value,
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
                        text: 'Ingresar',
                        onPressed: () =>
                            onFormSubmit(loginFormProvider, authProvider),
                      ),
                      SizedBox(height: 20),
                      LinkText(
                        text: 'Crear Cuenta',
                        onPressed: () {
                          print('Registro');
                          Navigator.pushReplacementNamed(
                              context, Flurorouter.registerRoute);
                        },
                      )
                    ])),
              ),
            ),
          );
        }));
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid)
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
  }
}
