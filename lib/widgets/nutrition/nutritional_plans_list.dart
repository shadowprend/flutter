/*
 * This file is part of wger Workout Manager <https://github.com/wger-project>.
 * Copyright (C) 2020 wger Team
 *
 * wger Workout Manager is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * wger Workout Manager is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wger/providers/nutrition.dart';
import 'package:wger/screens/nutritional_plan_screen.dart';

class NutritionalPlansList extends StatelessWidget {
  Nutrition _nutritrionProvider;
  NutritionalPlansList(this._nutritrionProvider);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: _nutritrionProvider.items.length,
      itemBuilder: (context, index) {
        final currentPlan = _nutritrionProvider.items[index];
        return Dismissible(
          key: Key(currentPlan.id.toString()),
          onDismissed: (direction) {
            // Delete workout from DB
            _nutritrionProvider.deletePlan(currentPlan.id);

            // and inform the user
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Nutritional plan ${currentPlan.id} deleted",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          background: Container(
            color: Theme.of(context).errorColor,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            margin: EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          direction: DismissDirection.endToStart,
          child: Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  NutritionalPlanScreen.routeName,
                  arguments: currentPlan,
                );
              },
              title: Text(currentPlan.description),
              subtitle: Text(DateFormat.yMd().format(currentPlan.creationDate)),
            ),
          ),
        );
      },
    );
  }
}
