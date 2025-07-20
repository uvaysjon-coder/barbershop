import 'package:barbershop/core/themes/index.dart';
import 'package:flutter/material.dart';

class ExpandableFormattedText extends StatefulWidget {
  final String text;
  final int maxLength;

  const ExpandableFormattedText({
    super.key,
    required this.text,
    this.maxLength = 250,
  });

  @override
  State<ExpandableFormattedText> createState() => _ExpandableFormattedTextState();
}

class _ExpandableFormattedTextState extends State<ExpandableFormattedText> {
  bool isExpanded = false;
  late String visibleText;
  late String hiddenText;
  late bool hasOverflow;

  @override
  void initState() {
    super.initState();
    _initializeText();
  }

  void _initializeText() {
    // Check if text needs to be truncated
    hasOverflow = widget.text.length > widget.maxLength;

    if (hasOverflow && !isExpanded) {
      // Find the last space within maxLength to avoid cutting words
      int cutIndex = widget.text.substring(0, widget.maxLength).lastIndexOf(' ');
      if (cutIndex == -1) cutIndex = widget.maxLength; // If no space found, cut at maxLength

      visibleText = widget.text.substring(0, cutIndex);
      hiddenText = widget.text.substring(cutIndex);
    } else {
      visibleText = widget.text;
      hiddenText = "";
    }
  }

  List<TextSpan> _processAsterisks(String text) {
    // Normalize to ensure consistent formatting (double to single asterisks)
    String normalizedText = text.replaceAll(RegExp(r'\*\*'), "*");
    List<String> parts = normalizedText.split('*');

    return List<TextSpan>.generate(parts.length, (index) {
      if (index.isOdd) {
        // Odd indices are the text between asterisks - make it bold
        return TextSpan(
          text: parts[index],
          style: context.text.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        );
      } else {
        // Even indices are regular text
        return TextSpan(text: parts[index]);
      }
    });
  }

  Widget _buildToggleButton() {
    if (!hasOverflow) return const SizedBox.shrink();

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          isExpanded ? 'Hide' : 'Read more...',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          _initializeText();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = _processAsterisks(visibleText);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: TextSpan(
            children: spans,
            style: context.text.bodyMedium,
          ),
        ),
        _buildToggleButton(),
      ],
    );
  }
}