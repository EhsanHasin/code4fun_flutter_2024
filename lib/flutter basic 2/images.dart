import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var url1 = 'https://hblabgroup.com/wp-content/uploads/2022/04/Mobile-App-Design-Best-Design-Tools-For-2022-1536x864.png';
    var url2 = 'https://www.chilliapple.co.uk/blog/app/uploads/2023/03/chilliapple-Blog-Image-benefits-of-Having-Mobile-App-for-eCommerce-Business.jpg';
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: NetworkImage(url1)),
            Image.network(url2),
            Image(image: AssetImage('assets/images/im1.jpg')),
            Image.asset('assets/images/im2.jpg'),
          ],
        ),
      ),
    );
  }
}
