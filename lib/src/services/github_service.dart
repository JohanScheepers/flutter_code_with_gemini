import 'dart:convert';
import 'package:http/http.dart' as http;

/// A service class for interacting with the GitHub API.
class GithubService {
  final String _baseUrl = 'https://api.github.com';

  /// Performs a GET request to the specified [endpoint] and returns the decoded JSON.
  ///
  /// Throws an [Exception] if the request fails or the response status code
  /// is not 200.
  Future<Map<String, dynamic>> _getRequest(String endpoint) async {
    final Uri url = Uri.parse('$_baseUrl/$endpoint');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception(
            'Failed to load data from $url (Status code: ${response.statusCode})');
      }
    } catch (e) {
      // Rethrowing the exception to be handled by the caller.
      // You could also implement more specific error handling or logging here.
      throw Exception('Failed to connect to the API: $e');
    }
  }

  /// Fetches repository statistics for a given [owner] and [repoName].
  ///
  /// Returns a `Map<String, dynamic>` containing the repository stats.
  /// Throws an [Exception] if the API call fails.
  Future<Map<String, dynamic>> fetchRepositoryStats(
      String owner, String repoName) async {
    if (owner.isEmpty || repoName.isEmpty) {
      throw ArgumentError('Owner and repository name cannot be empty.');
    }
    final String endpoint = 'repos/$owner/$repoName';
    return _getRequest(endpoint);
  }
}
