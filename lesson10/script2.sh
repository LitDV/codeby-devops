#! /bin/bash


#script2.sh

echo "Проверяем директорию myfolder"
dir=myfolder
if [ -d "$dir" ]
	then echo "Директория найдена, работаем"
		cd ./$dir
		ls -l ./*.* | wc -l > num
		echo "Количество файлов в директории:"
		cat num 
		 rm num

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
				sed -i '2,$d' $datafiles
			done
		else 
			echo "Скрипт уже отрабатывал эту директорию, запустите script1.sh"
		fi

	echo " Обработка завершена"


	else echo "Директории нет, запустите script1.sh"
fi
