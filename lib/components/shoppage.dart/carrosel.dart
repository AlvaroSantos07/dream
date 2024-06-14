

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

class Carrosel extends StatefulWidget {
  const Carrosel({super.key});

  @override
  State<Carrosel> createState() => _CarroselState();
}

class _CarroselState extends State<Carrosel> {

  @override

  Widget build(BuildContext context) {
    return Container(
      height: double.minPositive,
      width: double.minPositive,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      boxShadow: [
      BoxShadow( 
      color: Colors.transparent,
      spreadRadius: 3,
      blurRadius: 2,
      offset: Offset(0, 3))]
        
      ),
      child: BannerCarousel(
        banners: 
        BannerImages.listBanners,
      
      ),
    );
  }
}



class BannerImages {
  static const String Banner1 = "https://th.bing.com/th/id/OIP.kJWLFggDxUmEix6g1igOEgHaDt?rs=1&pid=ImgDetMain";
  static const String banner2 = "https://www.esportelandia.com.br/wp-content/uploads/2020/12/loja-pra-comprar-pc-gamer-pronto.jpg";

    static List<BannerModel> listBanners = [
    BannerModel(imagePath: BannerImages.Banner1, id: "1"),
    BannerModel(imagePath: BannerImages.banner2, id: "2"),
  ];
}