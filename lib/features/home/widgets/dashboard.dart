import 'package:flutter/material.dart';
import 'package:saweha/core/theme/app_theme.dart';
import 'package:saweha/l10n/app_localizations.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.currentBalance,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.balanceDetails,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(width: 15),
                          Icon(Icons.insights_rounded, size: 24, color: Theme.of(context).colorScheme.primary),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "£7532.50",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      width: (MediaQuery.widthOf(context) - 90) / 2,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), border: Border.all(width: 2, color: AppTheme.primaryGreen), color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.arrow_downward_rounded, size: 24, color: AppTheme.primaryGreen),
                              Text(AppLocalizations.of(context)!.youAreOwed),
                            ],
                          ),
                          Text(
                            "£326.75",
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppTheme.primaryGreen),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: (MediaQuery.widthOf(context) - 90) / 2,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), border: Border.all(width: 2, color: AppTheme.dangerRed), color: AppTheme.dangerLightRed),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.arrow_upward_rounded, size: 24, color: AppTheme.dangerRed),
                              Text(AppLocalizations.of(context)!.youOwe),
                            ],
                          ),
                          Text(
                            "£125.50",
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppTheme.dangerRed),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
