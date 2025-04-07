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
# Zadanie 6.
# Odnaleźć w katalogu `bbb` plik, którego zawartość pokrywa się z zawartością
# pliku `bardzo tajna treść` (jest on w katalogu `ddd`) i skopiować znaleziony
# plik do katalogu `ddd`, jeśli jeszcze go tam nie ma.
#
#
#
#
#!/bin/bash

# Odczytaj zawartość pliku 'bardzo tajna treść' i przypisz ją do zmiennej
tajna_tresc="ddd/bardzo tajna treść"

# Sprawdź, czy plik istnieje
if [ ! -f "$tajna_tresc" ]; then
    echo "Plik $tajna_tresc nie istnieje!"
    exit 1
fi

# Przeszukaj katalog 'bbb' w poszukiwaniu plików o takiej samej zawartości
for plik in $(find bbb -type f); do
    if cmp -s "$tajna_tresc" "$plik"; then  
        echo "Znaleziono plik: $plik"

        # Sprawdź, czy plik już istnieje w katalogu 'ddd'
        if [ ! -f "ddd/$(basename "$plik")" ]; then
            cp "$plik" ddd/
            echo "Skopiowano plik: $(basename "$plik")"
        else
            echo "Plik $(basename "$plik") już istnieje w katalogu ddd."
        fi
    fi
done

