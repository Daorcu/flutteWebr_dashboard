import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_1/providers/user_form_provider.dart';
import 'package:dashboard_1/providers/users_provider.dart';

import 'package:dashboard_1/services/navigation_service.dart';
import 'package:dashboard_1/services/notifications_service.dart';

import 'package:email_validator/email_validator.dart';
import 'package:dashboard_1/models/usuario.dart';

import 'package:dashboard_1/ui/cards/white_card.dart';
import 'package:dashboard_1/ui/inputs/custom_inputs.dart';
import 'package:dashboard_1/ui/labels/custom_labels.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);
    usersProvider.getUserById(widget.uid).then((userDB) {
      if (userDB != null) {
        userFormProvider.user = userDB;
        userFormProvider.formKey = new GlobalKey<FormState>();
        setState(() {
          this.user = userDB;
        });
      } else {
        NavigationService.replaceTo('/dashboard/users');
      }
    });
  }

  @override
  void dispose() {
    this.user = null;
    Provider.of<UserFormProvider>(context, listen: false).user = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('UserView', style: CustomLabels.h1),
          SizedBox(height: 10),
          if (user == null)
            WhiteCard(
                child: Container(
              alignment: Alignment.center,
              height: 400,
              child: CircularProgressIndicator(),
            )),
          _UserViewBody()
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: {0: FixedColumnWidth(250)},
        children: [
          TableRow(children: [
            // Avatar
            _AvatarContainer(),
            // Formulario de actualización
            _UserViewForm(),
          ])
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
        title: 'Información general',
        child: Form(
            key: userFormProvider.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  initialValue: user.nombre,
                  decoration: CustomInputs.formInputDecoration(
                    hint: 'Nombre del usuario',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_outlined,
                  ),
                  onChanged: (value) =>
                      userFormProvider.copyUserWith(nombre: value),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Ingrese un nombre';
                    if (value.length < 2) return 'Ingrese un nombre válido';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  initialValue: user.correo,
                  decoration: CustomInputs.formInputDecoration(
                    hint: 'Correo del usuario',
                    label: 'Correo',
                    icon: Icons.mark_email_read_outlined,
                  ),
                  onChanged: (value) =>
                      userFormProvider.copyUserWith(correo: value),
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? ''))
                      return 'Email no válido';
                  },
                ),
                SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 100),
                  child: ElevatedButton(
                      onPressed: () async {
                        final saved = await userFormProvider.updateUser();
                        if (saved) {
                          NotificationsService.showSnackbar(
                              'Usuario actualizado');
                          Provider.of<UsersProvider>(context, listen: false)
                              .refreshUser(user);
                        } else {
                          NotificationsService.showSnackbarError(
                              'No se pudo actualizar');
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFF4511E)),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.save_outlined, size: 20),
                          Text(' Guardar')
                        ],
                      )),
                )
              ],
            )));
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    return WhiteCard(
        width: 250,
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Profile', style: CustomLabels.h2),
              SizedBox(height: 20),
              Container(
                width: 150,
                height: 160,
                child: Stack(
                  children: [
                    ClipOval(child: Image(image: AssetImage('no-image.jpg'))),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.white, width: 5),
                        ),
                        child: FloatingActionButton(
                          backgroundColor: Color(0xFFF4511E),
                          elevation: 0,
                          child: Icon(Icons.camera_alt_outlined, size: 20),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                user.nombre,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
