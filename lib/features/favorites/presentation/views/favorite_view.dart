import 'package:flutter/material.dart';
import 'package:travellia/features/favorites/presentation/views/widgets/favorite_view_body.dart';

class FavoriteView extends StatefulWidget {
 FavoriteView({required this.email,Key? key}) : super(key: key);
 String email;
  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}
class _FavoriteViewState extends State<FavoriteView> {
 late Widget bodyView=FavoriteViewBody(email: widget.email,);
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    int currentIndex = 1;

}
int currentIndex = 1;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(child:  FavoriteViewBody(email: widget.email,)),
    );
  }
}
