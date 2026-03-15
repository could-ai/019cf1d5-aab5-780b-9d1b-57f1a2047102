import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Research Poster',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)), // Dark Blue theme
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PosterScreen(),
      },
    );
  }
}

class PosterScreen extends StatelessWidget {
  const PosterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Digital Research Poster'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.zoom_in),
            tooltip: 'Zoom In',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pinch or scroll to zoom in the interactive viewer!')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: 'Export Poster',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Export to PDF functionality coming soon!')),
              );
            },
          )
        ],
      ),
      // InteractiveViewer allows panning and zooming around the large poster
      body: Center(
        child: InteractiveViewer(
          minScale: 0.1,
          maxScale: 5.0,
          constrained: false, // Allows the child to be larger than the screen
          boundaryMargin: const EdgeInsets.all(100),
          child: Container(
            width: 2400, // Standard large poster width
            height: 1600, // Standard large poster height
            color: Colors.white,
            padding: const EdgeInsets.all(48.0),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 48),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column (Abstract, Intro, Methods)
                      Expanded(child: _buildLeftColumn()),
                      const SizedBox(width: 48),
                      // Middle Column (Results, Charts) - Made wider for emphasis
                      Expanded(flex: 2, child: _buildMiddleColumn()),
                      const SizedBox(width: 48),
                      // Right Column (Discussion, Conclusion, Refs)
                      Expanded(child: _buildRightColumn()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: const Color(0xFF0D47A1), // Deep blue header
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Logo Placeholder
          Container(
            width: 180,
            height: 180,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.school, size: 100, color: Color(0xFF0D47A1)),
            ),
          ),
          const SizedBox(width: 64),
          // Title and Authors
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Title of the Research Project Goes Here',
                  style: TextStyle(
                    fontSize: 72, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Author One, Author Two, Author Three',
                  style: TextStyle(
                    fontSize: 36, 
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Department of Computer Science, University of Technology',
                  style: TextStyle(
                    fontSize: 28, 
                    color: Colors.white.withOpacity(0.8),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 64),
          // Right Logo Placeholder
          Container(
            width: 180,
            height: 180,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.science, size: 100, color: Color(0xFF0D47A1)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      children: [
        _buildSection(
          'Abstract', 
          'This is the abstract section. It provides a brief summary of the research, including the problem statement, methodology, results, and conclusion. Keep it concise and engaging to draw readers in.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
        ),
        const SizedBox(height: 40),
        _buildSection(
          'Introduction', 
          'The introduction sets the context for the research. It explains the background, the significance of the problem, and the objectives of the study.\n\nKey Objectives:\n1. First primary objective of the study\n2. Second supporting objective\n3. Third exploratory objective\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
        ),
        const SizedBox(height: 40),
        _buildSection(
          'Methodology', 
          'Describe the methods used to conduct the research. This might include experimental design, data collection procedures, and analytical techniques.\n\n• Data Source A: 10,000 samples\n• Data Source B: Qualitative interviews\n• Statistical Analysis: ANOVA and Regression models\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
        ),
      ],
    );
  }

  Widget _buildMiddleColumn() {
    return Column(
      children: [
        _buildSection(
          'Results & Findings', 
          'Present the main findings of your research here. Use charts, graphs, and images to make the data easy to understand at a glance. The visual hierarchy should draw the eye to the most important data first.', 
          isLarge: true
        ),
        const SizedBox(height: 40),
        // Large Primary Chart Placeholder
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.grey[300]!, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bar_chart, size: 250, color: Colors.blue[400]),
                const SizedBox(height: 32),
                Text(
                  'Figure 1: Primary Data Visualization showing significant trends', 
                  style: TextStyle(fontSize: 24, color: Colors.grey[700], fontStyle: FontStyle.italic)
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),
        // Secondary Charts Row
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey[300]!, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.pie_chart, size: 150, color: Colors.green[400]),
                      const SizedBox(height: 16),
                      Text('Fig 2: Distribution', style: TextStyle(fontSize: 20, color: Colors.grey[700])),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey[300]!, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.show_chart, size: 150, color: Colors.red[400]),
                      const SizedBox(height: 16),
                      Text('Fig 3: Growth Rate', style: TextStyle(fontSize: 20, color: Colors.grey[700])),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRightColumn() {
    return Column(
      children: [
        _buildSection(
          'Discussion', 
          'Interpret the results and explain their significance. How do they compare to previous research? What are the implications?\n\nOur findings suggest that the initial hypothesis was correct, demonstrating a strong correlation between the variables tested. This aligns with previous literature while offering new insights into edge cases.'
        ),
        const SizedBox(height: 40),
        _buildSection(
          'Conclusion', 
          'Summarize the main takeaways from the research. What are the next steps or future directions for this work?\n\nIn conclusion, this study provides a robust framework for understanding the phenomenon. Future research should focus on longitudinal studies to verify these results over time.'
        ),
        const SizedBox(height: 40),
        _buildSection(
          'References', 
          '[1] Smith, J. et al. (2023). Advanced methodologies in modern research. Journal of Science, 45(2), 112-125.\n\n[2] Doe, A. (2022). Comprehensive data analysis techniques. Academic Press.\n\n[3] Johnson, M. (2023). A review of recent literature. Annual Conference Proceedings, 89-104.', 
          isSmall: true
        ),
        const SizedBox(height: 40),
        _buildSection(
          'Acknowledgements', 
          'We would like to thank the National Science Foundation for funding this research (Grant #12345). Special thanks to the university lab staff for their technical support.', 
          isSmall: true
        ),
      ],
    );
  }

  Widget _buildSection(String title, String content, {bool isLarge = false, bool isSmall = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.blue[100]!, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isLarge ? 48 : 36,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0D47A1),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 4,
            width: 80,
            color: Colors.orange[400], // Accent color for dividers
          ),
          const SizedBox(height: 24),
          Text(
            content,
            style: TextStyle(
              fontSize: isSmall ? 20 : 26,
              height: 1.6,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
