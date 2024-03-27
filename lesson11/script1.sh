#!/bin/bash

echo "Проверяем текущее состояние файлов"

dir=myfolder
if [ -d "$dir" ]
 then echo "Директория $dir существует"
      echo "Проверяем наличие пустого файла"
	if [ -f ./$dir/5.txt ]
		then echo "Файл на месте, script2.sh не работал"
		else echo "script2.sh поработал, исправляем..."
	 	 date >> ./$dir/1.txt
		 touch ./$dir/2.txt
		 chmod 777 ./$dir/2.txt

		 for File in 4 5
		  do touch ./$dir/$File.txt
		 done
	fi
 else 
	echo "Первый запуск"
	mkdir $dir 
	echo "Создана новая директория" $dir

	echo "Создаем файлы согласно заданию"
	cd ./$dir || { echo "Нет такой директории"; exit 1; } # Добавили выход из скрипта и уведомление об ошибке, если директорию удалят

	for File in 1 2 3 4 5 #Создаем 5 файлов
	 do
	  touch $File.txt
	if [[ "$File" == 1 ]] # В первом файле записываем приветствие и текущую дату/время
		then  
		 echo "Привет!" > $File.txt
		 date >> $File.txt
	fi
	if [[ "$File" == 2 ]] # Правим доступ во втором файле
		then
		 chmod 777 $File.txt
	fi
	if [[ "$File" == 3 ]] # записываем случайную последовательность из 20 символов в третий файл
                then
		tr -dc A-Za-z0-9 </dev/urandom | head -c 20 > $File.txt
		 
	fi

	done

fi
