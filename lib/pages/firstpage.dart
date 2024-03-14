import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_way/pages/homepage.dart';
import 'package:wise_way/services/userservice.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool _showPassword=false;
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  void userlogin()async
  {
    final response=await UserApiService().SendUserLogin(email.text, password.text);
    if(response["status"]=="success")
    {
      String userId=response["userdata"]["_id"].toString();
      print("Successfully Logged In");
      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.setString("userId", userId);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));


    }
    else if(response["status"]=="Incorrect email id")
    {
      print("User do not have an account");
    }
    else
    {
      print("Incorrect credentials");
    }
    print(response);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent.withOpacity(0.80),
              Colors.blueAccent.withOpacity(0.7),
              Colors.blueAccent.withOpacity(0.6)
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 90,),
                Image.asset("assets/wisewaylogo.png"),
                Text(
                  "Explore the world effortlessly with WiseWay",
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
                Text("Start planning your next adventure today!",style: TextStyle(color: Colors.black.withOpacity(0.6))),
                SizedBox(height: 30,),
                TextField(
                  controller: email,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    labelText: "E-mail",
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                    hintText: "example@gmail.com",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.30)),
                    suffixIcon: Icon(Icons.alternate_email, color: Colors.black.withOpacity(0.50),),
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: password,
                  obscureText: !_showPassword,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.30)),
                    suffixIcon: GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          _showPassword=!_showPassword;
                        });
                      },
                      child: Icon(_showPassword ? Icons.visibility : Icons.visibility_off, color: Colors.black.withOpacity(0.50)),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(width: 20,),
                SizedBox(
                  // height: 50,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent.withOpacity(0.99),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: userlogin,
                    child: Text("Login"),
                  ),
                ),
                SizedBox(height: 20,),
                Divider(color: Colors.grey,
                thickness: 2,),
                SizedBox(height: 15,),
                Text("Unlock Adventure with Ease",style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 20),),
                SizedBox(height: 25,),
                Row(
                  children: [
                    SizedBox(width: 83,),
                    Text("New user? ",style: TextStyle(color: Colors.black.withOpacity(0.40),fontSize: 18),),
                    TextButton(onPressed: ()
                        {
                        }, child: Text("Sign Up",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 22),))
                  ],
                ),
                SizedBox(height: 100,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
