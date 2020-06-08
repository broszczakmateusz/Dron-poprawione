#
#  To sa opcje dla kompilacji
#
CPPFLAGS= -c -g -Iinc -Wall -pedantic -std=c++17

dron: obj/main.o obj/PlikSWektor.o obj/PlikSMacierz.o obj/Bryla.o obj/Dno.o obj/Dron.o obj/MObrotu.o obj/Prostopadloscian.o obj/Przeszkoda_Prost.o obj/Sruba.o obj/Dr3D_gnuplot_api.o
	g++ -Wall -pedantic -o dron obj/main.o obj/PlikSWektor.o obj/PlikSMacierz.o obj/Bryla.o obj/Dno.o obj/Dron.o obj/MObrotu.o obj/Prostopadloscian.o obj/Przeszkoda_Prost.o obj/Sruba.o Dr3D_gnuplot_api.o

obj/main.o: src/main.cpp inc/SWektor.h inc/rozmiar.h inc/Dr3D_gnuplot_api.hh inc/Dron.h inc/Dno.h inc/Woda.h inc/Przeszkoda_Prost.h
	g++ $ -c -g -Wall -pedantic -std=c++17 -o obj/main.o src/main.cpp



obj/PlikSMacierz.o: src/PlikSMacierz.cpp inc/SMacierz.h inc/rozmiar.h
	g++ ${CPPFLAGS} -o obj/PlikSMacierz.o src/PlikSMacierz.cpp

obj/PlikSWektor.o: src/PlikSWektor.cpp inc/SWektor.h inc/rozmiar.h inc/Dr3D_gnuplot_api.hh
	g++ ${CPPFLAGS} -o obj/PlikSWektor.o src/PlikSWektor.cpp

obj/Bryla.o: src/Bryla.cpp inc/Bryla.h inc/SWektor.h inc/SMacierz.h inc/MObrotu.h inc/Rysuj_interfejs.h
	g++ ${CPPFLAGS} -o obj/Bryla.o src/Bryla.cpp

obj/Dno.o: src/Dno.cpp inc/Dno.h inc/Powierzchnia.h inc/SWektor.h inc/Rysuj_interfejs.h inc/Przeszkoda.h
	g++ ${CPPFLAGS} -o obj/Dno.o src/Dno.cpp

obj/Dron.o: src/Dron.cpp inc/Dron.h inc/SWektor.h inc/SMacierz.h inc/MObrotu.h inc/Dron_interfejs.h inc/Prostopadloscian.h inc/Sruba.h inc/Przeszkoda.h
	g++ ${CPPFLAGS} -o obj/Dron.o src/Dron.cpp

obj/MObrotu.o: src/MObrotu.cpp inc/MObrotu.h inc/SMacierz.h
	g++ ${CPPFLAGS} -o obj/MObrotu.o src/MObrotu.cpp

obj/Prostopadloscian.o: src/Prostopadloscian.cpp inc/Prostopadloscian.h inc/SMacierz.h inc/MObrotu.h inc/Bryla.h inc/Draw3D_api_interface.hh
	g++ ${CPPFLAGS} -o obj/Prostopadloscian.o src/Prostopadloscian.cpp

obj/Przeszkoda_Prost.o: src/Przeszkoda_Prost.cpp inc/Przeszkoda_Prost.h inc/Prostopadloscian.h inc/Przeszkoda.h
	g++ ${CPPFLAGS} -o obj/Przeszkoda_Prost.o src/Przeszkoda_Prost.cpp

obj/Sruba.o: src/Sruba.cpp inc/Sruba.h inc/Bryla.h
	g++ ${CPPFLAGS} -o obj/Sruba.o src/Sruba.cpp

obj/Woda.o: src/Woda.cpp inc/Woda.h inc/Powierzchnia.h
	g++ ${CPPFLAGS} -o obj/Woda.o src/Woda.cpp

obj/Dr3D_gnuplot_api.o: src/Dr3D_gnuplot_api.cpp inc/Dr3D_gnuplot_api.hh
	g++ $ -c -g -Wall -pedantic -std=c++17 -o obj/Dr3D_gnuplot_api.o src/Dr3D_gnuplot_api.cpp

inc/Dr3D_gnuplot_api.hh: inc/Draw3D_api_interface.hh
	touch inc/Dr3D_gnuplot_api.hh
clean:
	rm -f obj/*.o dronx

