import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/custom_clippers.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // Top Section (Header Image Placeholder)
            ClipPath(
              clipper: LoginHeaderClipper(),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/building_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Bottom Wave Decoration
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: LoginBottomClipper(),
                child: Container(
                  height: 150,
                  color: AppColors.primary,
                ),
              ),
            ),

            // Main Content content centering
             Positioned.fill(
              top: 250, // Start below the curve roughly
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                     // Logo (Overlapping)
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: const Icon(
                        Icons.local_library_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Email Input
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary, width: 2),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),

                    // Password Input
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        suffixIcon: Icon(Icons.visibility_off_outlined),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary, width: 2),
                        ),
                         enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 40),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Help Text
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          backgroundColor: Colors.white,
                          builder: (context) => const _HelpModalContent(),
                        );
                      },
                      child: const Text(
                        'Bantuan ?',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                    const SizedBox(height: 50), // Spacing for bottom wave
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HelpModalContent extends StatefulWidget {
  const _HelpModalContent({super.key});

  @override
  State<_HelpModalContent> createState() => _HelpModalContentState();
}

class _HelpModalContentState extends State<_HelpModalContent> {
  bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Language Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => isEnglish = false),
                    child: Column(
                      children: [
                         Container(
                          height: 20, width: 30, color: Colors.transparent, 
                          child: const Center(child: Text("🇮🇩", style: TextStyle(fontSize: 20))), 
                        ),
                        const SizedBox(height: 4),
                        Text('ID',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: !isEnglish ? Colors.black : Colors.grey)),
                        if (!isEnglish)
                          Container(height: 2, width: 20, color: AppColors.primary),
                      ],
                    ),
                  ),
                  const SizedBox(width: 32),
                  GestureDetector(
                    onTap: () => setState(() => isEnglish = true),
                    child: Column(
                      children: [
                        Container(
                          height: 20, width: 30, color: Colors.transparent, 
                          child: const Center(child: Text("🇬🇧", style: TextStyle(fontSize: 20))), 
                        ),
                        const SizedBox(height: 4),
                        Text('EN',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: isEnglish ? Colors.black : Colors.grey)),
                         if (isEnglish)
                          Container(height: 2, width: 20, color: AppColors.primary),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Content
              Text(
                isEnglish
                    ? 'Access only for Lecturers and Students of Telkom University.'
                    : 'Akses hanya untuk Dosen dan Mahasiswa Telkom University.',
                style: const TextStyle(fontSize: 13, height: 1.5),
              ),
              const SizedBox(height: 12),
              Text(
                isEnglish
                    ? 'Login using Microsoft Office 365 Account by following these instructions :'
                    : 'Login menggunakan Akun Microsoft Office 365 dengan mengikuti petunjuk berikut :',
                style: const TextStyle(fontSize: 13, height: 1.5),
              ),
              const SizedBox(height: 12),
              Text(
                isEnglish
                    ? 'Username (iGracias Account) added with "@365.telkomuniversity.ac.id"\nPassword (iGracias Account) in the Password field.'
                    : 'Username (Akun iGracias) ditambahkan "@365.telkomuniversity.ac.id"\nPassword (Akun iGracias) pada kolom Password.',
                style: const TextStyle(
                    fontSize: 13, height: 1.5, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              Text(
                isEnglish
                    ? 'Authentication failure is caused by:\nYou have not changed your Password to a "Strong Password".\nPlease ensure you have changed your Password in iGracias.'
                    : 'Kegagalan yang terjadi pada Autentikasi disebabkan oleh:\nAnda belum mengubah Password Anda menjadi "Strong Password".\nPastikan Anda telah melakukan perubahan Password di iGracias.',
                style: const TextStyle(fontSize: 13, height: 1.5),
              ),
              const SizedBox(height: 16),
              Text(
                isEnglish
                    ? 'For further information, please contact CeLOE Helpdesk Service at :'
                    : 'Informasi lebih lanjut dapat menghubungi Layanan CeLOE Helpdesk di :',
                style: const TextStyle(fontSize: 13, height: 1.5),
              ),
              const SizedBox(height: 12),
              const Text(
                'Mail : infoceloe@telkomuniversity.ac.id\nwhatsapp : +62 821-1666-3563',
                style:
                    TextStyle(fontSize: 13, height: 1.5, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
