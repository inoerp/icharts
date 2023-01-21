// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

typedef Widget GalleryWidgetBuilder();

/// Helper to build gallery.
class GalleryScaffold extends StatefulWidget {
  /// The widget used for leading in a [ListTile].
  final Widget listTileIcon;
  final String title;
  final String subtitle;
  final GalleryWidgetBuilder childBuilder;
  final String? snippetUrl;

  const GalleryScaffold({
    required this.listTileIcon,
    required this.title,
    required this.subtitle,
    required this.childBuilder,
    this.snippetUrl,
  });

  /// Gets the gallery
  Widget buildGalleryListTile(BuildContext context) => ListTile(
      leading: listTileIcon,
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => this));
      });

  @override
  _GalleryScaffoldState createState() => _GalleryScaffoldState();
}

class _GalleryScaffoldState extends State<GalleryScaffold> {
  void _handleButtonPress() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String sourceSnippetUrl = widget.snippetUrl ?? 'https://github.com/inoerp/icharts/tree/master/charts_flutter/example/lib';
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              SizedBox(
                height: 250.0,
                child: widget.childBuilder(),
              ),
              TextField( controller: TextEditingController(text: 'Source snippet : $sourceSnippetUrl'),),
            ]),
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: _handleButtonPress, child: const Icon(Icons.refresh)),
    );
  }
}
