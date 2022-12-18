import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plant.dart';

class PlantDetails extends StatefulWidget {
  const PlantDetails({required this.plant, Key? key}) : super(key: key);

  final Plant plant;

  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  bool favorite = false;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leadingWidth: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 20.0,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: kDarkGreenColor,
                  size: 24.0,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: kDarkGreenColor,
              radius: 20.0,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    favorite = !favorite;
                  });
                },
                icon: Icon(
                  favorite == true
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.42,
            color: kSpiritedGreen,
            padding: const EdgeInsets.only(top: 40.0),
            child: Hero(
              tag: widget.plant.plantName,
              child: Image.asset(widget.plant.image),
            ),
          ),
          Container(
            color: kSpiritedGreen,
            height: MediaQuery.of(context).size.height * 0.58,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //   child: Container(
                  //     height: 4.0,
                  //     width: 100.0,
                  //     decoration: BoxDecoration(
                  //         color: kGreyColor,
                  //         borderRadius: BorderRadius.circular(40.0)),
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.plant.plantName,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                              color: kDarkGreenColor,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            children: [
                              Text(
                                '₹${widget.plant.plantPrice * quantity}0',
                                style: TextStyle(
                                  color: Colors.green.shade600,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 6.0),
                              StarRating(
                                stars: widget.plant.stars,
                                size: 16.0,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        ],
                      ),
                      QuantitySelector(
                        min: 1,
                        max: 8,
                        initial: 1,
                        onChanged: (value) {
                          setState(() {
                            quantity = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'About',
                          style: GoogleFonts.poppins(
                            color: kDarkGreenColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 20.0),
                          child: Text(
                            'The snake plant, commonly referred to as mother-in-law\'s tongue, is a resilient succulent that can grow anywhere between 6 inches to several feet. In addition to providing a bit of ambiance, snake plants have a number of health benefits, including: filter indoor air. remove toxic pollutants.',
                            style: GoogleFonts.poppins(
                              color: kDarkGreenColor,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          clipBehavior: Clip.none,
                          child: Row(
                            children: [
                              PlantMetricsWidget(
                                title: 'Height',
                                value: widget.plant.metrics.height,
                                icon: Icons.height,
                              ),
                              PlantMetricsWidget(
                                title: 'Humidiy',
                                value: widget.plant.metrics.humidity,
                                icon: Icons.water_drop_outlined,
                              ),
                              PlantMetricsWidget(
                                title: 'Width',
                                value: widget.plant.metrics.width,
                                icon: Icons.width_full_outlined,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: CircleAvatar(
                          backgroundColor: kGinColor,
                          radius: 26.0,
                          child: IconButton(
                            color: Colors.white,
                            splashRadius: 28.0,
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: kDarkGreenColor,
                              size: 28.0,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kDarkGreenColor,
                            elevation: 20.0,
                            textStyle: GoogleFonts.poppins(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.shopping_bag_outlined,
                                size: 24.0,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                'BUY NOW',
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlantMetricsWidget extends StatelessWidget {
  const PlantMetricsWidget({
    required this.title,
    required this.value,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.only(right: 28.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: kDarkGreenColor,
            radius: 28.0,
            child: Icon(
              icon,
              color: Colors.white,
              size: 35.0,
            ),
          ),
          const SizedBox(width: 12.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: kGreyColor,
                ),
              ),
              Align(
                child: Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: kDarkGreenColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({
    required this.min,
    required this.max,
    required this.initial,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final int min;
  final int max;
  final int initial;
  final Function(int) onChanged;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    quantity = widget.initial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      width: 95.0,
      decoration: BoxDecoration(
        color: kDarkGreenColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.onChanged(
                      quantity != widget.min ? --quantity : widget.min);
                });
              },
              child: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 18.0,
              ),
            ),
          ),
          Align(
            child: Text(
              '$quantity',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.onChanged(
                      quantity != widget.max ? ++quantity : widget.max);
                });
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int scale;
  final double stars;
  final Color? color;
  final double? size;
  final Function(double)? onChanged;

  const StarRating({
    this.scale = 5,
    this.stars = 0.0,
    this.size,
    this.color = Colors.orange,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    IconData icon;
    if (index >= stars) {
      icon = Icons.star_border;
    } else if (index > stars - 1 && index < stars) {
      icon = Icons.star_half;
    } else {
      icon = Icons.star;
    }
    return GestureDetector(
      onTap: () => onChanged!(index + 1.0),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        scale,
        (index) => buildStar(context, index),
      ),
    );
  }
}
