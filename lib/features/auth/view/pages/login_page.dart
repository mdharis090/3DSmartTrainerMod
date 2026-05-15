// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import '../../controller/auth_controller.dart';
// import '../../../../core/router/app_router.dart';
// import '../../../../core/utils/validators.dart';
// import '../../../../core/utils/extensions.dart';

// class LoginPage extends ConsumerStatefulWidget {
//   const LoginPage({super.key});

//   @override
//   ConsumerState<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends ConsumerState<LoginPage> {
//   final _formKey    = GlobalKey<FormState>();
//   final _emailCtrl  = TextEditingController();
//   final _passCtrl   = TextEditingController();
//   bool  _obscure    = true;

//   @override
//   void dispose() {
//     _emailCtrl.dispose();
//     _passCtrl.dispose();
//     super.dispose();
//   }

//   Future<void> _submit() async {
//     if (!_formKey.currentState!.validate()) return;
//     final success = await ref.read(authControllerProvider.notifier)
//         .login(_emailCtrl.text.trim(), _passCtrl.text);
//     if (success && mounted) context.go(Routes.home);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(authControllerProvider);

//     // Show error snackbar when error changes
//     ref.listen<AuthState>(authControllerProvider, (prev, next) {
//       if (next.error != null && next.error != prev?.error) {
//         context.showSnackBar(next.error!, isError: true);
//       }
//     });

//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Text('Welcome Back 👋',
//                       style: context.textTheme.headlineMedium?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       )),
//                   8.h,
//                   Text('Sign in to continue',
//                       style: context.textTheme.bodyMedium
//                           ?.copyWith(color: Colors.grey)),
//                   32.h,
//                   TextFormField(
//                     controller: _emailCtrl,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: const InputDecoration(
//                       labelText: 'Email',
//                       prefixIcon: Icon(Icons.email_outlined),
//                     ),
//                     validator: Validators.email,
//                   ),
//                   16.h,
//                   TextFormField(
//                     controller: _passCtrl,
//                     obscureText: _obscure,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       prefixIcon: const Icon(Icons.lock_outlined),
//                       suffixIcon: IconButton(
//                         icon: Icon(_obscure
//                             ? Icons.visibility_outlined
//                             : Icons.visibility_off_outlined),
//                         onPressed: () => setState(() => _obscure = !_obscure),
//                       ),
//                     ),
//                     validator: Validators.password,
//                   ),
//                   24.h,
//                   ElevatedButton(
//                     onPressed: state.isLoading ? null : _submit,
//                     child: state.isLoading
//                         ? const SizedBox.square(
//                             dimension: 20,
//                             child: CircularProgressIndicator(strokeWidth: 2))
//                         : const Text('Login'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transformationtracker/core/constants/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const Text('Train Up',style: TextStyle(fontSize: 18,color: AppColors.black),),
          const Center(
            child: Image(image: AssetImage('icon.png'),height: 100,width: 100,color: AppColors.background1,),
          ),
          _loginTextFields(
            title: 'Email',
             hintText: 'Enter your email',
             controller: TextEditingController(),
             obscureText: false,
             isNumber: false,
          ),
        ],
      ),
    );
  }
}

 Widget _loginTextFields({
  
    required String title,
    required String hintText,
    required TextEditingController controller,
    bool isPassword = false,
    bool isNumber = false,
    bool obscureText = false,
    VoidCallback? onTogglePassword,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          style: GoogleFonts.inter(
            fontSize: 14,
          ),
          cursorColor: AppColors.primary,
          controller: controller,
          obscureText: obscureText,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          inputFormatters:
              isNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.background,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.bordergray,
                width: 1.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            
              borderSide: const BorderSide(
                color: AppColors.bordergray,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.bordergray,
                width: 1.0,
              ),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.icons,
                    ),
                    onPressed: onTogglePassword,
                  )
                : null,
          ),
        ),
      ],
    );
  }
