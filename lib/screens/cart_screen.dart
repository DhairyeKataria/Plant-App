import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/data.dart';
import 'package:plant_app/models/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static String id = "CartScreen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double subTotal = 0;
  double shippingCost = 50.0;

  void doTotal() {
    subTotal = 0;
    setState(() {
      for (var e in cartItems) {
        subTotal += e.quantity * e.plant.plantPrice;
      }
    });
  }

  @override
  void initState() {
    doTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    // This is the AppBar
    AppBar appBar = AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
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
              splashRadius: 1.0,
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: kDarkGreenColor,
                size: 24.0,
              ),
            ),
          ),
          Text(
            'My Cart',
            style: GoogleFonts.poppins(
              color: kDarkGreenColor,
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 40.0,
            child: IconButton(
              onPressed: () {},
              splashRadius: 1.0,
              icon: Icon(
                Icons.more_vert,
                color: kDarkGreenColor,
                size: 34.0,
              ),
            ),
          ),
        ],
      ),
    );

    double appbarHeight = appBar.preferredSize.height;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double mainHeight =
        MediaQuery.of(context).size.height - appbarHeight - bottomPadding;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 7,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  height: mainHeight * 7 / 11 - 30,
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemCard(
                        item: cartItems[index],
                        onQuantityChanged: (value) {
                          doTotal();
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(-1, -6),
                      color: Colors.black12,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal:',
                                style: kBillTextStyle,
                              ),
                              Text(
                                '₹${subTotal}0',
                                style: kBillTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sipping Cost:',
                                style: kBillTextStyle,
                              ),
                              Text(
                                '₹${shippingCost}0',
                                style: kBillTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 6.0),
                        ],
                      ),
                    ),
                    Container(height: 0.5, color: Colors.grey.shade500),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: GoogleFonts.poppins(
                              color: kDarkGreenColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '₹${subTotal + shippingCost}0',
                            style: GoogleFonts.poppins(
                              color: kDarkGreenColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
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
                      child: const Text('Place Your Order'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    required this.item,
    required this.onQuantityChanged,
    Key? key,
  }) : super(key: key);

  final CartItem item;
  final Function(int) onQuantityChanged;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        color: kGinColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            margin: const EdgeInsets.only(right: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(
                  widget.item.plant.image,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // The First Widget
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.item.plant.plantName,
                      style: GoogleFonts.poppins(
                        color: kDarkGreenColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      color: kDarkGreenColor,
                    ),
                  ],
                ),

                // The info about the plant
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    "Its spines don't grow.",
                    style: GoogleFonts.poppins(
                      color: kGreyColor,
                    ),
                  ),
                ),

                // The third widget
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // This is Quantity Selector
                    Row(
                      children: [
                        quantityButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              widget.item.quantity > 1
                                  ? --widget.item.quantity
                                  : 0;
                            });
                            // double value = widget.item.plant.plantPrice;
                            widget.onQuantityChanged(widget.item.quantity);
                          },
                        ),
                        SizedBox(
                          // padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          width: 31.0,
                          child: Text(
                            widget.item.quantity.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: kDarkGreenColor,
                            ),
                          ),
                        ),
                        quantityButton(
                          icon: Icons.add,
                          onPressed: () {
                            setState(() {
                              widget.item.quantity < 8
                                  ? ++widget.item.quantity
                                  : 8;
                            });
                            // double value =
                            //     widget.item.plant.plantPrice * quantity;
                            // widget.onQuantityChanged(value);
                            widget.onQuantityChanged(widget.item.quantity);
                          },
                        ),
                      ],
                    ),

                    // Shows Total Price of the plant according to the quantity
                    Text(
                      '₹${widget.item.plant.plantPrice * widget.item.quantity}0',
                      style: GoogleFonts.poppins(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget quantityButton(
      {required IconData icon, required Function() onPressed}) {
    return Container(
      height: 22.0,
      width: 24.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: kDarkGreenColor,
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Icon(
          icon,
          size: 14.0,
        ),
      ),
    );
  }
}
