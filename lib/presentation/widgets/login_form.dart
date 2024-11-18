import 'package:flutter/material.dart';
import '../screens/landing_page_screen.dart'; // Asegúrate de importar la LandingPageScreen

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  // Controladores de los TextFormField
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Estado de visibilidad de la contraseña
  bool _passwordVisible = false;

  // Función de validación de credenciales
  bool _validateCredentials(String username, String password) {
    // Aquí puedes agregar tu lógica de autenticación (API, Firebase, etc.)
    // Por ahora, usaremos credenciales estáticas.
    return username == "admin" &&
        password == "1234"; // Usuario y contraseña de ejemplo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8), // Color de fondo
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen de la aplicación
                Container(
                  width: 220.0,
                  height: 220.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    '../../assets/images/IconoFIP.png', // Asegúrate de tener esta imagen en tu proyecto
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Inicio de sesión',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 32.0),
                // Formulario de login
                Material(
                  color: Colors.transparent,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          // Campo de texto para el usuario
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Usuario',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          // Campo de texto para la contraseña
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 32.0),
                          // Botón de iniciar sesión
                          ElevatedButton(
                            onPressed: () {
                              // Obtener los valores de los campos
                              String username = _usernameController.text;
                              String password = _passwordController.text;

                              // Validar las credenciales
                              if (_validateCredentials(username, password)) {
                                // Si las credenciales son correctas, navegar a la pantalla de inicio
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const LandingPageScreen(),
                                  ),
                                );
                              } else {
                                // Mostrar un mensaje de error si las credenciales son incorrectas
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Credenciales incorrectas')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 155, 14, 14),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            child: const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
