#!/bin/bash
#можно прочитать значения из файла numbers.txt, если он существует
if [ -f "numbers.txt" ]; then
    numbers=($(cat numbers.txt))
fi

# Проверяем, что есть хотя бы одно число
if [ ${#numbers[@]} -eq 0 ]; then
    echo "No numbers provided or found in numbers.txt."
    exit 1
fi
# Объявляем переменные для суммы и количества аргументов
sum=0
count=0

# Проходим по всем аргументам (или числам из файла) и вычисляем сумму
for arg in "${numbers[@]}"; do
    sum=$((sum + arg))
    count=$((count + 1))
done

# Вычисляем среднее арифметическое
average=$(bc -l <<< "scale=2; $sum / $count")

# Выводим результат
echo "Количество аргументов (или чисел из файла): $count"
echo "Среднее арифметическое: $average"
