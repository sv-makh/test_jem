# test_jem

## Экраны из ТЗ

экран 1 (): 
экран 2 ():
экран 3 ():
экран 4 ():

## Прочее

### Структура проекта

### Навигация
Используется Navigator 1.0.
Для каждой вкладки у виджета BottomNavigationBar ([custom_bottom_nav_bar.dart](lib/ui/widgets/custom_bottom_nav_bar.dart)) создаётся свой навигатор TabNavigator ([tab_navigator.dart](lib/ui/widgets/tab_navigator.dart)). Собственно создание этих навигаторов - [app.dart](lib/ui/screens/app.dart). 
Т.о. обеспечивается независимая навигация на вкладках, и при этом BottomNavigationBar остаётся постоянно на экране.