import 'package:crud_app/app/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String name;
  final String code;
  final String image;
  final bool isImageExist;
  final String unitPrice;
  final String qty;
  final String totalPrice;
  final DateTime? createdDate;
  final Function() onDelete;
  final Function() onEdit;

  const ProductWidget({
    super.key,
    required this.name,
    required this.code,
    required this.image,
    this.isImageExist = false,
    required this.unitPrice,
    required this.qty,
    required this.totalPrice,
    required this.createdDate,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: isImageExist
                  ? Image.network(
                      image.trim(),
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      ImagePath.imageNotFound,
                      fit: BoxFit.fill,
                    ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Code: $code\nUnit Price: \$$unitPrice'),
                        Text('Quantity: $qty\nTotal Price: \$$totalPrice'),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(foregroundColor: Colors.red),
                        onPressed: () => onDelete(),
                        icon: const Icon(Icons.delete_forever),
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        style: IconButton.styleFrom(foregroundColor: Colors.blue),
                        onPressed: () => onEdit(),
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
