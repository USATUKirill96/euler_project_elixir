# EulerProject

Решение задач Проекта Эйлера с применением функциональной парадигмы языка Elixir

# Запуск кода:
Все модули с решениями реализуют интерфейс `execute /1` для выполнения алгоритма. Подробнее для каждого модуля в документации

# Генерация и просмотр документации
1. Выполните команду `mix deps.get` для получения ExDoc + Earmark
1. Выполните команду `mix docs` для генерации документации
1. Откройте документ `doc/index.html` для просмотра

# Тестирование
Для каждой задачи имеются доктесты, чтобы запустить их введите команду `mix test`

# Решенные задачи:
1. [Числа, кратные 3 или 5](lib/euler_project/problem_1.ex)
1. [Четные числа Фибоначчи](lib/euler_project/problem_2.ex)