import 'package:flutter/material.dart';

Widget inputButton(String text, bool ocult,
    {TextEditingController? controler}) {
  return SizedBox(
    width: double.infinity,
    child: TextField(
      controller: controler,
      obscureText: ocult,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        hintStyle: const TextStyle(color: Color(0xFF444851), fontSize: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF444851)),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF444851)),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
  );
}

// class InputCardTest extends StatefulWidget {
//   const InputCardTest({super.key});

//   @override
//   State<InputCardTest> createState() => _InputCardTestState();
// }

// class _InputCardTestState extends State<InputCardTest>{
//   Widget build(BuildContext context) {
//     return inputCard('Nome da IA', data)
//   }

// Widget inputCard(String text, String data,
//     {TextEditingController? controler}) {
//   return SizedBox(
//     height: 57,
//     width: double.infinity,
//     child: TextField(
//           onChanged: (value) {
//             setState(() {
//               data = controler!.text.toString();
//             });
//           },
//           controller: controler,
//           decoration: InputDecoration(
//             labelText: 'text',
//             labelStyle: const TextStyle(color: Colors.grey),
//             hintStyle: const TextStyle(
//                 color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30.0),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(
//                   color: Color.fromARGB(255, 0, 0, 0), width: 2),
//               borderRadius: BorderRadius.circular(30.0),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: const BorderSide(
//                   color: Color.fromARGB(255, 0, 0, 0), width: 2),
//               borderRadius: BorderRadius.circular(30.0),
//             ),
//           ),
//         ),
//   );
// }
// }

Widget iconAndText(String icon, String text) {
  return SizedBox(
    height: 57,
    width: double.infinity,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        side: const BorderSide(
          color: Color(0xFF444851),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      icon: Image.asset(icon, height: 30),
      label: Text(text,
          style: const TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))),
      onPressed: () {},
    ),
  );
}

Widget textButton(String text) {
  return TextButton(
    onPressed: () {},
    child: Text(text,
        style: const TextStyle(color: Color(0xFF007BFF), fontSize: 14)),
  );
}

Widget actionButton(String text, String destination, BuildContext context) {
  return SizedBox(
    height: 57,
    width: double.infinity,
    child: FilledButton(
      style: FilledButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 76, 175, 79),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text(text, style: const TextStyle(fontSize: 20)),
      onPressed: () {
        Navigator.pushNamed(context, destination);
      },
    ),
  );
}

Widget preButton(String text, String destination, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(right: 8, left: 8),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
    height: 48,
    width: double.infinity,
    padding: EdgeInsets.only(left: 13, right: 13),
    child: FilledButton(
      style: FilledButton.styleFrom(
        elevation: 10,
        shadowColor: Colors.black,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 31, 73, 225),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 20)),
      onPressed: () {
        Navigator.pushNamed(context, destination);
      },
    ),
  );
}
