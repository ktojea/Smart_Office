import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:smart_office/theme/custom_text_fields/custom_text_field.dart';
import 'package:smart_office/theme/theme.dart';

class AddProblemScreen extends StatefulWidget {
  const AddProblemScreen({super.key});

  @override
  State<AddProblemScreen> createState() {
    return _AddProblemScreenState();
  }
}

class _AddProblemScreenState extends State<AddProblemScreen> {
  final _titleProblemController = TextEditingController();
  final _textProblemController = TextEditingController();
  final List<File> _selectedImages = [];

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedImages.add(File(returnedImage!.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: bgForAddProblemOrSolution, fit: BoxFit.cover)),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Новая проблема',
                      style: TextStyle(
                          height: 0.8,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  decoration: whiteBoxDecoration,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _titleProblemController,
                        textLabel: 'Название для проблемы',
                        maxLines: 2,
                        maxLength: 250,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      CustomTextField(
                        controller: _textProblemController,
                        textLabel: 'Описание проблемы',
                        maxLines: 8,
                        maxLength: 5000,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      _selectedImages.isNotEmpty
                          ? Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: _selectedImages
                                  .map(
                                    (e) => ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.file(
                                        e,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                          : const Text('Нет выбранных изображений'),
                      _selectedImages.length < 8
                          ? TextButton.icon(
                              onPressed: () {
                                _pickImageFromGallery();
                              },
                              label: const Text('Добавить изображение'),
                              icon: const Icon(Icons.image_search_rounded))
                          : const SizedBox(height: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
