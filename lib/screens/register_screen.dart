import 'package:bines_app/providers/providers.dart';
import 'package:bines_app/ui/imput_decorations.dart';
import 'package:bines_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 200),
          CardContainer(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Text('Registrar Cuenta',
                    style: Theme.of(context).textTheme.headline4),
                const SizedBox(
                  height: 30,
                ),
                ChangeNotifierProvider(
                    create: (_) => LoginFormaProvider(),
                    child: const _LoginForm()),
              ],
            ),
          ),
          const SizedBox(height: 50),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
            /* style: ButtonStyle(
                  overlayColor:
                    MaterialStateProperty.all(Colors.red.withOpacity(0.1)), 
                backgroundColor: MaterialStateProperty.all(Colors.brown),
                shape: MaterialStateProperty.all(const StadiumBorder())), */
            child: const Text(
              '¿Ya tienes una cuenta?',
              style: TextStyle(
                  //color: Colors.black,
                  color: Color.fromRGBO(41, 60, 118, 10),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormaProvider>(context);
    return Form(
        //TODO Mantener la referencia la KEY para validar los elementos del formulario al presionar el boton
        key: loginForm.formKey,
        //Dispara las validaciones
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            //--------------------
            //Cedula
            //--------------------
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '1234567890',
                  labelText: 'C.I',
                  prefixIcon: Icons.badge_outlined),
              //Tomar os valores de las cajas de Texto
              onChanged: (value) => loginForm.cedula = value,
              //permite realizar validaciones
              validator: (value) {
                if (value != null && value.length != 10) {
                  return 'La cèdula debe de ser de 10 nùmeros ';
                }
                return null;
                /* if (value != null && value.length >= 6) return null; */

                /* String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'EL Valor ingreado no luce como un correo'; */
              },
            ),
            //--------------------
            //Nombres Completos
            //--------------------
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombres Apellidos',
                  labelText: 'Nombres Completos',
                  prefixIcon: Icons.person),
              //Tomar os valores de las cajas de Texto
              onChanged: (value) => loginForm.nombres = value,
              //permite realizar validaciones
              validator: (value) {
                String pattern = r'^[a-zA-Z ]*$';
                RegExp regExp = RegExp(pattern);

                if (value != null && value == '') {
                  return 'Lo Datos Ingresados no corresponden a un nombre';
                }
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Lo Datos Ingresados no corresponden a un nombre';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            //--------------------
            //Email
            //--------------------
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'info@informatica.como',
                  labelText: 'Correo Electrònico',
                  prefixIcon: Icons.alternate_email_sharp),
              //Tomar os valores de las cajas de Texto
              onChanged: (value) => loginForm.email = value,
              //permite realizar validaciones
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'EL Valor ingreado no luce como un correo';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            //--------------------
            //Contraseña
            //--------------------
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*******',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline),
              onChanged: (value) => loginForm.password = value,
              //permite realizar validaciones
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'La contraseña debe de ser de 6 carcteres ';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            //--------------------
            //Boton
            //--------------------
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: const Color.fromRGBO(41, 60, 118, 10),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        //quitar le teclado
                        FocusScope.of(context).unfocus();
                        //TODO Login form
                        if (!loginForm.isValidForm()) return;
                        loginForm.isLoading = true;
                        await Future.delayed(const Duration(seconds: 3));
                        //TODO Validar si el login es corrrecto
                        loginForm.isLoading = false;
                        //Permite acceder a la pantalla siguiente sin que permita regresar a la anaterior
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(context, 'home');
                      },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    //Cambiamos la descripcion en el boton cuando se ingresa
                    loginForm.isLoading ? 'Espere.....' : 'Registrar',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ));
  }
}
