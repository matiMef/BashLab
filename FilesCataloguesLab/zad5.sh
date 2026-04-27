#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 2 – semestr letni 2020/2021
#
# Celem zajęć jest nabranie doświadczenia w podstawowej pracy z powłoką Bash,
# w szczególności w nawigowaniu po drzewie katalogów i sprawdzaniu uprawnień.
#
# Przygotowane rozwiązania nie muszą być całkowicie uniwersalne. Zakładamy,
# że ogólna struktura katalogów się nie zmienia (nie będzie już więcej/mniej
# poziomów podkatalogów), jednakże same nazwy i zawartości plików (o ile
# nie są podane wprost w treści zadań) mogą być dowolne i ulegać zmianie,
# a przygotowane rozwiązania nadal powinny działać.
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 5.
# Utworzyć katalog o nazwie `głęboki` wewnątrz katalogu `ddd` i skopiować
# do niego wszystkie pliki zwyczajne (żadnych folderów!) znajdujące się
# w katalogu `bbb` i ewentualnych jego podkatalogach.
# Zakładamy, że katalog `głęboki` mógł już wcześniej istnieć – w takim
# przypadku nie należy tworzyć go na nowo, ale upewnić się, że podczas
# kopiowania nie nadpiszemy żadnych istniejących w nim plików!
#

folder="ddd/głęboki"

if [ ! -d "$folder" ]; then
	mkdir -p "$folder"
fi
for plik in "bbb"/*; do 
	if [ -f "$plik" ]; then
	        cp --update=none "$plik" "$folder"
        else
		if [ -d "$plik" ]; then
			for plik2 in "$plik"/*; do
		       	       echo "$plik2"	       
				if [ -f "$plik2" ]; then
					cp --update=none "$plik2" "$folder"
				fi
			done
		fi
	fi
done	


