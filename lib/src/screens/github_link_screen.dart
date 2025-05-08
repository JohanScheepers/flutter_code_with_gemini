import 'package:flutter/material.dart';
import 'package:flutter_code_with_gemini/src/constants/ui_constants.dart'; // Corrected import path
import 'package:flutter_code_with_gemini/src/services/github_service.dart'; // Import the service
import 'package:flutter_code_with_gemini/src/constants/app_constants.dart'; // Import AppConstants
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart'; // Import for date formatting

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

  late TextEditingController _ownerController;
  late TextEditingController _repoController;

  Map<String, dynamic>? _repoStats;
  bool _isLoading = true;
  String? _errorMessage;

  final GithubService _githubService =
      GithubService(); // Instantiate the service
  @override
  void initState() {
    super.initState();
    _ownerController = TextEditingController(text: AppConstants.kGithubOwner);
    _repoController = TextEditingController(text: AppConstants.kGithubRepoName);

    _updateGithubProjectUrl(); // Initialize with default values
    _fetchRepoStats();
  }

  @override
  void dispose() {
    _ownerController.dispose();
    _repoController.dispose();
    super.dispose();
  }

  void _updateGithubProjectUrl() {
    _githubProjectUrl =
        'https://github.com/${_ownerController.text}/${_repoController.text}';
  }

  Future<void> _launchGithubUrl() async {
    _updateGithubProjectUrl(); // Ensure URL is up-to-date with controller values
    final Uri url = Uri.parse(_githubProjectUrl); // Use the updated URL
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $_githubProjectUrl')),
        );
      }
    }
  }

  Future<void> _launchGithubIssuesUrl() async {
    _updateGithubProjectUrl(); // Ensure URL is up-to-date
    final Uri url = Uri.parse(
        '$_githubProjectUrl${AppConstants.kGithubIssuesPath}'); // Use the updated URL
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
      padding: EdgeInsets.symmetric(vertical: smallPadding.top), // Was kVerticalPaddingSmall (symmetric vertical 8.0)
      child: Row(
        children: [
          Icon(icon,
              color: Theme.of(context).colorScheme.primary,
              size: smallIconSize + xlabelSmallSize), // Was kIconSizeSmall + 2 (20.0), now smallIconSize (16) + xlabelSmallSize (4) = 20.0
          xxsmallHGap, // Was kHorizontalSpacerSmall (8.0), now xxsmallHGap (8.0)
          Flexible(
            // Wrap label text
            fit: FlexFit
                .tight, // Ensure label takes available space before Spacer
            child: Text(
              '$label:',
              style: labelMedium.copyWith(fontWeight: FontWeight.w500), // Used labelMedium (fontSize 16)
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          Flexible(
            // Wrap value text
            child: Text(
              value?.toString() ?? 'N/A',
              style: labelMedium, // Used labelMedium (fontSize 16)
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) {
      return 'N/A';
    }
    try {
      final DateTime dateTime = DateTime.parse(dateTimeString);
      return DateFormat.yMMMd()
          .add_jm()
          .format(dateTime); // e.g., May 7, 2025, 9:36 AM
    } catch (e) {
      return 'Invalid Date';
    }
  }

  Widget _buildStatsContentWidget() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: smallPadding, // Was kCardPadding (8.0), now smallPadding (8.0)
          child: Text(
            'Error fetching stats: $_errorMessage',
            style: labelMedium.copyWith(color: Colors.red), // Used labelMedium (fontSize 16)
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else if (_repoStats != null) {
      return Card(
        elevation: 2.0, // No direct 2.0 elevation in "Use these" section. Kept literal.
        margin: EdgeInsets.symmetric(vertical: smallPadding.top), // Was kVerticalPaddingSmall (symmetric vertical 8.0)
        child: Padding(
          padding: mediumPadding, // Was kPagePadding (16.0), now mediumPadding (16.0)
          child: SingleChildScrollView(
            // Allow stats list to scroll if too long
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildStatRow(Icons.star_border, 'Stars',
                    _repoStats!['stargazers_count']),
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
                  _buildStatRow(
                      Icons.code, 'Language', _repoStats!['language']),
                _buildStatRow(Icons.update, 'Last Updated',
                    _formatDateTime(_repoStats!['updated_at'] as String?)),
                _buildStatRow(Icons.publish_outlined, 'Last Pushed',
                    _formatDateTime(_repoStats!['pushed_at'] as String?)),
              ],
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink(); // Should not happen if logic is correct
  }

  Widget _buildProjectInfoAndButtonColumn() {
    // Wrap the Column in SingleChildScrollView to prevent vertical overflow
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mediumPadding.left), // Was kHorizontalPaddingMedium (symmetric horizontal 16.0)
            child: TextField(
              controller: _ownerController,
              decoration: InputDecoration(
                labelText: 'GitHub Owner',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(smallRadius)), // Was kButtonBorderRadius (circular 24.0), now smallRadius (24.0)
              ),
            ),
          ),
          xxsmallVGap, // Was kVerticalSpacerMedium (16.0), now xxsmallVGap (16.0)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mediumPadding.left), // Was kHorizontalPaddingMedium (symmetric horizontal 16.0)
            child: TextField(
              controller: _repoController,
              decoration: InputDecoration(
                labelText: 'GitHub Repository Name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(smallRadius)), // Was kButtonBorderRadius (circular 24.0), now smallRadius (24.0)
              ),
            ),
          ),
          xxsmallVGap, // Was kVerticalSpacerMedium (16.0), now xxsmallVGap (16.0)
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _updateGithubProjectUrl(); // Update URL before fetching
              _fetchRepoStats();
            },
            label: const Text('Fetch Repository Stats'),
          ),
          xxsmallVGap, // Was kVerticalSpacerMedium (16.0), now xxsmallVGap (16.0)
          Text(
            'Current Project: ${_repoStats?['full_name'] ?? '${_ownerController.text}/${_repoController.text}'}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // No direct 20.0 font size in "Use these". Kept literal.
          ),
          smallVGap, // Was kVerticalSpacerLarge (24.0), now smallVGap (24.0)
          ElevatedButton.icon(
            icon: const Icon(Icons.open_in_browser),
            onPressed: _launchGithubUrl,
            label: const Text('Open Project on GitHub'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  vertical: xsmallRadius, horizontal: labelLargeSize), // vertical 12 (xsmallRadius), horizontal 24 (labelLargeSize)
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    // Wrap the main Column in SingleChildScrollView for vertical scrolling
    return SingleChildScrollView(
      child: Padding(
        padding: mediumPadding, // Was kPagePadding (16.0), now mediumPadding (16.0)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildProjectInfoAndButtonColumn(),
            xxsmallVGap, // Was kVerticalSpacerMedium (16.0), now xxsmallVGap (16.0)
            _buildStatsContentWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Padding(
      padding: largePadding, // Was EdgeInsets.all(kSpaceXLarge) (32.0), now largePadding (32.0)
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
              mediumHGap, // Was kHorizontalSpacerXLarge (32.0), now mediumHGap (32.0)
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
    if (mounted) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
    }
    try {
      _repoStats = await _githubService.fetchRepositoryStats(
          _ownerController.text, _repoController.text);
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
