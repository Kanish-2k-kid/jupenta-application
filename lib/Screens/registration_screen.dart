// import 'package:trackmykid2/model/routes.dart';
// import 'package:trackmykid2/model/user_model.dart';
// import 'package:trackmykid2/screens/welcome_screen.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/material.dart';
//
// import 'package:lottie/lottie.dart';
// import 'home_screen.dart';
// import 'login_screen.dart';
//
// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({Key? key}) : super(key: key);
//
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   // string for displaying the error Message
//   String? errorMessage;
//
//   bool _obscureText = true;
//   bool __obscureText = true;
//
//   var _fullname = '';
//   var _email = '';
//
//   // our form key
//   final _formKey = GlobalKey<FormState>();
//
//   // editing Controller
//   final fullnameEditingController = TextEditingController();
//   final emailEditingController = TextEditingController();
//   final passwordEditingController = TextEditingController();
//   final confirmPasswordEditingController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     // Full name field
//     final fullnameField = TextFormField(
//       autofocus: false,
//       controller: fullnameEditingController,
//       keyboardType: TextInputType.name,
//       validator: (value) {
//         RegExp regex = RegExp(r'^.{3,}$');
//         if (value!.isEmpty) {
//           return "Full Name cannot be Empty";
//         }
//         if (!regex.hasMatch(value)) {
//           return "Enter Valid name(Min. 3 Character)";
//         }
//         return null;
//       },
//       onSaved: (value) {
//         fullnameEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.account_circle),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Full Name",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//
//     // Email field
//     final emailField = TextFormField(
//       autofocus: false,
//       controller: emailEditingController,
//       keyboardType: TextInputType.emailAddress,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return "Please Enter Your Email";
//         }
//         if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\\.[a-z]").hasMatch(value)) {
//           return "Please Enter a valid email";
//         }
//         return null;
//       },
//       onSaved: (value) {
//         emailEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.mail),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Email",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//
//     // Password field
//     final passwordField = TextFormField(
//       autofocus: false,
//       controller: passwordEditingController,
//       obscureText: _obscureText,
//       validator: (value) {
//         RegExp regex = RegExp(r'^.{6,}$');
//         if (value!.isEmpty) {
//           return "Password is required";
//         }
//         if (!regex.hasMatch(value)) {
//           return "Enter Valid Password(Min. 6 Character)";
//         }
//         return null;
//       },
//       onSaved: (value) {
//         passwordEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.vpn_key),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Password",
//         suffixIcon: GestureDetector(
//           onTap: () {
//             setState(() {
//               _obscureText = !_obscureText;
//             });
//           },
//           child: Icon(
//             _obscureText ? Icons.visibility : Icons.visibility_off,
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//
//     // Confirm password field
//     final confirmPasswordField = TextFormField(
//       autofocus: false,
//       controller: confirmPasswordEditingController,
//       obscureText: __obscureText,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return "Password is required";
//         }
//         if (confirmPasswordEditingController.text !=
//             passwordEditingController.text) {
//           return "Passwords don't match";
//         }
//         return null;
//       },
//       onSaved: (value) {
//         confirmPasswordEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.done,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.vpn_key),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Confirm Password",
//         suffixIcon: GestureDetector(
//           onTap: () {
//             setState(() {
//               __obscureText = !__obscureText;
//             });
//           },
//           child: Icon(
//             __obscureText ? Icons.visibility : Icons.visibility_off,
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//
//     // Signup button
//     final signUpButton = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(10),
//       color: Colors.deepPurple,
//       child: MaterialButton(
//         padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         minWidth: MediaQuery.of(context).size.width,
//         onPressed: () {
//           // Handle signup logic here
//           _handleSignUp();
//         },
//         child: Text(
//           "Sign Up",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//             size: 30,
//           ),
//           onPressed: () {
//             Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => welcomeScreen()));
//           },
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(36),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Lottie.asset(
//                       'assets/images/sign-up.json',
//                       width: 140,
//                       height: 140,
//                     ),
//                     SizedBox(height: 15),
//                     Text(
//                       'Registration',
//
//                     ),
//                     SizedBox(height: 45),
//                     fullnameField,
//                     SizedBox(height: 20),
//                     emailField,
//                     SizedBox(height: 20),
//                     passwordField,
//                     SizedBox(height: 20),
//                     confirmPasswordField,
//                     SizedBox(height: 20),
//                     signUpButton,
//                     SizedBox(height: 15),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text("Already registered? "),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => LoginScreen()));
//                           },
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                                 color: Colors.deepPurple,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _handleSignUp() {
//     if (_formKey.currentState!.validate()) {
//       // Handle sign up logic here, such as sending data to your backend
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Sign Up Successful"),
//           backgroundColor: Colors.green,
//         ),
//       );
//     }
//   }
// }
