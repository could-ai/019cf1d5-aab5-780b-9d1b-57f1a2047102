import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Research Presentation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PresentationScreen(),
      },
    );
  }
}

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 5;

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark background like a projector screen
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Research Presentation Deck',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  Text(
                    'Slide ${_currentPage + 1} of $_totalPages',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            
            // Presentation Area (16:9 Aspect Ratio)
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: [
                          _buildTitleSlide(),
                          _buildContentSlide(
                            title: '1. Introduction & Abstract',
                            content: '• Provide the background of the research here.\n\n• State the primary problem or hypothesis.\n\n• Explain why this research is significant to the field.\n\n• (Please share your guidelines so I can insert the exact text!)',
                            icon: Icons.lightbulb_outline,
                          ),
                          _buildContentSlide(
                            title: '2. Methodology',
                            content: '• Detail the research design and approach.\n\n• Describe the data collection methods (e.g., surveys, experiments, literature review).\n\n• Outline the analytical techniques used to process the data.',
                            icon: Icons.science_outlined,
                          ),
                          _buildVisualSlide(
                            title: '3. Results & Findings',
                            subtitle: 'Key Data Visualizations',
                          ),
                          _buildContentSlide(
                            title: '4. Conclusion & Next Steps',
                            content: '• Summarize the core findings of the study.\n\n• Discuss the implications of these results.\n\n• Suggest areas for future research and development.\n\n• Open the floor for Questions & Answers.',
                            icon: Icons.check_circle_outline,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            // Bottom Controls
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _currentPage > 0 ? _prevPage : null,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Previous'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    ),
                  ),
                  const SizedBox(width: 32),
                  ElevatedButton.icon(
                    onPressed: _currentPage < _totalPages - 1 ? _nextPage : null,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Next'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSlide() {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.school, size: 80, color: Color(0xFF1565C0)),
          const SizedBox(height: 32),
          const Text(
            'Research Project Title',
            style: TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0D47A1),
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Container(height: 4, width: 100, color: Colors.orange),
          const SizedBox(height: 24),
          const Text(
            'Author Name(s)',
            style: TextStyle(
              fontSize: 32,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Department / Institution Name\nDate of Presentation',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black54,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContentSlide({required String title, required String content, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 48, color: const Color(0xFF1565C0)),
              const SizedBox(width: 24),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D47A1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 2),
          const SizedBox(height: 32),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 28,
                height: 1.8,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisualSlide({required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0D47A1),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 2),
          const SizedBox(height: 24),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bar_chart, size: 120, color: Colors.blue[700]),
                        const SizedBox(height: 16),
                        Text('Data Chart 1', style: TextStyle(fontSize: 24, color: Colors.blue[900])),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.green[200]!),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pie_chart, size: 120, color: Colors.green[700]),
                        const SizedBox(height: 16),
                        Text('Data Chart 2', style: TextStyle(fontSize: 24, color: Colors.green[900])),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Text(
              subtitle,
              style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}
