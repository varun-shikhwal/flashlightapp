import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';
class Flashlight extends StatefulWidget {
  const Flashlight({super.key});

  @override
  State<Flashlight> createState() => _FlashlightState();
}

class _FlashlightState extends State<Flashlight> {
  final bgcolor=const Color(0xff2f393a);
  final textcolor=const Color(0xffE7F6F2);
  var isActive=false;
  var controller=TorchController();
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,centerTitle: true,
       title: Padding(
         padding: const EdgeInsets.only(top: 8.0),
         child: Text('FlashLight',style: TextStyle(color: textcolor,fontSize: 30),),
       ),
      ),
      body: Column(
        children: [
          Expanded(child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(isActive?'assets/images/turned_on.png':'assets/images/turned_off.png',
                  width: 250,height: 250,color: isActive?null:textcolor.withOpacity(0.2),
                  ),
                  SizedBox(height: size.height*0.05,),
                  CircleAvatar(
                    minRadius: 30,maxRadius: 45,
                    child: Transform.scale(
                      scale: 1.5,
                      child: IconButton(
                      onPressed: (){
                        controller.toggle();
                        isActive=!isActive;
                        setState(() {

                        });
                      },
                        icon: Icon(Icons.power_settings_new),
                  ),
                    ),)
                ],
              ),
            ),
          )
          ),
          // Text('Torch',style: TextStyle(color: textcolor),),
           SizedBox(height: size.height*0.05,)
        ],
      ),

    );
  }
}