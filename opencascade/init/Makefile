CXXFLAGS += -I/usr/local/include/opencascade
LDFLAGS += -L/usr/local/lib -lTKDraw
NAME = prog

all:
	g++ $(CXXFLAGS) -c main.cpp
	g++ -o $(NAME) main.o $(LDFLAGS)

clean:
	rm *.o $(NAME)


