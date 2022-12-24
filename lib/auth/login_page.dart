import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  static const String routeName='/login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation _animation;
  late TextEditingController _emailController= TextEditingController(text: ' ');
  late TextEditingController _passController= TextEditingController(text: ' ');
  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    _animationController=
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation= CurvedAnimation(parent: _animationController, curve:Curves.linear)
      ..addListener(() {
      setState(() {

      });
    })..addStatusListener((animationStatus) {
      if(animationStatus==AnimationStatus.completed){
        _animationController.reset();
        _animationController.forward();
      }
      });
    _animationController.forward();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            //imageUrl: "https://cdn.pixabay.com/photo/2017/08/02/00/23/architecture-2569012_960_720.jpg",
            //imageUrl: "https://cdn.pixabay.com/photo/2015/08/13/18/56/bus-887362_960_720.jpg",
            imageUrl: "https://cdn.pixabay.com/photo/2017/08/06/14/12/long-exposure-2592861_960_720.jpg",
            placeholder: (context, url) => Image.asset('assets/images/b.jpg',
              fit: BoxFit.fill,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment:FractionalOffset(_animation.value,0) ,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16),
            child: ListView(
              children: [
                SizedBox(height: size.height*0.1),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children:[
                      TextSpan(
                        text: 'Don\'t have an account       ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16
                        )
                      ),
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                          fontSize: 16
                        )
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty || !value.contains('@')){
                      return 'Take a valid email';
                    }else{
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  obscureText: true,
                  validator: (value){
                    if(value!.isEmpty || value.length<7){
                      return 'Enter valid password';
                    }else{
                      return null;
                    }
                  },
                  controller: _passController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility, color: Colors.white,),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
