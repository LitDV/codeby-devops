#! /bin/bash


#script2.sh

echo "Проверяем директорию myfolder"
dir=myfolder
if [ -d "$dir" ]
	then echo "Директория найдена, работаем"
		cd ./$dir || exit  #Выход в случае ошибки
#		ls -l ./*.* | wc -l > num
		dir_files=(*.*)
		echo "Количество файлов в директории:"
		echo ${#dir_files[@]} # Вывод количества файлов

		echo "Проверяем наличие пустых файлов"
		if [ -f ./2.txt ]
		then
			echo "Меняем права на второй файл"
			chmod 664 2.txt

			echo "Удаляем пустые файлы в текущей директории"
			find . -type f -empty -delete

			echo "В оставшихся файлах удаляем все строки, кроме первой"
			for datafiles in ./*.*
				do
				sed -i '2,$d' "$datafiles" 
			done
		else 
			echo "Скрипт уже отрабатывал эту директорию, запустите script1.sh"
		fi

	echo " Обработка завершена"


	else echo "Директории нет, запустите script1.sh"
fi
