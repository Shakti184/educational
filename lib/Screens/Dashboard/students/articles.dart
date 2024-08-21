import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.white],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      decoration: const BoxDecoration(
                        backgroundBlendMode: BlendMode.lighten,
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                        child: const Text(
                      "Report",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                    CircleAvatar(
                        radius: (22),
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/home_page.jpeg"),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        
                        Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: 400,
                          height: 600,
                          decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            alignment: Alignment.center,
                          child: const Text("                                                                                                                                                         Chief Minister Yogi Adityanath, on Wednesday, said that prior to 2014, a sense of discontent prevailed among the citizens of the country against the system.Speaking at a degree distribution program held on the occasion of completion of 25 years of the Krishna Institute of Engineering and Technology in Ghaziabad, Yogi said that big movements were taking place across the nation, and disorder, anarchy and distrust of the government had become the identity of India.He added that the nation underwent a transformation after Prime Minister Narendra Modi assumed power. “Presently, India is witnessing new heights of development, and its 140 crore citizens hold their leadership in high regard, extending full respect and trust”, he remarked.The Chief Minister said that Uttar Pradesh stands today as one of the leading states in the country in terms of ease of doing business. Notably, the state’s economy, which was once ranked eighth or tenth, is now in the race to become number one and two. This transformation represents the emergence of a new Uttar Pradesh of new India, he pointed out further."),
                        ),
                         Container(
                              width: 260,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orangeAccent,
                              ),
                              alignment: Alignment.bottomCenter,
                              child: const Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  "Chief Minister Visit",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                      ],),
                           
                          ],
                        ),
                        const CircleAvatar(
                          radius: 60,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(iconSize: 30,onPressed: (){}, icon: const Icon(Icons.thumb_up_alt_outlined),color: Colors.white,),
                        IconButton(iconSize: 30,onPressed: (){}, icon: const Icon(Icons.comment_outlined),color: Colors.white,),
                        IconButton(iconSize: 30,onPressed: (){}, icon: const Icon(Icons.share_outlined),color: Colors.white,),
                      ],
                    
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
