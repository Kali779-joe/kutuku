import 'package:flutter/material.dart';

class ForgetBottomSheet extends StatefulWidget {
  final VoidCallback onContinue;

  const ForgetBottomSheet({super.key, required this.onContinue});

  @override
  _ForgetBottomSheetState createState() => _ForgetBottomSheetState();
}

class _ForgetBottomSheetState extends State<ForgetBottomSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    _scale = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _controller.forward(); // play intro animation
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    super.dispose();
  }

  final TextEditingController _emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _submitted = true;

  void _submittingLoginForm() {
    setState(() {
      _submitted = true;
    });
    if (_formkey.currentState!.validate()) {
      //context.goNamed(AppRouter.signup);
    } else {
      print('Form validation failed');
    }
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print('Email: ${_emailController.text}');
    } else {
      print('Form validation failed');
    }
  }

  String? _validateEmail(String? value) {
    if (!_submitted) return null;
    //validate until form is submitted
    if (value == null || value.isEmpty) return "Email is required";
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid Email';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(24, 20, 24, 20 + bottomPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ScaleTransition(
            scale: _scale,
            child: Container(
              width: 86,
              height: 86,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, size: 54, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Forget Password',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  validator: _validateEmail,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: "Enter your email",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.indigo,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: widget.onContinue,
                    child: const Text('Send Code'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
