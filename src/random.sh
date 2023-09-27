#!/bin/bash

# Определите имя файла
output_file="numbers.txt"

# Удаляем файл, если он уже существует
rm -f "$output_file"

# Генерируем 150 рандомных чисел и записываем их в файл
for i in {1..150}; do
    random_number=$(od -An -N2 -i /dev/random | awk '{print $1}')
    echo "$random_number" >> "$output_file"
done

# Выводим сообщение об успешном завершении
echo "Создан файл $output_file с 150 рандомными числами."
