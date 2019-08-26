import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
class InfoSlide extends StatefulWidget {
  @override
  _InfoSlideState createState() => _InfoSlideState();
}

class _InfoSlideState extends State<InfoSlide> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: Carousel(
        indicatorBgPadding: 5.0,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(seconds: 2),
        images: [
          NetworkImage('https://scontent.fktm6-1.fna.fbcdn.net/v/t1.0-9/68759629_2498352313520713_9023972171478728704_n.jpg?_nc_cat=104&_nc_eui2=AeFj41tZRP7Qle8Jn60GKUagPCsd9WRX-IdCBgZ9t4v5QBFTDywQCN5pykW8Wf_O5bnJFYmg4wHBtgPHLnCQM6fRIYpK_s6qpIRBu7YXPRMiZg&_nc_oc=AQmrO5MCpucEdv7XYpRaKpCtyCzLRLSTc1Pl_3eO-XL7hx07HldPp_Oq0ioS8R7t8as&_nc_ht=scontent.fktm6-1.fna&oh=932490d976e4343bbefd5b9eca839ae1&oe=5E0CCBAE'),
          NetworkImage('https://scontent.fktm6-1.fna.fbcdn.net/v/t1.0-9/69201303_2498351976854080_5339890357595275264_n.jpg?_nc_cat=101&_nc_eui2=AeFJgBVzj_dAvBr-Ca2Rmf4yRd19x93s_mB01PSUPT2WmE4bP2srTEhBdByePcOwLrbtyv9UjxruxCr-496dCNQa6qkNOPHvN-rEm5Px23OSjA&_nc_oc=AQnbpbO6Inj5ievobn_K3efHkv1Y8v_u2YOCMASwv3UGAeKJDkkocVJfEKhgNAVPsJA&_nc_ht=scontent.fktm6-1.fna&oh=04851909a5a59e3246c092c20db05b40&oe=5DCF985A'),
          NetworkImage('https://scontent.fktm6-1.fna.fbcdn.net/v/t1.0-9/68417701_2498351926854085_14231691962875904_n.jpg?_nc_cat=100&_nc_eui2=AeExCevV08hn1pNBcDD3-uz_UdN1toEyoQCC173gif2k7KSOg3yWtuNn1VKsEBsL-ttLGscPWfygzaj5WsuRE5NlCNTjD7rLeyl1PlBlC41c5g&_nc_oc=AQmt8utimpf54mnDYrX02yM-33L40NUBcpv99yr5ncrkMMpEHd1z50rxv65IlR5EtFc&_nc_ht=scontent.fktm6-1.fna&oh=68aab015b197d2de9c53ae73d14bc844&oe=5E0F6C3D')
        ],
      ),
    );
  }
}