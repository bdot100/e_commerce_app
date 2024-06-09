import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/data/repository/popular_porduct_repo.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{
      // print("error getting popular products");
    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
    }else{
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }
  
  int checkQuantity(int quantity){
    if (quantity < 0) {
      Get.snackbar("Item count", "you can't order less than 0",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    }else if(quantity > 20){
      Get.snackbar("Item count", "you can't order more than 20",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    }else {
      return quantity;
    }
  }
  
  void initProduct(CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;

    // if exists
    
    // get from storage _inCartItems = 3
  }
 
  void addItem(ProductModel product){
    _cart.addItem(product, _quantity);
  }
}