import 'package:flutter/material.dart';

import '../../../data/services/api_service.dart';
import '../../../utils/helper/app_export.dart';

class CreateTaskWidget extends StatefulWidget {
  final VoidCallback onClose;

  const CreateTaskWidget({
    super.key,
    required this.onClose,
  });

  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTController = TextEditingController();
  final TextEditingController _descriptionTController = TextEditingController();

  final ApiService _apiService = ApiService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  IconButton(onPressed: widget.onClose, icon: const Icon(Icons.close)),
                  const SizedBox(width: 10),
                  const Text(
                    'Add New Task',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: _titleTController,
                        validator: (value) {
                          if (value!.isEmpty) return AppString.titleRequiredText;
                          return null;
                        },
                        decoration: const InputDecoration(label: Text('Title')),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        maxLines: 5,
                        controller: _descriptionTController,
                        validator: (value) {
                          if (value!.isEmpty) return AppString.descriptionRequiredText;
                          return null;
                        },
                        decoration: const InputDecoration(
                          alignLabelWithHint: true,
                          label: Text('Description'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _createTaskButton,
                        child: isLoading ? buttonLoading() : const Text('Add'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createTaskButton() async {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});

      final Map<String, String> body = {
        "title": _titleTController.text,
        "description": _descriptionTController.text,
        "status": "New",
      };

      final isSuccess = await _apiService.createTask(body: body);
      isLoading = false;
      if (isSuccess) {
        successToast(msg: 'Success!', context: context);
        setState(() {});
      } else {
        errorToast(msg: 'error!', context: context);
        setState(() {});
      }
    }
  }
}
