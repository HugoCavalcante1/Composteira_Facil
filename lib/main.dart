import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'buttons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const Home(),
        '/next': (context) => CompostCalculatorScreen() // Rota inicial
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Image.asset(
              'assets/logo.png',
            ),
            const Gap(83),
            inputButton('Email', false),
            const Gap(24),
            inputButton('Senha', true),
            const Gap(24),
            iconAndText('assets/google_icon.png', 'Continuar com Google'),
            const Gap(24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: textButton('Esqueci minha senha')),
                Align(
                    alignment: Alignment.centerLeft,
                    child: textButton('Não tenho cadastro')),
              ],
            ),
            const Spacer(),
            actionButton("Login", '/home', context)
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/home.jpg',
            )),
            Gap(24),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/next');
              },
              shape: CircleBorder(),
              backgroundColor: Color.fromARGB(255, 76, 175, 79),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
            Gap(16),
            SizedBox(
              width: 130,
              child: Text('Crie sua primeira composteira',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF474747))),
            )
          ],
        ),
      ),
    );
  }
}

class CompostCalculatorScreen extends StatefulWidget {
  @override
  _CompostCalculatorScreenState createState() =>
      _CompostCalculatorScreenState();
}

class _CompostCalculatorScreenState extends State<CompostCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _diasController = TextEditingController();
  final _pesoSecoController = TextEditingController();
  final _pesoUmidoController = TextEditingController();
  final _temperaturaController = TextEditingController();

  double _chorumeGerado = 0.0;

  void _calcularChorume() {
    if (_formKey.currentState!.validate()) {
      final double dias = double.tryParse(_diasController.text) ?? 0.0;
      final double pesoSeco = double.tryParse(_pesoSecoController.text) ?? 0.0;
      final double pesoUmido =
          double.tryParse(_pesoUmidoController.text) ?? 0.0;
      final double temperatura =
          double.tryParse(_temperaturaController.text) ?? 0.0;

      // Debugging: Print valores para verificação
      print('Dias: $dias');
      print('Peso Seco: $pesoSeco');
      print('Peso Úmido: $pesoUmido');
      print('Temperatura: $temperatura');

      // Fatores de ajuste
      final double fEvap = (0.02 * temperatura).clamp(0.0, 1.0);
      final double fTemp = 1 + 0.1 * ((temperatura - 25) / 25);
      final double fDias = 0.05 * dias;

      // Cálculo de chorume gerado
      _chorumeGerado = (pesoUmido - pesoSeco) * (1 - fEvap) * fTemp * fDias;

      // Debugging: Print resultado para verificação
      print('Chorume Gerado: $_chorumeGerado');

      setState(() {});
    } else {
      print('Formulário inválido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compost Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome da composteira'),
              ),
              Gap(16),
              TextFormField(
                controller: _diasController,
                decoration: InputDecoration(labelText: 'Quantidade de dias'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o número de dias';
                  }
                  return null;
                },
              ),
              Gap(16),
              TextFormField(
                controller: _pesoSecoController,
                decoration:
                    InputDecoration(labelText: 'Peso do material seco (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o peso do material seco';
                  }
                  return null;
                },
              ),
              Gap(16),
              TextFormField(
                controller: _pesoUmidoController,
                decoration:
                    InputDecoration(labelText: 'Peso do material úmido (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o peso do material úmido';
                  }
                  return null;
                },
              ),
              Gap(16),
              TextFormField(
                controller: _temperaturaController,
                decoration: InputDecoration(labelText: 'Temperatura (°C)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a temperatura';
                  }
                  return null;
                },
              ),
              Gap(24),
              ElevatedButton(
                onPressed: _calcularChorume,
                child: Text('Criar'),
              ),
              Gap(24),
              Text('Quantidade de chorume gerado (L): $_chorumeGerado'),
            ],
          ),
        ),
      ),
    );
  }
}
