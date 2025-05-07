import 'package:flutter/material.dart';
import 'package:flutter_code_with_gemini/src/services/github_service.dart'; // Import the service
import 'package:flutter_code_with_gemini/src/constants/app_constants.dart'; // Import constants
import 'package:url_launcher/url_launcher.dart';

class GithubLinkScreen extends StatefulWidget {


  const GithubLinkScreen({
    super.key,

  });

  @override
  State<GithubLinkScreen> createState() => _GithubLinkScreenState();
}

class _GithubLinkScreenState extends State<GithubLinkScreen> {
  static const double kBreakpoint = 600.0;
  late String _githubProjectUrl;

  Map<String, dynamic>? _repoStats;
  bool _isLoading = true;
  String? _errorMessage;

  final GithubService _githubService =
      GithubService(); // Instantiate the service
  @override
  void initState() {
    super.initState();
    _githubProjectUrl = 'https://github.com/$kGithubOwner/$kGithubRepoName';
    _fetchRepoStats();
  }

  Future<void> _launchGithubUrl() async {
    final Uri url = Uri.parse(_githubProjectUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $_githubProjectUrl')),
        );
      }
    }
  }

  Future<void> _launchGithubIssuesUrl() async {
    final Uri url = Uri.parse('$_githubProjectUrl/issues');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project GitHub Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < kBreakpoint) {
            return _buildNarrowLayout(context);
          } else {
            return _buildWideLayout(context);
          }
        },
      ),
    );
  }

  Widget _buildStatRow(IconData icon, String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 10),
          Text('$label:',
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(value?.toString() ?? 'N/A',
              style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildStatsContentWidget() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Error fetching stats: $_errorMessage',
            style: const TextStyle(color: Colors.red, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else if (_repoStats != null) {
      return Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Important for Card in Row
            children: [
              _buildStatRow(
                  Icons.star_border, 'Stars', _repoStats!['stargazers_count']),
              _buildStatRow(
                  Icons.call_split, 'Forks', _repoStats!['forks_count']),
              InkWell(
                onTap: _launchGithubIssuesUrl,
                child: _buildStatRow(Icons.bug_report_outlined, 'Open Issues',
                    _repoStats!['open_issues_count']),
              ),
              _buildStatRow(Icons.visibility_outlined, 'Watchers',
                  _repoStats!['subscribers_count']),
              if (_repoStats!['language'] != null)
                _buildStatRow(Icons.code, 'Language', _repoStats!['language']),
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink(); // Should not happen if logic is correct
  }

  Widget _buildProjectInfoAndButtonColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Project: ${_repoStats?['full_name'] ?? '$kGithubOwner/$kGithubRepoName'}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          icon: const Icon(Icons.open_in_browser),
          onPressed: _launchGithubUrl,
          label: const Text('Open Project on GitHub'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildProjectInfoAndButtonColumn(),
          const SizedBox(height: 20),
          _buildStatsContentWidget(),
        ],
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0), // More padding for wider screens
      child: Center(
        // Center the content if it doesn't fill the screen
        child: ConstrainedBox(
          // Limit max width of the content
          constraints:
              const BoxConstraints(maxWidth: 1000), // Example max width
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Align items vertically
            children: <Widget>[
              Expanded(
                flex: 2,
                child: _buildProjectInfoAndButtonColumn(),
              ),
              const SizedBox(width: 32), // Spacing between columns
              Expanded(
                flex: 3,
                child: _buildStatsContentWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchRepoStats() async {
    try {
      _repoStats = await _githubService.fetchRepositoryStats(
          kGithubOwner, kGithubRepoName);
    } catch (e) {
      _errorMessage =
          e.toString(); // Display the error message from the service
    }
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
