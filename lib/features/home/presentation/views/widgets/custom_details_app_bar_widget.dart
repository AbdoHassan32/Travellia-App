import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';


class CustomDetailsAppBarWidget extends StatefulWidget {
  const CustomDetailsAppBarWidget({required this.email,required this.hotel, Key? key}) : super(key: key);
  final Data hotel;
  final String email;

  @override
  State<CustomDetailsAppBarWidget> createState() =>
      _CustomDetailsAppBarWidgetState();
}

class _CustomDetailsAppBarWidgetState extends State<CustomDetailsAppBarWidget>
    with TickerProviderStateMixin {
  CollectionReference favHotels =
      FirebaseFirestore.instance.collection('favHotels');
  late Animation<double> sizeFavAnimation;
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    sizeFavAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 18, end: 23),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 23, end: 18),
        weight: 50,
      ),
    ]).animate(controller);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 25,
        left: 25,
        top: 50,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            height: 36,
            width: 36,
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            height: 36,
            width: 36,
            child: IconButton(
              onPressed: () async {
                setState(() {});

                if (widget.hotel.isFav == false && widget.hotel.docId == '')
                {
                  controller.forward();
                  widget.hotel.isFav = true;
                  favHotels.add({
                    'name': widget.hotel.name,
                    'imageUrl': widget.hotel.photo!.images!.large!.url,
                    'location': widget.hotel.locationString,
                    'price': widget.hotel.price,
                    'rate': widget.hotel.rating,
                    'createdAt' : DateTime.now(),
                    'id' : widget.email,
                  }).then((DocumentReference doc) {
                    widget.hotel.docId = doc.id;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(

                      const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Added to Favorites !',
                          textAlign: TextAlign.center,
                          ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        duration: Duration(
                          seconds: 1,
                        ),
                      ),
                  );
                }
                else
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text('Removed from Favorites !',
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(
                        seconds: 1,
                      ),
                    ),
                  );
                  controller.reverse();
                  widget.hotel.isFav = false;
                  await FirebaseFirestore.instance
                      .runTransaction((Transaction myTransaction) async {
                    myTransaction.delete(favHotels.doc(widget.hotel.docId));
                  });
                  widget.hotel.docId = '';


                }
              },
              icon: Center(
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) {
                      return Icon(
                        widget.hotel.isFav == true
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: const Color(0xffFF2828),
                        size: sizeFavAnimation.value,
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
