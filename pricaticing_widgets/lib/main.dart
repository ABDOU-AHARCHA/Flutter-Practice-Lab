import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to the App'),
        centerTitle: true,
        backgroundColor: Colors.green,

      ),


      // Use a Stack to layer widgets on top of each other
      body: Stack(
        fit: StackFit.expand, // Make the children of the Stack fill the screen
        children: <Widget>[
          // 1. The background image (bottom layer)
          Image.asset(
            'assets/images/blue_background.png',
            fit: BoxFit.cover, // Ensure _he image covers the whole screen
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Here is the new text! 2 in the left',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.amberAccent,
                    ),
                  ),
                  SizedBox(height: 10.0), // This adds space
                  Icon(
                    Icons.twenty_one_mp_rounded,
                    size: 160,
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
          ),
          
          



        



          // 2. The content centered on top of the image (top layer)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // App Icon
                  const Icon(
                    Icons.flutter_dash,
                    size: 120,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 24),

                  // Welcome Title with a shadow for better readability
                  const Text(
                    'Welcome to the new app!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(blurRadius: 10.0, color: Colors.black54),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Subtitle Text with a shadow
                  Text(
                    'Let\'s build something amazing together!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.9),
                      shadows: const [
                        Shadow(blurRadius: 8.0, color: Colors.black54),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),

                  ElevatedButton.icon(onPressed: (){
                    print ("Email Button is Clicked");
                  },
                      label: Text("Email"),
                      icon: Icon(Icons.email)),

                  IconButton(onPressed: (){
                    print("Icon Button is Clicked");
                  },
                      icon: Icon(
                          Icons.one_k,
                          color: Colors.deepOrange,
                        size: 80,
                      )
                  ),





                  const SizedBox(height: 16),

                  ElevatedButton(onPressed: (){
                    print("The second Button pressed!");
                  },
                      child: const Text("Press Me")),

                  const SizedBox(height: 16),
                  // Get Started Button
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to the next page (e.g., home or login)
                      print("GET STARTED BUTTON PRESSED!");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue.shade700, // Text color
                      backgroundColor: Colors.white, // Button background color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Welcome to the new world!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.deepOrange,
                        shadows: [
                          Shadow(blurRadius: 2.20, color: Colors.black, offset: Offset(1, 0)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
