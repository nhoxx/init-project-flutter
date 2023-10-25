import 'package:flutter/material.dart';
import 'package:pets_analytics/common/AppColors.dart';
import 'package:pets_analytics/common/AppStyles.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_remix/flutter_remix.dart';

class PetsTextField extends StatefulWidget {
  final String formControlName;
  final bool? obscureText;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final String? labelText;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? prefixActiveIcon;
  final int? maxLength;
  final String? outsideError;
  final FormGroup? formGroup;
  final Widget? suffixShowIcon;
  final Widget? suffixHideIcon;
  final void Function(FormControl<Object?>)? onChanged;

  const PetsTextField(
      {super.key,
      required this.formControlName,
      this.obscureText,
      this.validationMessages,
      this.labelText,
      this.keyboardType,
      this.prefix,
      this.prefixIcon,
      this.prefixActiveIcon,
      this.maxLength,
      this.outsideError,
      this.onChanged,
      this.formGroup,
      this.suffixShowIcon,
      this.suffixHideIcon});

  @override
  // ignore: library_private_types_in_public_api
  _PetsTextFieldState createState() => _PetsTextFieldState();
}

class _PetsTextFieldState extends State<PetsTextField> {
  final FocusNode _focus = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  FormControl<dynamic>? formControl;
  bool _isFocus = false;
  String errorText = '';
  bool isValue = false;
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    formControl =
        widget.formGroup?.control(widget.formControlName) as FormControl?;
    _textEditingController.addListener(() {
      _onChanged(formControl);
    });
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocus = _focus.hasFocus
          ? true
          : _textEditingController.value.text.isNotEmpty
              ? true
              : false;
    });
  }

  void _setError(String value) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        errorText = value;
      });
    });
  }

  bool _handleError(FormControl<Object?> control) {
    final typeError = control.errors.keys.single;
    String newError = '';
    widget.validationMessages?.forEach((key, value) {
      if (key == typeError) {
        newError = value.call({});
      }
    });
    if (control.dirty && control.invalid && errorText != newError) {
      _setError(newError);
    }
    return false;
  }

  void _onChanged(FormControl<dynamic>? control) {
    if (control != null && control.valid && errorText.isNotEmpty) {
      _setError('');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorError =
        errorText.isNotEmpty ? AppColors.accent1 : AppColors.border;
    return Column(
      children: [
        ReactiveTextField(
          controller: _textEditingController,
          focusNode: _focus,
          formControl: formControl,
          formControlName: formControl != null ? null : widget.formControlName,
          obscureText: widget.obscureText != null ? isObscure : false,
          obscuringCharacter: '●',
          validationMessages: widget.validationMessages,
          keyboardType: widget.keyboardType,
          showErrors: (control) => _handleError(control),
          maxLength: widget.maxLength ?? 320,
          style: AppStyles.blackMediumS16,
          onChanged: (control) => _onChanged(control),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              errorMaxLines: 2,
              counterText: '',
              prefix: widget.prefix,
              suffixIcon: widget.obscureText != null
                  ? SizedBox(
                      height: 32,
                      width: double.minPositive,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: isObscure
                              ? widget.suffixShowIcon
                              : widget.suffixHideIcon),
                    )
                  : null,
              prefixIcon:
                  _isFocus ? widget.prefixActiveIcon : widget.prefixIcon,
              labelText: widget.labelText ?? "",
              labelStyle: AppStyles.greyMediumS14,
              floatingLabelStyle: AppStyles.blackRegularS16,
              isDense: true,
              errorStyle: AppStyles.redMediumS10,
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: colorError,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: colorError,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: colorError,
                    width: 1,
                    style: BorderStyle.solid,
                  ))),
        ),
        (errorText.isNotEmpty || ((widget.outsideError?.length ?? 0) > 0))
            ? Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 6),
                      child: Icon(
                        FlutterRemix.close_circle_fill,
                        color: AppColors.accent1,
                        size: 13,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        errorText.isNotEmpty
                            ? errorText
                            : widget.outsideError ?? "",
                        style: getAppTextStyle(AppStyles.accentMediumS14, 18),
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
