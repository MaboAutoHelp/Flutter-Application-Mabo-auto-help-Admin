/*import 'package:app_admin/controller/Authcontroller.dart';
import 'package:app_admin/view/Home.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();

  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  Authcontroller authcontroller = Authcontroller();

  Login() async {
    var formData = fromstate.currentState;

    if (formData!.validate()) {
      var data = await authcontroller.LoginAuth(email.text, pwd.text);
      if (data["message"] == "User doesn't exists!" ||
          data["message"] == "email or password is not correct") {
        print("User doesn't exists! or  email or password is not correct");
      } else {
        print(data);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(adminID: data['adminID'])));
      }
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Form(
          key: fromstate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Mabo auto help Admin',
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 244, 59, 3))),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 30, color: Colors.lightBlue),
                    ),
                  ],
                ),
              ),

              ///------------------Email---------------------
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: email,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'username is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "username",
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),

              ///-------------------Pwd--------------------
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: pwd,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "password",
                    prefixIcon: Icon(Icons.password),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),

              ///--------------------------------------
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Login();
                  },
                  child: Text('Login'),
                ),
              ),
              
            ],
          ),
        ),
      ),
    ));
  }
}*/
import 'package:app_admin/controller/Authcontroller.dart';
import 'package:app_admin/view/Home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();

  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  Authcontroller authcontroller = Authcontroller();

  Login() async {
    var formData = fromstate.currentState;

    if (formData!.validate()) {
      var data = await authcontroller.LoginAuth(email.text, pwd.text);
      if (data["message"] == "User doesn't exists!" ||
          data["message"] == "email or password is not correct") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User doesn\'t exist or email/password is incorrect'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(adminID: data['adminID'])),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form is invalid, please correct the fields'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: fromstate,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mabo Auto Help Admin',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003366), // لون أزرق داكن
                    ),
                  ),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  ///------------------Email---------------------
                  TextFormField(
                    controller: email,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Username",
                      prefixIcon: Icon(Icons.email, color: Colors.lightBlue),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  ///-------------------Pwd--------------------
                  TextFormField(
                    controller: pwd,
                    obscureText: true,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.lightBlue),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  ///-------------------Login Button--------------------
                 ElevatedButton(
  onPressed: () {
    Login();
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF003366), // اللون الأزرق الداكن
    padding: EdgeInsets.symmetric(
      horizontal: 50,
      vertical: 15,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: Text(
    'Login',
    style: TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),
  ),
)
,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
