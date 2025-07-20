import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../themes/index.dart';

enum CustomTextFieldType {
  primary,
  phoneNumber,
  password,
  link,
  amount,
  email,
}

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hintMessage;
  final int? maxLength;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled,error,readOnly;
  final Function(String)? onChanged;

  final Color? textColor;
  final Color? hintColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? textFieldText;
  final TextInputType? keyboardType ;
  final CustomTextFieldType type;
  final Function(String)? onSubmitted;
  final int? maxLines;

  /// Private konstruktor
  const CustomTextField._(
      this.title,
      this.hintMessage,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.enabled,
      this.readOnly,
      this.onChanged,
      this.textColor,
      this.hintColor,
      this.backgroundColor,
      this.borderColor,
      this.textFieldText, {
        super.key,
        required this.type, this.keyboardType,  this.error=false,
        this.onSubmitted, this.maxLength, this.maxLines,
      });

  /// **PRIMARY** turdagi TextField
  const CustomTextField.primary({
    int? maxLength,

    Key? key,
    String? title,
    String? hintMessage,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool enabled = true,
    bool readOnly = false,
    Function(String)? onChanged,
    Color? textColor,
    Color? hintColor,
    Color? backgroundColor,
    Color? borderColor,
    String? textFieldText,
    TextInputType? keyboardType,
    Function(String)? onSubmitted,
    int? maxLines,
    bool error=false,
  }) : this._(
    title,
    hintMessage,
    hintText,
    prefixIcon,
    suffixIcon,
    enabled,
    readOnly,
    onChanged,
    textColor,
    hintColor,
    backgroundColor,
    borderColor,
    textFieldText,
    key: key,
    keyboardType: keyboardType,
    error: error,
    type: CustomTextFieldType.primary,
    onSubmitted: onSubmitted,
    maxLength: maxLength,
    maxLines: maxLines ?? 1,
  );

  /// **PHONE NUMBER** turdagi TextField
  const CustomTextField.phoneNumber({
    Key? key,
    // Parametrlarni xuddi primary’dagi kabi yozib chiqishingiz mumkin
    String? title,
    String? hintMessage,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool enabled = true,
    bool readOnly = false,
    Function(String)? onChanged,
    Color? textColor,
    Color? hintColor,
    Color? backgroundColor,
    Color? borderColor,
    String? textFieldText,
    Function(String)? onSubmitted,

    bool error=false,
  }) : this._(
    title,
    hintMessage,
    hintText,
    prefixIcon,
    suffixIcon,
    enabled,
    readOnly,
    onChanged,
    textColor,
    hintColor,
    backgroundColor,
    borderColor,
    textFieldText,
    key: key,
    error: error,
    type: CustomTextFieldType.phoneNumber,
    keyboardType: TextInputType.phone,
    onSubmitted: onSubmitted
  );

  /// **PASSWORD** turdagi TextField
  const CustomTextField.password({
    Key? key,
    // Parametrlarni xuddi primary’dagi kabi yozib chiqishingiz mumkin
    String? title,
    String? hintMessage,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool enabled = true,
    bool readOnly = false,
    Function(String)? onChanged,
    Color? textColor,
    Color? hintColor,
    Color? backgroundColor,
    Color? borderColor,
    String? textFieldText,
    Function(String)? onSubmitted,
    bool error=false,
  }) : this._(
    title,
    hintMessage,
    hintText,
    prefixIcon,
    suffixIcon,
    enabled,
    readOnly,
    onChanged,
    textColor,
    hintColor,
    backgroundColor,
    borderColor,
    textFieldText,
    key: key,
    error: error,
    onSubmitted: onSubmitted,
    type: CustomTextFieldType.password,
  );

  /// **LINK** turdagi TextField
  const CustomTextField.link({
    Key? key,
    String? title,
    String? hintMessage,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool enabled = true,
    bool readOnly = false,
    Function(String)? onChanged,
    Color? textColor,
    Color? hintColor,
    Color? backgroundColor,
    Color? borderColor,
    String? textFieldText,
    Function(String)? onSubmitted,

  }) : this._(
    title,
    hintMessage,
    hintText,
    prefixIcon,
    suffixIcon,
    enabled,
    readOnly,
    onChanged,
    textColor,
    hintColor,
    backgroundColor,
    borderColor,
    textFieldText,
    key: key,
    onSubmitted: onSubmitted,
    type: CustomTextFieldType.link,
  );

  /// **AMOUNT** turdagi TextField
  const CustomTextField.amount({
    Key? key,
    String? title,
    String? hintMessage,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool enabled = true,
    bool readOnly = false,
    Function(String)? onChanged,
    Color? textColor,
    Color? hintColor,
    Color? backgroundColor,
    Color? borderColor,
    String? textFieldText,
  }) : this._(
    title,
    hintMessage,
    hintText,
    prefixIcon,
    suffixIcon,
    enabled,
    readOnly,
    onChanged,
    textColor,
    hintColor,
    backgroundColor,
    borderColor,
    textFieldText,
    key: key,
    type: CustomTextFieldType.amount,
  );

  /// **EMAIL** turdagi TextField
  const CustomTextField.email({
    Key? key,
    String? title,
    String? hintMessage,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool enabled = true,
    bool readOnly = false,
    Function(String)? onChanged,
    Color? textColor,
    Color? hintColor,
    Color? backgroundColor,
    Color? borderColor,
    String? textFieldText,
    Function(String)? onSubmitted,

    bool error=false,
  }) : this._(
    title,
    hintMessage,
    hintText,
    prefixIcon,
    suffixIcon,
    enabled,
    readOnly,
    onChanged,
    textColor,
    hintColor,
    backgroundColor,
    borderColor,
    textFieldText,
    key: key,
    error: error,
    type: CustomTextFieldType.email,
    onSubmitted: onSubmitted
  );

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;
  bool _isPasswordVisible = true; // masalan, default "yopiq" holat
  late FocusNode _focusNode ;
  late MaskTextInputFormatter _phoneFormatter;

  @override
  void initState() {
    _focusNode = FocusNode();
    _phoneFormatter = MaskTextInputFormatter(mask: '## ### ## ##', filter: {"#": RegExp(r'[0-9]')});

    _controller = TextEditingController(text: widget.textFieldText );
    // TODO: implement initState
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  Color _resolveBorderColor(BuildContext context) {
    if (widget.error) {
      return context.color.red500;
    }
    return _focusNode.hasFocus
        ? context.color.primary
        : (widget.borderColor ?? context.color.coolGray300);
  }

  /// Agar hasError true bo'lsa, background transparent; aks holda, focusda primary.withOpacity(0.4)
  Color _resolveBackgroundColor(BuildContext context) {
    if (widget.error) {
      return context.color.red500.withOpacity(0.1);
    }
    return _focusNode.hasFocus
        ? (widget.backgroundColor ?? context.color.primary.withOpacity(0.1))
        : (widget.backgroundColor ?? Colors.transparent);
  }




  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // `CustomButton`da bo‘lgani kabi, turiga qarab tegishli widgetni qaytarish
    return switch (widget.type) {
      CustomTextFieldType.primary => _primaryTextField(context),
      CustomTextFieldType.phoneNumber => _phoneNumberTextField(context),
      CustomTextFieldType.password => _passwordTextField(context),
      CustomTextFieldType.link => _linkTextField(context),
      CustomTextFieldType.amount => _amountTextField(context),
      CustomTextFieldType.email => _emailTextField(context),
    };
  }

  /// PRIMARY turdagi TextField
  Widget _primaryTextField(BuildContext context) {
    final borderColor = _resolveBorderColor(context);
    final backgroundColor = _resolveBackgroundColor(context);
    return Container(
      // margin: AppSpacing.a12, (istasaiz margin yoki padding berishingiz mumkin)
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          if (widget.title != null)
            Text(
              widget.title!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.color.black,
              ),
            ),
          widget.title != null ? 8.gap : 0.gap,
          // TextField o'zi
          Container(
            padding: AppSpacing.a10_4,
            decoration: BoxDecoration(
              borderRadius: AppBorders.r8,
              color: backgroundColor,
              border: Border.all(
                color: borderColor, // Example: primary rang
                width: 1,
              ),
            ),
            child: Row(
              children: [
                widget.prefixIcon ?? const SizedBox(),
                8.gap,
                Expanded(
                  child: TextFormField(
                    maxLines: widget.maxLines,
                    readOnly: widget.readOnly,
                    maxLength: widget.maxLength,

                    focusNode: _focusNode,
                    enabled: widget.enabled,
                    onChanged: widget.onChanged,
                    onFieldSubmitted: widget.onSubmitted,
                    keyboardType: widget.keyboardType ,
                    controller: _controller,
                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: AppSpacing.zero,
                      hintText: widget.hintText,

                      hintStyle: context.textTheme.bodyMedium?.copyWith(
                        color: widget.hintColor ?? context.color.coolGray400,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide.none,
                        gapPadding: 0,
                      ),
                    ),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: widget.textColor ?? context.color.black,
                    ),
                  ),
                ),
                8.gap,
                widget.suffixIcon ?? const SizedBox(),
              ],
            ),
          ),
          widget.hintMessage != null ? 8.gap : 0.gap,

          // Pastdagi hint message
          if (widget.hintMessage != null)
            Text(
              widget.hintMessage!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: widget.error ?  context.color.red500 :context.color.unSelected ,
              ),
            ),
        ],
      ),
    );
  }

  /// PHONE NUMBER turdagi TextField (hozircha bo‘sh)
  Widget _phoneNumberTextField(BuildContext context) {
    return  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          if (widget.title != null)
            Text(
              widget.title!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.color.black,
              ),
            ),
          8.gap,
          // TextField o'zi
          Container(
            padding: AppSpacing.a10_4,
            decoration: BoxDecoration(
              borderRadius: AppBorders.r8,
              color: _resolveBackgroundColor(context),
              border: Border.all(
                color: _resolveBorderColor(context), // Example: primary rang
                width: 1,
              ),
            ),
            child: Row(
              children: [
                widget.prefixIcon ?? const SizedBox(),
                8.gap,
                Expanded(
                  child: Stack(
                    children: [
                      TextFormField(
                        readOnly: widget.readOnly,
                        focusNode: _focusNode,
                        inputFormatters: [_phoneFormatter],
                        enabled: widget.enabled,
                        onChanged: widget.onChanged,
                        keyboardType: widget.keyboardType ,
                        controller: _controller,
                        decoration: InputDecoration(
                          contentPadding: AppSpacing.zero,
                          hintText: widget.hintText,
                          hintStyle: context.textTheme.bodyMedium?.copyWith(
                            color: widget.hintColor ?? context.color.coolGray400,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide.none,
                            gapPadding: 0,
                          ),
                        ),
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: widget.textColor ?? context.color.black,
                        ),
                      ),

                    ],
                  ),
                ),
                8.gap,
                widget.suffixIcon ?? const SizedBox(),
              ],
            ),
          ),
          // Pastdagi hint message
          if (widget.hintMessage != null)
            Text(
              widget.hintMessage!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.color.unSelected,
              ),
            ),
        ],


    );
  }

  /// PASSWORD turdagi TextField (hozircha bo‘sh)
  Widget _passwordTextField(BuildContext context) {
    final borderColor = _resolveBorderColor(context);
    final backgroundColor = _resolveBackgroundColor(context);
    return Container(
      // margin: AppSpacing.a12, (istasaiz margin yoki padding berishingiz mumkin)
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          if (widget.title != null)
            Text(
              widget.title!,


              style: context.textTheme.bodyMedium?.copyWith(
                color: context.color.black,
              ),
            ),
          8.gap,
          // TextField o'zi
          Container(
            padding: AppSpacing.a10_4,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: AppBorders.r8,
              border: Border.all(
                color:borderColor, // Example: primary rang
                width: 1,
              ),
            ),
            child: Row(
              children: [
                widget.prefixIcon ?? const SizedBox(),
                8.gap,
                Expanded(
                  child: TextFormField(
                    readOnly: widget.readOnly,
                    focusNode: _focusNode,
                   /* obscuringCharacter: "*",*/

                    enabled: widget.enabled,
                    obscureText: _isPasswordVisible,
                    onChanged: widget.onChanged,
                    keyboardType: widget.keyboardType ,
                    controller: _controller,
                    decoration: InputDecoration(
                      contentPadding: AppSpacing.zero,
                      hintText: widget.hintText,

                      hintStyle: context.textTheme.bodyMedium?.copyWith(
                        color: widget.hintColor ?? context.color.coolGray400,
                      ),

                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide.none,
                        gapPadding: 0,
                      ),
                    ),
                    style: context.textTheme.bodyMedium?.copyWith(

                      color: widget.textColor ?? context.color.black,
                    ),
                  ),
                ),
                8.gap,
                IconButton(
                  onPressed: () {
                    if(widget.enabled){
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    }

                  },
                  icon: _isPasswordVisible ?
                      Assets.icon.eye.svg(
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                            context.color.primary, BlendMode.srcIn),
                      ) : Assets.icon.eyeClosed.svg(
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                            context.color.primary, BlendMode.srcIn),
                      ),

                  /*Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: context.color.primary,
                  ),*/
                ),
              ],
            ),
          ),
          // Pastdagi hint message
          if (widget.hintMessage != null)
            Text(
              widget.hintMessage!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.color.unSelected,
              ),
            ),
        ],
      ),
    );
  }

  /// LINK turdagi TextField (hozircha bo‘sh)
  Widget _linkTextField(BuildContext context) {
    return const SizedBox();
  }

  /// AMOUNT turdagi TextField (hozircha bo‘sh)
  Widget _amountTextField(BuildContext context) {
    return const SizedBox();
  }

  /// EMAIL turdagi TextField (hozircha bo‘sh)
  Widget _emailTextField(BuildContext context) {
    return const SizedBox();
  }
}
