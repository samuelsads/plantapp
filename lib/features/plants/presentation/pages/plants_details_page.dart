import 'package:flutter/material.dart';
import 'package:plant_app/core/theme/app_colors.dart';
import 'package:plant_app/features/plants/domain/entities/plants.dart';
import 'package:plant_app/features/plants/domain/entities/updates.dart';

/// Widget for the plant details page
class PlantDetailsPage extends StatelessWidget {
  /// Constructor for the plant details page
  const PlantDetailsPage({super.key, required this.plant});

  /// The plant to display
  final Plants plant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          _sliverAppBar(colors),
          _sliverBody(theme, colors),
        ],
      ),
    );
  }

  SliverToBoxAdapter _sliverBody(ThemeData theme, ColorScheme colors) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(theme, colors),
              const SizedBox(height: 8),
              _sellerInfo(theme),
              const SizedBox(height: 16),
              _arrivalDate(theme),
              const SizedBox(height: 24),
              Text(
                'Descripción',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                plant.description,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              if (plant.update.isNotEmpty) ...[
                Text(
                  'Historial de Cuidado',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                _buildUpdatesList(plant.update, theme, colors),
              ],
              const SizedBox(height: 40),
            ],
          ),
        ),
      );

  Row _arrivalDate(ThemeData theme) => Row(
        children: [
          const Icon(Icons.calendar_today, size: 16),
          const SizedBox(width: 4),
          Text(
            'Disponible desde: ${_formatDate(plant.arrivalDate)}',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      );

  Row _sellerInfo(ThemeData theme) => Row(
        children: [
          const Icon(Icons.store, size: 16),
          const SizedBox(width: 4),
          Text(
            'Vendido por ${plant.sellerName}',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      );

  Row _header(ThemeData theme, ColorScheme colors) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              plant.name,
              style: theme.textTheme.headlineLarge?.copyWith(
                color: colors.green,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: colors.green.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '\$${plant.price.toStringAsFixed(2)}',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: colors.green,
              ),
            ),
          ),
        ],
      );

  SliverAppBar _sliverAppBar(ColorScheme colors) => SliverAppBar(
        expandedHeight: 300,
        flexibleSpace: FlexibleSpaceBar(
          background: Hero(
            tag: 'plant-image-${plant.id}',
            child: Image.network(
              plant.photoUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => ColoredBox(
                color: colors.beige,
                child: const Icon(Icons.photo, size: 100),
              ),
            ),
          ),
        ),
      );

  Widget _buildUpdatesList(
          List<Updates> updates, ThemeData theme, ColorScheme colors) =>
      ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: updates.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final update = updates[index];
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: colors.green.withValues(alpha: 0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: colors.green.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _getUpdateIcon('riego'),
                        size: 16,
                        color: colors.green,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _getUpdateTitle('riego'),
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _formatDate(update.date),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.brown.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
                if (update.description.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    update.description,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ],
            ),
          );
        },
      );

  String _formatDate(DateTime date) => '${date.day}/${date.month}/${date.year}';

  IconData _getUpdateIcon(String type) {
    switch (type.toLowerCase()) {
      case 'riego':
        return Icons.opacity;
      case 'poda':
        return Icons.content_cut;
      case 'fertilizacion':
        return Icons.grass;
      default:
        return Icons.update;
    }
  }

  String _getUpdateTitle(String type) {
    switch (type.toLowerCase()) {
      case 'riego':
        return 'Riego realizado';
      case 'poda':
        return 'Poda realizada';
      case 'fertilizacion':
        return 'Fertilización aplicada';
      default:
        return type;
    }
  }
}
