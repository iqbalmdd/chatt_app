import 'package:chatt_app/components/floating_card.dart';
import 'package:flutter/material.dart';

class ContributionSection extends StatefulWidget {
  final List<String> contributions;

  const ContributionSection({super.key, required this.contributions});

  @override
  _ContributionSectionState createState() => _ContributionSectionState();
}

class _ContributionSectionState extends State<ContributionSection> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < widget.contributions.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // PageView untuk Contributions Card
        SizedBox(
          height: 140,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.contributions.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return ContributionCard(text: widget.contributions[index]);
            },
          ),
        ),

        // Tombol Panah Kiri
        Positioned(
          left: 0,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 24, color: Colors.white),
            onPressed: _prevPage,
          ),
        ),

        // Tombol Panah Kanan
        Positioned(
          right: 0,
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios, size: 24, color: Colors.white),
            onPressed: _nextPage,
          ),
        ),
      ],
    );
  }
}

// Component Card
class ContributionCard extends StatelessWidget {
  final String text;

  const ContributionCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: FloatingCard(
        child: InkWell(
          onTap: () => _showFullTextDialog(context, text),
          child: Text(
            text,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }

  void _showFullTextDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: Text(
            text,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            textAlign: TextAlign.justify,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}

