import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:smart_office/theme/custom_text_fields/custom_text_field.dart';
import 'package:smart_office/theme/theme.dart';

class AddSolutionWidget extends StatefulWidget {
  const AddSolutionWidget({super.key});

  @override
  State<AddSolutionWidget> createState() => _AddSolutionWidgetState();
}

class _AddSolutionWidgetState extends State<AddSolutionWidget> {
  final _textSolutionController = TextEditingController();
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
    return Column(children: [
      Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
        decoration: whiteBoxDecoration,
        child: Column(
          children: [
            CustomTextField(
              controller: _textSolutionController,
              textLabel: 'Ваше решение...',
              maxLines: 10,
              maxLength: 10000,
            ),
            if (_selectedImages.isNotEmpty) ...[
              const SizedBox(height: 14),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _selectedImages
                    .map(
                      (e) => ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: InteractiveViewer(
                          clipBehavior: Clip.none,
                          child: Image.file(
                            e,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                TextButton.icon(
                    onPressed: _selectedImages.length < 8
                        ? () {
                            _pickImageFromGallery();
                          }
                        : null,
                    label: Text('${_selectedImages.length}/8'),
                    icon: const Icon(Icons.image_search_rounded)),
                const Spacer(),
                ElevatedButton(onPressed: () {}, child: const Text('Отправить'))
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
