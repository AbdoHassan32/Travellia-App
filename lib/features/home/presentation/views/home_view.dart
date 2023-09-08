import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travellia/core/utils/app_router.dart';
import 'package:travellia/core/utils/styles.dart';
import 'package:travellia/features/favorites/presentation/views/favorite_view.dart';
import 'package:travellia/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:travellia/features/profile/presentation/views/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key,required this.email}) : super(key: key);
  final String email;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   late Widget bodyView = HomeViewBody(email: widget.email);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int currentIndex = 0;
}
int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: bodyView),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home,
                ),
              label: '_',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite,
              ),
              label: '_',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,
              ),
              label: '_',
            ),
          ],
          type: BottomNavigationBarType.fixed,
         backgroundColor: Colors.white,
          selectedItemColor:const Color(0xff1C9FE2),
          selectedLabelStyle:const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        showUnselectedLabels: false,
          showSelectedLabels: true,
          currentIndex: currentIndex,
          iconSize: 22,
        unselectedItemColor: const Color(0xffCBCBCB),
        onTap: (index){
            setState(() {
              currentIndex=index;
              if(index==0){
                bodyView = HomeViewBody(email: widget.email,);
              }
              else if(index==1){
                bodyView =   FavoriteView(email: widget.email,);
              }
              else if(index == 2){
                bodyView = const ProfileView();
              }

            });
        },
        ),
      ),

    );
  }
}
