/// Author: Christian Juth
/// Date: 7/28/19
/// File: profile_module.dart
/// Summary:


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../module_config.dart';
import '../module_partials.dart';

class ProfileWidget extends StatelessWidget {

  // hard coded data is temporary
  // this should be removed
  final image = 'assets/me.jpeg';
  final title = 'Colin Walsh';
  final subtitle = 'Undergrad';

  @override
  Widget build(BuildContext context) {
    return ModuleContainer(
      child: Container(
        child: ListTile(
          onTap: null,
          leading: CircleAvatar(
              backgroundImage: AssetImage(this.image)
          ),
          title: Text(this.title),
          subtitle: Text(this.subtitle),
        )
      )
    );
  }
}

class ProfileCard extends StatelessWidget {

  // hard coded data is temporary
  // this should be removed
  final image = 'assets/me.jpeg';
  final title = 'Colin Walsh';
  final subtitle = 'Undergrad';

  @override
  Widget build(BuildContext context) {
    return ModuleContainer(
      child: ListTile(
        onTap: null,
        leading: CircleAvatar(
            backgroundImage: AssetImage(this.image)
        ),
        title: ModuleText(this.title),
        subtitle: ModuleText(this.subtitle),
      )
    );
  }
}
