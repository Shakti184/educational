import 'package:edubridge/Wrapper/wrapper.dart';
import 'package:flutter/material.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({super.key});

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  PageController controller = PageController(); //controler for the page

  final messages = ["To be a responsible donor, you must get a check-up.", "Your blood type should be compatible with the receiver’s type.", "Donate your blood and save a life."];

  final images = [
    'assets/images/healthcheck1.png',
    'assets/images/puzzle1.png',
    'assets/images/bloodbag1.png',
  ];

  int numberOfPages = 3;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              PageView.builder(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: numberOfPages,
                itemBuilder: (BuildContext context, int index) {
                  return EachPage(messages[index], images[index]);
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Flexible(child: Container()),
                      Flexible(
                          child: Indicator(
                            controller: controller, pageCount: 3  ,
                          )
                      ),
                      Flexible(
                        child: (currentPage == numberOfPages - 1)
                            ? GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const Wrapper())));
                                      },
                                      child: const Text(
                                        "LogIn",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  controller.jumpToPage(numberOfPages - 1);
                                },
                                child: const Center(
                                  child: Text(
                                    "Skip",
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EachPage extends StatelessWidget {
  final String message;
  final String image;

  const EachPage(this.message, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      
      body: Center(
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Image.asset(
            //   image,
            //   fit:BoxFit.cover,
            //   // fit: BoxFit.fitHeight,
            //   // width: MediaQuery.of(context).size.width,
            //   // height: MediaQuery.of(context).size.height,
            // ),
            const SizedBox(
              height: 200,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
          
                child: Text(message,style: const TextStyle(color: Colors.black54,fontSize: 20),textAlign: TextAlign.center,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends AnimatedWidget {
  final PageController controller;
  final int pageCount;
  const Indicator({super.key, required this.controller, required this.pageCount})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              itemCount: pageCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _createIndicator(index);
              }),
        ],
      ),
    );
  }

  Widget _createIndicator(index) {
    double w = 10;
    double h = 10;
    Color color = Colors.white;
    if (controller.page == index) {
      color = Colors.blueAccent;
      h = 13;
      w = 13;
    }
    return SizedBox(
      height: 26,
      width: 26,
      child: Center(
        child: AnimatedContainer(
          margin: const EdgeInsets.all(5),
          color: color,
          width: w,
          height:h,
          duration: const Duration(microseconds: 0),
        ),
      ),
    );
  }
}
