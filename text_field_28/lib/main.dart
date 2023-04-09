import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _obscured = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  /*
 Baris kode _obscured = !_obscured; berfungsi untuk membalik nilai dari variabel _obscured dari true ke false atau sebaliknya. Ini dilakukan dengan operator not (!), sehingga nilai dari _obscured akan selalu berubah setiap kali fungsi _toggle() dipanggil.
 */
  void _toggle() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Field"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // EMAIL
          TextField(
            controller: emailC,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 30, vertical: 20),
              prefixIcon: const Icon(Icons.email),
              labelText: "Email",
              hintText: "yourname@email.com",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // PASSWORD
          TextField(
            controller: passC,
            autocorrect: false,
            obscureText: _obscured,
            // keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              contentPadding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 30, vertical: 20),
              prefixIcon: const Icon(Icons.lock),
              // password hidden or !hidden
              suffixIcon: InkWell(
                onTap: _toggle,
                child:
                    //   if (_obscured) {
                    //    Icons.visibility_off;
                    // } else {
                    //    Icons.visibility;
                    // }
                    Icon(_obscured ? Icons.visibility_off : Icons.visibility),
              ),
              labelText: "Password",
              hintText: "Enter your password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 50),
          // LOGIN Button
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Login"),
                  // show the value in alert dialog
                  content:
                      Text("Email: ${emailC.text} Password: ${passC.text}"),
                  actions: [
                    ElevatedButton(onPressed: () {}, child: const Text("Ok")),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Cancel")),
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 30, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
            child: const Text("Login"),
          )
        ],
      ),
    );
  }
}
