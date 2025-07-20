import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/features/auth/otp/presentation/widgets/otp_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';

import 'bloc/otp_bloc.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    // On web, disable the browser's context menu since this example uses a custom
    // Flutter-rendered context menu.

    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    /*..addListener(() {
        context.read<OtpBloc>().add(OtpChangeEvent(pinController.text));
      });*/
    focusNode = FocusNode();

    /// In case you need an SMS autofill feature
    smsRetriever = SmsRetrieverImpl(
      SmartAuth.instance,
    );
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusedBorderColor = context.color.primary;
    final fillColor = context.color.primary.withOpacity(0.1);
    final borderColor = context.color.primary.withOpacity(0.2);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: context.textTheme.bodyLarge?.copyWith(
        color: context.color.primary,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
    );
    return OtpListener(
      child: Scaffold(
        body: BlocBuilder<OtpBloc, OtpState>(
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: AppSpacing.a20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Authentication',
                                style: context.textTheme.headlineMedium?.copyWith(
                                  color: context.color.primary,
                                )),
                            4.gap,
                            Text(
                                'Please enter the authentication code that we have sent to your email',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.color.coolGray500,
                                )),
                            24.gap,
                            Center(
                              child: Directionality(
                                // Specify direction if desired
                                textDirection: TextDirection.ltr,
                                child: Pinput(
                                  // You can pass your own SmsRetriever implementation based on any package
                                  // in this example we are using the SmartAuth
                                  smsRetriever: smsRetriever,
      
                                  controller: pinController,
                                  focusNode: focusNode,
                                  defaultPinTheme: PinTheme(
                                    width: 56,
                                    height: 56,
                                    textStyle:
                                        context.textTheme.bodyLarge?.copyWith(
                                      color: context.color.primary,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: context.color.primary
                                              .withOpacity(0.2)),
                                    ),
                                  ),
                                  separatorBuilder: (index) =>
                                      const SizedBox(width: 8),

                                  hapticFeedbackType:
                                      HapticFeedbackType.lightImpact,
                                  onChanged: (value) {
                                    context.read<OtpBloc>().add(
                                        OtpChangeEvent(value));
                                  },
                                  cursor: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 9),
                                        width: 22,
                                        height: 1,
                                        color: context.color.primary,
                                      ),
                                    ],
                                  ),
                                  focusedPinTheme: defaultPinTheme.copyWith(
                                    decoration:
                                        defaultPinTheme.decoration!.copyWith(
                                      borderRadius: BorderRadius.circular(12),
                                      border:
                                          Border.all(color: focusedBorderColor),
                                    ),
                                  ),
                                  submittedPinTheme: defaultPinTheme.copyWith(
                                    decoration:
                                        defaultPinTheme.decoration!.copyWith(
                                      color: fillColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border:
                                          Border.all(color: focusedBorderColor),
                                    ),
                                  ),

                                  forceErrorState: state.otpError,
                                  errorPinTheme: defaultPinTheme.copyBorderWith(
                                    border: Border.all(color: Colors.redAccent),
                                  ),
                                  errorText: state.errorMessage,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: AppSpacing.a20,
                    child: Column(
                      children: [
                        24.gap,
                        CustomButton.primary(
                            enabled: state.otp.length == 4 && !state.loading,
                            loading: state.loading,
                            text: "Send",
                            onPressed: () {
                              context.mounted
                                  ? context
                                      .read<OtpBloc>()
                                      .add(const OtpSubmitEvent())
                                  : null;
                            }),
                        12.gap,
                        CustomButton.naked(
                            text: "Have not receive code?", onPressed: () {
                          context.mounted
                              ? context.read<OtpBloc>().add(const OtpResendEvent())
                              : null;
                        }),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

/// You, as a developer should implement this interface.
/// You can use any package to retrieve the SMS code. in this example we are using SmartAuth
class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(this.smartAuth);

  final SmartAuth smartAuth;

  @override
  Future<void> dispose() {
    return smartAuth.removeSmsRetrieverApiListener();
  }

  @override
  Future<String?> getSmsCode() async {
    final signature = await smartAuth.getAppSignature();
    debugPrint('App Signature: $signature');
    final res = await smartAuth.getSmsWithUserConsentApi();

    if (res.error != null) {
      debugPrint('Error: ${res.error}');
      return null;
    }
    return res.data?.code;
  }

  @override
  bool get listenForMultipleSms => false;
}
