import 'package:crud_app/app/data/services/api_service.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper/toast_message.dart';
import '../model/product_model.dart';
import '../widgets/product_item.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController(text: '0');
  final TextEditingController qtyController = TextEditingController(text: '1');
  final TextEditingController totalPriceController = TextEditingController();

  ApiService apiService = ApiService();
  late List<Product> productList = [];
  bool isLoading = true;

  Future<void> _loadProductList() async {
    isLoading = true;
    setState(() {});
    try {
      productList = await apiService.fetchProductList();
    } catch (e) {
      showToast(msg: '$e');
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  Future<void> _saveProduct() async {
    isLoading = true;
    setState(() {});
    Product product = Product(
      name: nameController.text.toString(),
      code: codeController.text.toString(),
      image: imageController.text.toString(),
      unitPrice: unitPriceController.text.toString(),
      qty: qtyController.text.toString(),
      totalPrice: totalPriceController.text.toString(),
    );
    bool isSuccess = await apiService.createProduct(jsonBody: product.toJson());
    if (isSuccess) {
      _cleatTextController();
      _loadProductList();
      showToast(msg: 'Successfully Added New Product');
      setState(() {});
    } else {
      showToast(msg: 'Unable to create');
    }

    isLoading = true;
    setState(() {});
  }

  Future<void> _updateProduct({required String productId}) async {
    Product product = Product(
      name: nameController.text.toString(),
      code: codeController.text.toString(),
      image: imageController.text.toString(),
      unitPrice: unitPriceController.text.toString(),
      qty: qtyController.text.toString(),
      totalPrice: totalPriceController.text.toString(),
    );
    bool isSuccess = await apiService.updateProduct(jsonBody: product.toJson(), id: productId);
    if (isSuccess) {
      _cleatTextController();
      _loadProductList();
      showToast(msg: 'Successfully Updated');
      setState(() {});
    } else {
      showToast(msg: 'Unable to update');
    }
  }

  Future<void> _deleteProduct({productId}) async {
    bool isSuccess = await apiService.deleteProduct(productId: productId);
    if (isSuccess) {
      _loadProductList();
    }
    showToast(msg: 'Successfully Deleted');
    setState(() {});
  }

  void _setExistProductText({required Product product}) {
    _cleatTextController();
    nameController.text = product.name;
    codeController.text = product.code;
    imageController.text = product.image;
    unitPriceController.text = product.unitPrice;
    qtyController.text = product.qty;
    totalPriceController.text = product.totalPrice;
    setState(() {});
  }

  void _cleatTextController() {
    nameController.clear();
    codeController.clear();
    imageController.clear();
    unitPriceController.clear();
    qtyController.clear();
    totalPriceController.clear();
  }

  void _updateTotalPrice() {
    // Get the values from the text fields
    final String unitPrice = unitPriceController.text;
    final String quantity = qtyController.text;

    // Parse the values to double and calculate the total price
    final double unitPriceValue = double.tryParse(unitPrice) ?? 0;
    final double quantityValue = double.tryParse(quantity) ?? 0;
    final double totalPrice = unitPriceValue * quantityValue;

    // Update the total price controller
    totalPriceController.text = totalPrice.toString();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _loadProductList();
    unitPriceController.addListener(_updateTotalPrice);
    qtyController.addListener(_updateTotalPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [IconButton(onPressed: () => _loadProductList(), icon: const Icon(Icons.refresh))],
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildProductList(),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () {
          _cleatTextController();
          _showFormDialog(
            context: context,
            title: 'Add New Product',
            action: () => _saveProduct(),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildProductList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: productList.length,
              itemBuilder: (context, index) {
                Product product = productList[index];
                return ProductWidget(
                  name: product.name,
                  code: product.code,
                  unitPrice: product.unitPrice,
                  image: product.image,
                  qty: product.qty,
                  totalPrice: product.totalPrice,
                  createdDate: product.createdDate,
                  onDelete: () => _showDeleteDialog(context: context, product: product),
                  onEdit: () {
                    _setExistProductText(product: product);
                    _showFormDialog(
                      context: context,
                      title: 'Update Product',
                      action: () => _updateProduct(productId: product.id!),
                      isClose: true,
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showFormDialog({
    required BuildContext context,
    required String title,
    required Function() action,
    bool isClose = false,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(title),
          actionsPadding: const EdgeInsets.only(top: 0),
          contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 0),
          actions: [
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) action();
                if (isClose) Navigator.of(context).pop();
              },
              child: isLoading ? const CircularProgressIndicator() : const Text('Save'),
            ),
          ],
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// -- Product name
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Product name cannot be empty';
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Product Name ',
                        hintText: 'Eg. Iphone 12 Pro Max',
                        hintStyle: TextStyle(color: Colors.black12),
                        border: OutlineInputBorder()),
                  ),

                  /// -- Product Code
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: codeController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Product Code cannot be empty';
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Product Code ',
                        hintText: 'Eg. B11',
                        hintStyle: TextStyle(color: Colors.black12),
                        border: OutlineInputBorder()),
                  ),

                  /// -- Product Image url
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: imageController,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                        labelText: 'Product Image',
                        hintText: 'Eg. http://cdn.com/images/image.png',
                        hintStyle: TextStyle(color: Colors.black12),
                        border: OutlineInputBorder()),
                  ),

                  const SizedBox(height: 10),
                  Row(
                    children: [
                      /// -- Product Unit Price
                      Expanded(
                        child: TextFormField(
                          controller: unitPriceController,
                          validator: (value) {
                            if (value!.isEmpty) return 'Unit price cannot be empty';
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Unit price',
                              hintText: 'Eg. 200',
                              hintStyle: TextStyle(color: Colors.black12),
                              border: OutlineInputBorder()),
                        ),
                      ),

                      /// -- Product Quantity
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: qtyController,
                          validator: (value) {
                            if (value!.isEmpty) return 'Quantity cannot be empty';
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Quantity',
                              hintText: 'Eg. 20',
                              hintStyle: TextStyle(color: Colors.black12),
                              border: OutlineInputBorder()),
                        ),
                      ),

                      /// -- Product Total Price
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          enabled: false, // Disable editing for the result field
                          controller: totalPriceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Total Price',
                              hintText: 'Eg. 20',
                              hintStyle: TextStyle(color: Colors.black12),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDeleteDialog({required BuildContext context, required Product product}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text('Delete Confirmation'),
          content: Text('Are you sure you want to Delete\n${product.name}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Dismiss the dialog
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteProduct(productId: product.id);
                Navigator.of(context).pop(); // Close the dialog
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
