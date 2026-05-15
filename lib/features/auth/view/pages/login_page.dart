import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transformationtracker/core/constants/app_color.dart';
import 'package:transformationtracker/core/utils/textstyle.dart';

class LoginScrren extends StatefulWidget {
  const LoginScrren({super.key});

  @override
  State<LoginScrren> createState() => _LoginScrrenState();
}

class _LoginScrrenState extends State<LoginScrren> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    bool isPasswordHidden = true;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
          
            children: [
              const SizedBox(height: 50),
          
                // Title
                Center(
                  child: Text(
                    'TrainUp',
                    style: GoogleFonts.inter(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
               const SizedBox(height: 23),

              // Logo
              Image.asset(
                'assets/icon.png',
                height: 90,
                width: 90,
                color: AppColors.background1
              ),
      _loginTextFields(title: 'Email', hintText: 'Enter the email', controller: emailController),
      
              const SizedBox(height: 20),

              // Password Field
              _loginTextFields(
                title: 'Password',
                hintText: 'Enter your password',
                controller: passwordController,
                isPassword: true,
                obscureText: isPasswordHidden,
                onTogglePassword: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
              ),
                 const SizedBox(height: 15),

//               // Remember + Forgot
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (v) {
                        setState(() {
                        
                          
                        });
                      }),
                      const Text("Remember Me"),
                    ],
                  ),
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColors.background1),
                  )
                ],
              ),

              const SizedBox(height: 20),
              
//               // Login Button
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.background1,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.background1.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Signup
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:transformationtracker/core/constants/app_color.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   bool isPasswordHidden = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 40),

//               // Title
//               Text(
//                 'TrainUp',
//                 style: GoogleFonts.inter(
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.black,
//                 ),
//               ),

//               const SizedBox(height: 10),

//               // Logo
//               Image.asset(
//                 'assets/icon.png',
//                 height: 90,
//                 width: 90,
//                 color: AppColors.primary,
//               ),

//               const SizedBox(height: 40),

//               // Email Field
//               _loginTextFields(
//                 title: 'Email',
//                 hintText: 'Enter your email',
//                 controller: emailController,
                
//               ),

//               const SizedBox(height: 20),

//               // Password Field
//               _loginTextFields(
//                 title: 'Password',
//                 hintText: 'Enter your password',
//                 controller: passwordController,
//                 isPassword: true,
//                 obscureText: isPasswordHidden,
//                 onTogglePassword: () {
//                   setState(() {
//                     isPasswordHidden = !isPasswordHidden;
//                   });
//                 },
//               ),

//               const SizedBox(height: 15),

//               // Remember + Forgot
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Checkbox(value: false, onChanged: (v) {}),
//                       const Text("Remember Me"),
//                     ],
//                   ),
//                   const Text(
//                     "Forgot Password?",
//                     style: TextStyle(color: AppColors.primary),
//                   )
//                 ],
//               ),

//               const SizedBox(height: 20),

//               // Login Button
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: AppColors.primary,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColors.primary.withOpacity(0.3),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     )
//                   ],
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Login",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Signup
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Don't have an account? "),
//                   Text(
//                     "Sign Up",
//                     style: TextStyle(
//                       color: AppColors.primary,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
            color: AppColors.black
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppColors.black
          ),
          cursorColor: AppColors.primary,
          controller: controller,
          obscureText: obscureText,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          inputFormatters:
              isNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
          decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white.withOpacity(0.05),
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
