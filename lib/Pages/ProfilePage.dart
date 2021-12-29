import 'package:flutter/material.dart';
import 'package:gstock/Data/admin_operations.dart';
import 'package:gstock/Models/Admin.dart';
import 'package:gstock/components/ProfileComponents/Header.dart';
import 'package:gstock/components/ProfileComponents/InputWrapper.dart';
import '';
import 'home_page.dart';
class ProfilePage extends StatelessWidget {
  bool isObscurePassword = true;
  AdminOperations adminOperations=new AdminOperations();
  ProfilePage();

  @override
  Widget build(BuildContext context) {
    //final admin= adminOperations.searchAdmin(email);
    //final adminData= Admin.map(admin);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading : IconButton(
          icon: Icon (
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
          },
        ),
        actions:[
          IconButton(onPressed: () {}, icon: Icon(Icons.settings, color: Colors.white))
        ]
      ),
      body: Container(
        padding: EdgeInsets.only(left:15, top:20, right:15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
              children : [
                Center (
                  child: Stack(
                    children : [
                      Container (
                        width: 130,
                        height:130,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4,color:Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:NetworkImage(
                              'https://cdn.pixabay.com/photo/2017/02/25/22/04/user-icon-2098873_960_720.png'
                            )
                          )
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right :0,
                        child: Container(
                          height:40,
                          width:40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            color : Colors.blue,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,

                          ),
                        )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                buildTextField("Full name","demon",false),
                buildTextField("Email","azda", false),
                buildTextField("Password", "zdz", true),
                SizedBox(height:30),
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Text ("cancel",
                      style: TextStyle(
                        fontSize:15,
                        letterSpacing: 2,
                        color: Colors.black
                      )),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),
                    ),
                    ElevatedButton(onPressed: () {},
                        child: Text("SAVE", style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white
                        ),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape : RoundedRectangleBorder(borderRadius:BorderRadius.circular(20))
                      )
                    )
                  ]
                )
              ],

          )
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField){
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration : InputDecoration(
          suffixIcon: isPasswordTextField?
              IconButton (
                icon: Icon(Icons.remove_red_eye, color:Colors.grey),
                onPressed: () {},
              ):null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText:placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey
          )
        )
      ),
    );
  }
}

