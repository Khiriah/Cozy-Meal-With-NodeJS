import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cozy/auth/controllers/auth_controller.dart';
import 'package:cozy/product/controllers/product_controller.dart';
import 'package:cozy/product/model/product_model.dart';
import 'package:cozy/product/view/widgets/favorite/empty_favorites.dart';
import 'package:cozy/product/view/widgets/favorite/favorites_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  final controller = Get.put(ProductController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.backgroundColor,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(authController.displayUserEmail.value)
                .collection("Favorite")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.favorite=snapshot.data!.docs
                .map((e)=>Product(
                    productName: e['productName'],
                    category: e['category'],
                    quantity: e['quantity'],
                    price: e['price'],
                    description:e ['description'],
                    imageUrl: e['imageUrl']))
                .toList();
                return FavoriteWidget(
                  productModels: snapshot.data!.docs,
                );
              } else if (!snapshot.hasData) {
                return const EmptyFavorites();
              }
              return FavoriteWidget(
                productModels: snapshot.data!.docs,
              );
            },
          ),
        ],
      ),
    );
  }
}
