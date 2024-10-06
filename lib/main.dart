import 'dart:ffi';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http; // Importa la librería http para solicitudes
import 'dart:convert'; // Para manejar la conversión de datos JSON

class OnboardingPageModel {
  final String title;
  final String description;
  //final IconData icon;

  OnboardingPageModel({
    required this.title,
    required this.description,
    //required this.icon,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingPageModel pageModel;

  OnboardingPage({required this.pageModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Image.asset(pageModel.image),
        SizedBox(height: 20),
        Text(
          pageModel.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          pageModel.description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPageModel> _pages = [
    OnboardingPageModel(
      title:'Welcome!',
      description: 'This App will help you to improve your mental health.',
      //icon: Icons.person,
    ),
    OnboardingPageModel(
      title: 'Features',
      description: 'You will improve your mental health through breathing exercises',
      //icon: Icons.home,
    ),
    OnboardingPageModel(
      title: 'Enjoy',
      description: 'Explore TerraSphere and have fun!',
      //icon: Icons.gamepad,
    ),
  ];

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0XFFF5F6DD),
    body: PageView.builder(
      controller: _pageController,
      itemCount: _pages.length,
      onPageChanged: (int page) {
        setState(() {
          _currentPage = page;
        });
      },
      itemBuilder: (context, index) {
        return OnboardingPage(pageModel: _pages[index]);
      },
    ),
    bottomSheet: _currentPage == _pages.length - 1
        ? Container(
            height: 300, // Ajusta la altura del contenedor
            alignment: Alignment.center, // Centra el contenido dentro del contenedor
            color: const Color(0XFFF5F6DD),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Espacio dentro del contenedor
            child: TextButton(
              onPressed: () {
                // Navigate to home screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'TerraSphere')),
                );
              },
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0XFFF5F6DD),
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF545948), // Color de fondo del botón
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0), // Espacio dentro del botón
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // Bordes redondeados
                ),
              ),
            ),
          )
        : Container( // Agrega un contenedor para envolver la Row
            height: 80, // Ajusta la altura del contenedor según lo necesites
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding opcional para el contenedor
            color: const Color(0xFF929b7c), // Cambia el color de fondo si lo necesitas
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  
                  onPressed: () {
                    _pageController.jumpToPage(_pages.length - 1);
                  },
                  child: Text('Skip',
                  style: TextStyle(
                    fontSize:25,
                    color: Color(0XFFF5F6DD),
                    ),
                  ),
                  
                ),
                Row(
                  children: List.generate(
                    _pages.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 15,
                      height: 20,
                      decoration: BoxDecoration( 
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? const Color(0xFF545948)
                            : const Color(0xFFdee1d4),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text('Next',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0XFFF5F6DD),
                  ),
                ),
                ),
              ],
            
          ),
  ));
}
}

class EmotionStorage{
  // Crear una instancia estática (Singleton) de la clase
  static final EmotionStorage _instance = EmotionStorage._internal();

  // Variables para almacenar los contadores
  int agradableCount = 0;
  int desagradableCount = 0;
  int energiaAltaCount = 0;
  int energiaBajaCount = 0;

  // Constructor interno para inicializar la clase
  EmotionStorage._internal();

  // Método para acceder a la única instancia de la clase
  factory EmotionStorage() {
    return _instance;
  }

  // Método para actualizar los contadores
  void updateCounters({
    required int agradableCount,
    required int desagradableCount,
    required int energiaAltaCount,
    required int energiaBajaCount,
  }) {
    this.agradableCount = agradableCount;
    this.desagradableCount = desagradableCount;
    this.energiaAltaCount = energiaAltaCount;
    this.energiaBajaCount = energiaBajaCount;
  }
}

class EmotionStorageFinal{
  // Crear una instancia estática (Singleton) de la clase
  static final EmotionStorageFinal _instance = EmotionStorageFinal._internal();

  // Variables para almacenar los contadores
  int agradableCountFinal = 0;
  int desagradableCountFinal = 0;
  int energiaAltaCountFinal = 0;
  int energiaBajaCountFinal = 0;

  // Constructor interno para inicializar la clase
  EmotionStorageFinal._internal();

  // Método para acceder a la única instancia de la clase
  factory EmotionStorageFinal() {
    return _instance;
  }

  // Método para actualizar los contadores
  void updateCounters({
    required int agradableCountFinal,
    required int desagradableCountFinal,
    required int energiaAltaCountFinal,
    required int energiaBajaCountFinal,
  }) {
    this.agradableCountFinal = agradableCountFinal;
    this.desagradableCountFinal = desagradableCountFinal;
    this.energiaAltaCountFinal = energiaAltaCountFinal;
    this.energiaBajaCountFinal = energiaBajaCountFinal;
  }
}

class EmotionSummary {
  static final EmotionSummary _instance = EmotionSummary._internal();
  // Contadores de emociones experimentadas
  int euforico = 0, irritable = 0, relajado = 0, triste = 0;

  EmotionSummary._internal();

  factory EmotionSummary() {
    return _instance;
  }

  // Método para sumar los valores de EmotionStorage y EmotionStorageFinal


  // Método para actualizar los contadores emocionales basados en los valores recogidos
  
}


class preguntas_Iniciales extends StatefulWidget {
  @override
  _preguntas_InicialesState createState() => _preguntas_InicialesState();
}

class _preguntas_InicialesState extends State<preguntas_Iniciales> {
  // Variables de estado para contar cada categoría
  int agradableCount = 0; 
  int desagradableCount = 0; 
  int energiaAltaCount = 0; 
  int energiaBajaCount = 0; 

  void _updateStorage() {
    // Actualiza los contadores en el singleton EmotionStorage
    EmotionStorage().updateCounters(
      agradableCount: agradableCount,
      desagradableCount: desagradableCount,
      energiaAltaCount: energiaAltaCount,
      energiaBajaCount: energiaBajaCount,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Game',
          style: TextStyle(
            fontSize: 35,
            color: const Color(0xFFf4ebc7),
          ),
        ),
        backgroundColor: const Color(0xFF7d7245),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            iconSize: 36.0,
            onPressed: () {
              // Navega a la página de inicio
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'TerraSphere')),
              );
            },
          ),
        ],
      ),
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0XFFF5F6DD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How would you describe your feelings right now?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: const Color(0xFF7e805a),
                  ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        agradableCount++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFc6dd8f),
                      foregroundColor: const Color(0xFF616b49),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    child: Text('Pleasant'),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        desagradableCount++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFb6d4db),
                      foregroundColor: const Color(0xFF577278),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  child: Text('Unpleasant'),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'How much energy do you have right now?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: const Color(0xFF7e805a),
                  ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        energiaAltaCount++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFe4b2b2),
                      foregroundColor: const Color(0xFF9d5a5a),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    child: Text('High'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        energiaBajaCount++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFd6cca3),
                      foregroundColor: const Color(0xFF7d7245),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    child: Text('Low'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                ElevatedButton(
                  onPressed: () {
                    _updateStorage(); // Asegúrate de actualizar aquí
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => pag_registro()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7e805a),
                    foregroundColor: const Color(0xFFe8ebba),
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  child: Text('Continue'),
                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}


class pag_registro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storage = EmotionStorage();
    final summary = EmotionSummary();
    String emotionMessageAntes = '';
    String rulerAntes = '';

    // Calcular el estado emocional antes de jugar
    if (storage.agradableCount >= 1 && storage.energiaAltaCount >= 1) {
      rulerAntes = 'Euphoric';
      summary.euforico++;
    } else if (storage.agradableCount >= 1 && storage.energiaBajaCount >= 1) {
      rulerAntes = 'Relaxed';
      summary.relajado++;
    } else if (storage.desagradableCount >= 1 && storage.energiaAltaCount >= 1) {
      rulerAntes = 'Exhasperated';
      summary.irritable++;
    } else if (storage.desagradableCount >= 1 && storage.energiaBajaCount >= 1) {
      rulerAntes = 'Sadness';
      summary.triste++;
    }

    emotionMessageAntes = 'Your emotion right now is:  $rulerAntes';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7e805a),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            iconSize: 36.0,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'TerraSphere')),
              );
            },
          ),
        ],
        title: Text('Record'),
        titleTextStyle: TextStyle(
          fontSize: 35,
          color: const Color(0xFFe8ebba),
        ),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0XFFF5F6DD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Record before playing:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: const Color(0xFF7e805a),
                ),
              ),
              SizedBox(height: 10),
              Text(
                emotionMessageAntes,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xFF7e805a),
                ),
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  // Navega a la página de juego
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => instrucciones()),
                  );
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color(0xFF64645c),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0XFFafafa8),
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class instrucciones extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7e805a), // Color del AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            iconSize: 36.0,
            onPressed: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage(title: 'TerraSphere')),
              );
            },
          ),
        ],
        title: Text('Instructions'),
        titleTextStyle: TextStyle(
          fontSize: 35,
          color: const Color(0xFFe8ebba),
        ),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0XFFF5F6DD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Instructions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: const Color(0xFF7e805a),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'GET READY!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: const Color(0xFF7e805a),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'You will play as a little bird, and you will have to fly over some obstacles by touching the screen. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF7e805a),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Hold the screen to make the bird fly up, and release it to make it come down',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF7e805a),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Also, it is crucial for you to breathe in while you are holding the screen, and to breathe out when you release it',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF7e805a),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Take around 8 seconds to breathe in, and 8 second to breathe out!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFFbbbda1),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => juego_provicional()),
                  );
                },
                style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFc6dd8f),
                      foregroundColor: const Color(0xFF616b49),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                child: Text('START GAME'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class juego_provicional extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7e805a), // Color del AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            iconSize: 36.0,
            onPressed: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage(title: 'TerraSphere')),
              );
            },
          ),
        ],
        title: Text('Game'),
        titleTextStyle: TextStyle(
          fontSize: 35,
          color: const Color(0xFFe8ebba),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => preguntas_Final()), //hay que cambiarlo después
            );
          },
          child: Text('Continue'),
        ),
        
      ),
    );
  }
}

class preguntas_Final extends StatefulWidget {
  @override
  _preguntas_FinalState createState() => _preguntas_FinalState();
}

class _preguntas_FinalState extends State<preguntas_Final> {
  int agradableCountFinal = 0; 
  int desagradableCountFinal = 0; 
  int energiaAltaCountFinal = 0; 
  int energiaBajaCountFinal = 0; 

  void _updateStorageFinal() {
    // Actualiza los contadores en el singleton EmotionStorageFinal
    EmotionStorageFinal().updateCounters(
      agradableCountFinal: agradableCountFinal,
      desagradableCountFinal: desagradableCountFinal,
      energiaAltaCountFinal: energiaAltaCountFinal,
      energiaBajaCountFinal: energiaBajaCountFinal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7e805a),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            iconSize: 36.0,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'TerraSphere')),
              );
            },
          ),
        ],
        title: Text('Record'),
        titleTextStyle: TextStyle(
          fontSize: 35,
          color: const Color(0xFFe8ebba),
        ),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0XFFf5f6dd),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How do you feel after playing?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: const Color(0xFF7e805a),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        agradableCountFinal++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFc6dd8f),
                      foregroundColor: const Color(0xFF616b49),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    child: Text('Pleasant'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        desagradableCountFinal++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFb6d4db),
                      foregroundColor: const Color(0xFF577278),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    child: Text('Unpleasant'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'How much energy do you have after playing?',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 40,
                color: const Color(0xFF7e805a),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        energiaAltaCountFinal++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFe4b2b2),
                      foregroundColor: const Color(0xFF9d5a5a),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    child: Text('High'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        energiaBajaCountFinal++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFd6cca3),
                      foregroundColor: const Color(0xFF7d7245),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    child: Text('Low'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _updateStorageFinal(); // Asegúrate de actualizar aquí
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => pag_registro_Final()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7e805a),
                    foregroundColor: const Color(0xFFe8ebba),
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                    child: Text('Continue'),
                  ),
                ],
              ),
            ],
          ),
        ),
    ));
  }
}

class pag_registro_Final extends StatefulWidget {
  @override
  _pag_registro_FinalState createState() => _pag_registro_FinalState();
}

class _pag_registro_FinalState extends State<pag_registro_Final> {
  String rulerDespues = '';
  String emotionMessageDespues = '';

  @override
  void initState() {
    super.initState();
    _calculateEmotion();
  }

  void _calculateEmotion() {
    final storageFinal = EmotionStorageFinal();
    final summary = EmotionSummary();

    // Calcular el estado emocional después de jugar
    if (storageFinal.agradableCountFinal >= 1 && storageFinal.energiaAltaCountFinal >= 1) {
      rulerDespues = 'Euphoric';
      summary.euforico++;
    } else if (storageFinal.agradableCountFinal >= 1 && storageFinal.energiaBajaCountFinal >= 1) {
      rulerDespues = 'Relaxed';
      summary.relajado++;
    } else if (storageFinal.desagradableCountFinal >= 1 && storageFinal.energiaAltaCountFinal >= 1) {
      rulerDespues = 'Exhasperated';
      summary.irritable++;
    } else if (storageFinal.desagradableCountFinal >= 1 && storageFinal.energiaBajaCountFinal >= 1) {
      rulerDespues = 'Sadness';
      summary.triste++;
    }

    // Asignar el mensaje para mostrar en pantalla
    setState(() {
      emotionMessageDespues = 'Your emotion right now is: $rulerDespues';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7e805a),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            iconSize: 36.0,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'TerraSphere')),
              );
            },
          ),
        ],
        title: Text('Record'),
        titleTextStyle: TextStyle(
          fontSize: 35,
          color: const Color(0xFFe8ebba),
        ),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0XFFF5F6DD),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Record after the game',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                color: const Color(0xFF7e805a),
              ),  
            ),
            SizedBox(height: 10),
            Text(
              emotionMessageDespues,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: const Color(0xFF7e805a),
              ),
            ),
            SizedBox(height: 30), // Muestra el mensaje de emoción
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DiarioPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFafafa8),
                foregroundColor: const Color(0xFF64645c),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
              child: Text('Journal'),
            ),
          ],
        )
        ),
      ),
    );
  }
}



class DiarioPage extends StatefulWidget {
  @override
  _DiarioPageState createState() => _DiarioPageState();
}

class _DiarioPageState extends State<DiarioPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  List<DiaryEntry> _entries = [];

  void _addNewEntry() {
    if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
      final newEntry = DiaryEntry(
        date: DateTime.now().toString().split('.')[0], // Fecha en formato simple
        title: _titleController.text,
        content: _contentController.text,
      );

      setState(() {
        _entries.add(newEntry); // Agrega la entrada a la lista en memoria
      });

      // Limpiar los controladores después de agregar la entrada
      _titleController.clear();
      _contentController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child:Text(
              'Title and content are required',
            style: TextStyle(
             fontSize: 20,
             color: const Color(0xFFfaaaaa),
            ),
            textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: const Color(0xFF9d5a5a),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          )
      );
    }
  }

  void _viewEntry(DiaryEntry entry) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFf4ebc7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        title: Text(entry.title),
        content: Text(entry.content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFd6cca3), // Color del AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 36.0,
            onPressed: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage(title: 'TerraSphere',)),
              );
            },
          ),
        ],
        title: Text('Journal'),
        titleTextStyle: TextStyle(
          fontSize: 35,
          color: const Color(0xFF7d7245),
        ),
      ),
      body: Container(
        color: const Color(0XFFF5F6DD),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Content',
                  labelStyle: TextStyle(
                    fontSize: 22,
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                expands: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addNewEntry,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFd6cca3),
                foregroundColor: const Color(0xFF7d7245),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
              child: Text('Save Entry'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _entries.length,
                itemBuilder: (context, index) {
                  final entry = _entries[index];
                  return ListTile(
                    title: Text(entry.title),
                    subtitle: Text(entry.date),
                    onTap: () => _viewEntry(entry),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiaryEntry {
  final String date;
  final String title;
  final String content;

  DiaryEntry({required this.date, required this.title, required this.content});
}

//*****************************CHATBOT *****************************************************************************

// Pantalla principal del chat interactivo
class chat_interactivo extends StatefulWidget {
  @override
  _chat_interactivoState createState() => _chat_interactivoState();
}

class _chat_interactivoState extends State<chat_interactivo> {
  final TextEditingController _controller = TextEditingController(); // Controlador para el campo de texto
  final List<Map<String, String>> _messages = []; // Lista para almacenar mensajes del usuario y del bot

  // Función para enviar el mensaje y obtener la respuesta del chatbot
  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) return; // No hacer nada si el campo de texto está vacío

    // Agregar el mensaje del usuario a la lista de mensajes
    setState(() {
      _messages.add({'role': 'user', 'content': _controller.text});
    });

    String userInput = _controller.text;
    _controller.clear(); // Limpiar el campo de texto después de enviar

    // Obtener la respuesta del chatbot usando la función de solicitud HTTP
    String botResponse = await _getResponseFromChatGPT(userInput);

    // Agregar la respuesta del bot a la lista de mensajes
    setState(() {
      _messages.add({'role': 'bot', 'content': botResponse});
    });
  }

  // Función para conectarse con ChatGPT y obtener la respuesta
  Future<String> _getResponseFromChatGPT(String userInput) async {
    final apiKey = 'OUR API'; // Reemplaza con tu clave API de OpenAI

    try {
      // Realizar la solicitud HTTP POST a la API de OpenAI
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo', // Modelo a utilizar
          'messages': [
            {'role': 'system', 'content': 'Eres un asistente de primeros auxilios psicologicos y de acompanamiento para astronautas que se encuentran en misiones espaciales en entornos de aislamiento extremo. Tu objetivo es proporcionar compania constante, tranquilidad y empatia en situaciones de soledad y estres. Debes escuchar activamente a personas que estan pasando por momentos dificiles, responder de manera comprensiva y validar las emociones del usuario.  sugieres tecnicas de respiracion y animas a buscar ayuda profesional si es necesario. Eres un amigo, un confidente y un apoyo en momentos difIciles. Mantienes una conversaciOn calida y tranquilizadora, adaptando tus respuestas para crear una sensacion de conexion y bienestar emocional. No realizas diagnosticos medicos o psicologicos, pero puedes sugerir tecnicas de bienestar como ejercicios de respiracion, mindfulness, o recordar experiencias positivas para ayudar al usuario a sentirse mas conectado y relajado. Omite signos de puntuacion'}, // Mensaje de configuración inicial del chatbot
            {'role': 'user', 'content': userInput}
          ],
          
        }),
      );

      // Manejar la respuesta
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body); // Convertir la respuesta en formato JSON
        return data['choices'][0]['message']['content'] ?? 'No se pudo obtener respuesta';
      } else {
        print('Error: ${response.statusCode}');
        print('Respuesta: ${response.body}');
        return 'Error en la comunicación con la API: ${response.statusCode}\n${response.body}';
      }
    } catch (e) {
      print('Excepción: $e');
      return 'Ocurrió un error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Interactive Chat',
          style: TextStyle(
            fontSize: 35,
            color: const Color(0xFFf4ebc7),
          ),
        ),
        backgroundColor: const Color(0xFFafa370), // Color del AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            iconSize: 36.0,
            onPressed: () {
              // Navegar a MyHomePage (Asegúrate de tener la clase MyHomePage definida en otra parte de tu proyecto)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'TerraSphere')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Muestra la lista de mensajes en un ListView
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Align(
                    alignment: message['role'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: message['role'] == 'user' ? Colors.blue[100] : Colors.green[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        message['content']!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Campo de texto para ingresar el mensaje del usuario
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
                // Botón de envío
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage, // Llama a la función _sendMessage cuando se presiona
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class historial extends StatelessWidget{
  final summary = EmotionSummary();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(
            fontSize: 35,
            color: const Color(0xFFf4ebc7),
          ),
        ),
        backgroundColor: const Color(0xFFafa370), // Color del AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            iconSize: 36.0,
            onPressed: () {
              // Navegar a MyHomePage (Asegúrate de tener la clase MyHomePage definida en otra parte de tu proyecto)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'TerraSphere')),
              );
            },
          ),
        ],
      ),
      body: Center(
        
        child: Container(
          
          color: const Color(0xFFf5f6dd),
          padding: EdgeInsets.all(20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente el contenido del Column
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Emotional Status',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 30,
                color: Color(0xFF7e805a),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               
                children: [
                  ElevatedButton(
                    onPressed: () { 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFfaaaaa), // Color de fondo del botón en hexadecimal (rojo)
                      foregroundColor: Color(0xFFF9d5a5a),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      textStyle: TextStyle(
                        fontSize: 22,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), 
                      ),
                    ),
                    child: Column(
                       //mainAxisSize: MainAxisSize.min,
                       children: [
                        Text(
                          'Exasperated',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          summary.irritable.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                       ],
                       
                    ), //
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () { 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFe6ce6b), // Color de fondo del botón en hexadecimal (rojo)
                      foregroundColor: Color(0xFFF7d7245),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                      textStyle: TextStyle(
                        fontSize: 22,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), 
                      ), // Color del texto del botón en hexadecimal (blanco)
                    ),
                    child: Column(
                       //mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Euphoric',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          summary.euforico.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                       ],
                    ), //
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () { 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFb6d4db), // Color de fondo del botón en hexadecimal (rojo)
                      foregroundColor: Color(0xFFF577278),
                      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
                      textStyle: TextStyle(
                        fontSize: 22
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), 
                      ), // Color del texto del botón en hexadecimal (blanco)
                    ),
                    child: Column(
                       //mainAxisSize: MainAxisSize.min,
                       children: [
                        Text(
                          'Sad',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          summary.triste.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                       ],
                       
                    ), //
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () { 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFc6dd8f), // Color de fondo del botón en hexadecimal (rojo)
                      foregroundColor: Color(0xFFF616b49),
                      padding: EdgeInsets.symmetric(horizontal: 42, vertical: 40),
                      textStyle: TextStyle(
                        fontSize: 22,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), 
                      ), // Color del texto del botón en hexadecimal (blanco)
                    ),
                    child: Column(
                       //mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Relaxed',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          summary.relajado.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                       ],
                    ), //
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

//*****************************CHATBOT *****************************************************

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TerraSphere',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: OnboardingScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 35, 
            color: const Color(0xFFcfcfcf)
          ),
        ),
        backgroundColor: const Color(0xFF636453),
      ),
      body: Center(
        child: Container(
          height: double.infinity, // Ajusta la altura del contenedor
          width: double.infinity,
          color: const Color(0XFFF5F6DD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton( // BOTÓN PARA EL JUEGO
                onPressed: () {
                  // Navigate to onboarding screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => preguntas_Iniciales()),
                  );
                },
                child: Text(
                  'Game',
                  style: TextStyle(
                    fontSize: 40,
                    color: const Color(0xFF7d7245),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0XFFFd6cca3),
                  padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espacio entre los botones
              TextButton( //Botón para registro
                onPressed: () {
                  // Navigate to onboarding screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => historial()),
                  );
                },
                child: Text(
                  'History',
                  style: TextStyle(
                    fontSize: 40,
                    color: const Color(0xFFe8ebba),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF7e805a),
                  padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),),
              SizedBox(height: 20), // Espacio entre los botones
              TextButton( //Botón para registro
                onPressed: () {
                  // Navigate to onboarding screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => chat_interactivo()),
                  );
                },
                child: Text(
                  'ChatBot',
                  style: TextStyle(
                    fontSize: 40,
                    color: const Color(0xFF636453),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFbbbda1),
                  padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),),
                SizedBox(height: 20), // Espacio entre los botones
              TextButton( //Botón para registro
                onPressed: () {
                  // Navigate to onboarding screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DiarioPage()),
                  );
                },
                child: Text(
                  'Journal',
                  style: TextStyle(
                    fontSize: 40,
                    color: const Color(0xFF64645c),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFafafa8),
                  padding: EdgeInsets.symmetric(horizontal: 85.0, vertical: 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),)
            ],
          ),
          
        ),
      ),
    );
  }
}