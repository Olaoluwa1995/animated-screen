import 'package:animated_screen/constants/app-colors.dart';
import 'package:animated_screen/constants/app-text-styles.dart';
import 'package:animated_screen/models/color-circles.dart';
import 'package:animated_screen/models/rooms.dart';
import 'package:animated_screen/views/widgets/feature.dart';
import 'package:animated_screen/views/widgets/light-list-container.dart';
import 'package:animated_screen/views/widgets/scene-column.dart';
import 'package:animated_screen/views/widgets/scene.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late Animation _earlyAnimation, _delayedAnimation;
  late AnimationController _animationController;
  double _animatedContainerMargin = 0.04;
  double _containerHeight = 0.7;
  double _gridContainerHeight = 0.64;
  bool showSecondScreen = false;
  final int _animationDuration = 3;
  
  
  
  @override
  void initState() {
   _animationController = AnimationController(duration: Duration(seconds: _animationDuration), vsync: this);
   _earlyAnimation = Tween(begin: 0.0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.0, 0.6, curve: Curves.easeInOut)));
   _delayedAnimation = Tween(begin: 0.0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.4, 1.0, curve: Curves.easeInOut)));

    super.initState();
  }

  void _animate () {
    _animationController.addListener(() {
      if(_delayedAnimation.value.toDouble() > 0.0)
      setState(() {
        showSecondScreen = true;
      });
    });
    setState(() {
      _animatedContainerMargin = 0.08;
      _containerHeight = 0.58;
      _gridContainerHeight = 0.53;
      
    });
    _animationController.forward();
  }

  void _reverse () {
    _animationController.addListener(() {
      if(_earlyAnimation.value.toDouble() > 0.0)
      setState(() {
        showSecondScreen = false;
      });
    });
    setState(() {
       _animatedContainerMargin = 0.04;
       _containerHeight = 0.7;
       _gridContainerHeight = 0.64;
      
    });
    _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final circles = Circles.colorCircles;
    final size = MediaQuery.of(context).size;
    final rooms = Rooms.rooms;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.5,
            width: size.width,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              color: AppColors.PRIMARY_COLOR,
              image: DecorationImage(
                image: AssetImage('assets/circles.svg')
              )
            ),
            child: SvgPicture.asset('assets/circles.svg', 
              color: Colors.white, 
              fit: BoxFit.cover,
              semanticsLabel: 'balcony',
            ),
          ),
          Opacity(
            opacity: _delayedAnimation.value.toDouble(),
            child: Padding(
              padding: EdgeInsets.only(right: size.width * 0.05),
              child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset('assets/light-bulb.svg')),
            ),
          ),
          SafeArea(
            child: Container(
              height: size.height,
              width: size.width,
              padding: EdgeInsets.only(top: size.height * 0.03),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    showSecondScreen == false ? Opacity(
                      opacity: 1.0 - (_earlyAnimation.value.toDouble()),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Control \nPanel', 
                              style: AppTextStyles.heading1,
                            ),
                            SvgPicture.asset('assets/user.svg', 
                              fit: BoxFit.cover,
                              semanticsLabel: 'user',
                            )
                          ]
                        ),
                      ),
                    ) : Opacity(
                      opacity: _delayedAnimation.value.toDouble(),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.05,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: size.width * 0.05, bottom: size.height * 0.03),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: _reverse,
                                            child: Icon(Icons.arrow_back, color: Colors.white, size: 30,)),
                                          Text('Bed', 
                                            style: AppTextStyles.heading1,
                                          ),
                                        ],
                                      ),
                                       Text('Room', 
                                          style: AppTextStyles.heading1,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: size.height * 0.015),
                                          child: Text('4 Lights', style: AppTextStyles.coloredTitleText),
                                        ),
                                    ],
                                  ),
                                ),
                                LightListContainer(delayedAnimation: _delayedAnimation)
                              ],
                            ),
                           
                          ]
                        ),
                      ),
                    ),
                    Stack(
                      children: [ 
                      AnimatedContainer(
                        duration: Duration(seconds: _animationDuration),
                        padding: EdgeInsets.only(right: size.width * 0.05, left: size.width * 0.05, top: size.height * 0.04),
                        margin: EdgeInsets.only(top: size.height * _animatedContainerMargin),
                        height: size.height * _containerHeight,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                             showSecondScreen == false ? Opacity(
                                opacity: 1.0 - (_earlyAnimation.value.toDouble()),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('All Rooms', style: AppTextStyles.coloredHeading,),
                                    AnimatedContainer(
                                      duration: Duration(seconds: _animationDuration),
                                      height: size.height * _gridContainerHeight,
                                      width: size.width,
                                      child: GridView.builder(
                                        padding: EdgeInsets.only(top: size.height * 0.03, bottom: 30),
                                        itemCount: rooms.length,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              MediaQuery.of(context).size.shortestSide > 600
                                                  ? 3
                                                  : 2,
                                          childAspectRatio: 6 / 6,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                        ),
                                        itemBuilder: (BuildContext context, int index) {
                                          return InkWell(
                                            splashColor: Colors.black12,
                                            onTap: () {
                                              // Navigator.of(context).pushNamed(rooms[index].routeName);
                                              if (rooms[index].id == 1)
                                                _animate();                             
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(left: size.width * 0.05),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30),
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    rooms[index].image,
                                                    width: 50,
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.03,
                                                  ),
                                                  Text(
                                                    rooms[index].title,
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w800
                                                    )),
                                                  SizedBox(
                                                    height: size.height * 0.01,
                                                  ),
                                                  Text(
                                                    rooms[index].subTitle,
                                                    style: AppTextStyles.coloredText),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                    ),
                                  ],
                                ),
                              ) :
                              Opacity(
                                opacity: (_delayedAnimation.value.toDouble()),
                                child: AnimatedContainer(
                                  duration: Duration(seconds: _animationDuration),
                                  height: size.height * _gridContainerHeight,
                                  width: size.width,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Feature(
                                          title: 'Intensity', 
                                          body: SizedBox(
                                            child: Row(
                                              children: [
                                                SvgPicture.asset('assets/solution1.svg', height: size.height * 0.05,),
                                                SizedBox(
                                                  width: 280,
                                                  child: Slider(
                                                    value: 1.0 * _delayedAnimation.value.toDouble(),
                                                    onChanged: (value) {},
                                                    activeColor: Colors.orangeAccent,
                                                    inactiveColor: Colors.grey.shade300,
                                                  ),
                                                ),
                                                SvgPicture.asset('assets/solution.svg', height: size.height * 0.05,),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Feature(
                                          title: 'Colors', 
                                          body: Padding(
                                            padding: EdgeInsets.only(left: size.width * 0.015),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: size.width * 0.85,
                                                  height: size.height * 0.06,
                                                  child: ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: circles.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return Padding(
                                                        padding: EdgeInsets.only(right: size.width * 0.05 * _delayedAnimation.value.toDouble()),
                                                        child: SizedBox(
                                                          width: 25,
                                                          child: OverflowBox(
                                                            maxWidth: 50,
                                                            child: CircleAvatar(
                                                              radius: 18,
                                                              backgroundColor: circles[index].color.withOpacity(0.7),
                                                              child: circles[index].child,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Feature(
                                          title: 'Scenes', 
                                          body: Container(
                                            width: size.width * 0.8,
                                            padding: EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.3 * (1.0 - _delayedAnimation.value.toDouble())),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                               SceneColumn(children: [
                                                Scene(icon: 'assets/surface1.svg', color: Colors.redAccent, title: 'Birthday',),
                                                Scene(icon: 'assets/surface1.svg', color: Colors.blueAccent, title: 'Relax',),
                                                ],
                                                ),
                                               SceneColumn(children: [
                                                Scene(icon: 'assets/surface1.svg', color: Colors.purple, title: 'Party',),
                                                Scene(icon: 'assets/surface1.svg', color: Colors.green, title: 'Fun',),
                                               ],)
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: (_delayedAnimation.value.toDouble()),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height * 0.055, right: size.width * 0.08),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 18,
                              child: SvgPicture.asset('assets/icon-awesome-power-off.svg')),
                          ),
                        ),
                      )
                      ]
                    )
                  ],
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}