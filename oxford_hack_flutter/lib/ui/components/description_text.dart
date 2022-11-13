import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField(
      {super.key, required this.controller, this.onChanged});

  final TextEditingController controller;
  final VoidCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 6, 0, 6),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.description_outlined),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(21, 0, 10, 0),
              child: TextFormField(
                onChanged: ((value) {
                  if (onChanged != null) {
                    onChanged!();
                  }
                }),
                minLines: 1,
                maxLines: 4,
                style: const TextStyle(fontSize: 16),
                controller: controller,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: InputBorder.none,
                  hintText: 'Description...',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

