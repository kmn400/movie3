import 'package:flutter/material.dart';
import 'package:movie3/ui/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // List<Results> _movies = [];

  // final _api = MovieApi();
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchViewModel>().showResult();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();

    return Scaffold(
      backgroundColor: Colors.tealAccent[60],
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[100],
        title: const Text('영화 정보 검색기'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  viewModel.searchWithQuery(_textEditingController.text);
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 1,
                    children:
                        // _movies
                        viewModel.searchMovies
                            .map((e) => Image.network(
                                'https://image.tmdb.org/t/p/w500' +
                                    e.posterPath))
                            .toList(),
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
