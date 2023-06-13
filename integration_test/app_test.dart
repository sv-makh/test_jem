import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';

import 'package:test_jem/main.dart' as app;
import 'package:test_jem/ui/helpers/custom_icons_icons.dart';
import 'package:test_jem/ui/screens/dish_dialog_screen.dart';
import 'package:test_jem/ui/screens/dishes_screen.dart';
import 'package:test_jem/ui/screens/shopping_cart_screen.dart';
import 'package:test_jem/ui/widgets/categories_screen/categories_item.dart';
import 'package:test_jem/ui/widgets/custom_text_button.dart';
import 'package:test_jem/ui/widgets/dishes_screen/dishes_item.dart';
import 'package:test_jem/ui/widgets/shopping_cart_screen/cart_item.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  group('integration test', () {
    testWidgets('tap category, tap dish, add dish to cart, go to cart',
        (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();
      await widgetTester.pump(const Duration(seconds: 20));

      //должно быть 4 кнопки с категориями
      var categories = find.byType(CategoriesItem);
      expect(categories, findsNWidgets(4));

      //нажимаем на первую категорию
      var categoryToTap = find.byWidget(categories.evaluate().first.widget);
      expect(categoryToTap, findsOneWidget);
      await widgetTester.tap(categoryToTap);
      await widgetTester.pumpAndSettle();
      await widgetTester.pump(const Duration(seconds: 15));

      //должен открыться экран с блюдами
      expect(find.byType(DishesScreen), findsOneWidget);
      var dishes = find.byType(DishesItem);
      //12 блюд
      expect(dishes, findsNWidgets(12));

      //нажимаем на первое блюдо
      var dishToTap = find.byWidget(dishes.evaluate().first.widget);
      await widgetTester.tap(dishToTap);
      await widgetTester.pumpAndSettle();
      await widgetTester.pump(const Duration(seconds: 10));

      //должна открыться карточка с блюдом
      expect(find.byType(DishDialogScreen), findsOneWidget);

      //нажимаем на кнопку добавления в корзину
      await widgetTester.tap(find.byType(CustomTextButton));
      await widgetTester.pumpAndSettle();

      //нажимаем на закрытие карточки блюда
      await widgetTester.tap(find.byIcon(Icons.close));
      await widgetTester.pumpAndSettle();
      await widgetTester.pump(const Duration(seconds: 2));

      //переходим в корзину
      await widgetTester.tap(find.text('Корзина'));
      await widgetTester.pumpAndSettle();
      await widgetTester.pump(const Duration(seconds: 2));

      //экран корзины, одна блюдо в корзине
      expect(find.byType(ShoppingCartScreen), findsOneWidget);
      expect(find.byType(CartItem), findsOneWidget);
      expect(find.text('1'), findsOneWidget);

      //нажимаем на увеличение колическва блюд
      await widgetTester.tap(find.byIcon(Icons.add));
      await widgetTester.pumpAndSettle();
      //должно стать 2
      expect(find.text('2'), findsOneWidget);
      await widgetTester.pump(const Duration(seconds: 2));

      //дважды нажимаем на уменьшение количества блюда
      await widgetTester.tap(find.byIcon(Icons.remove));
      await widgetTester.pumpAndSettle();
      await widgetTester.pump(const Duration(seconds: 2));
      expect(find.text('1'), findsOneWidget);
      await widgetTester.tap(find.byIcon(Icons.remove));
      await widgetTester.pumpAndSettle();
      await widgetTester.pump(const Duration(seconds: 2));

      //блюдо должно исчезнуть из корзины
      expect(find.byType(CartItem), findsNothing);

      //переходим обратно на главный экран
      await widgetTester.tap(find.text('Главная'));
      await widgetTester.pumpAndSettle();
      await widgetTester.pump(const Duration(seconds: 2));

      //нажимаем на тег С рыбой
      await widgetTester.tap(find.text('С рыбой'));
      await widgetTester.pumpAndSettle();
      await widgetTester.pump(const Duration(seconds: 3));
      //должно остаться 2 блюда
      expect(find.byType(DishesItem), findsNWidgets(2));

      //нажимаем на тег Все меню
      await widgetTester.tap(find.text('Все меню'));
      await widgetTester.pumpAndSettle();
      await widgetTester.pump(const Duration(seconds: 3));
      //12 блюд
      expect(find.byType(DishesItem), findsNWidgets(12));
    });
  });
}
