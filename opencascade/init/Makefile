CXXFLAGS += -I/usr/local/include/opencascade
LDFLAGS += -lglfw -lTKOpenGl -lTKService -lTKernel -lTKStd -lTKV3d -lTKTopAlgo -lTKPrim
NAME = prog

all:
	g++ -o $(NAME) main.cpp GlfwOcctView.cpp GlfwOcctWindow.cpp  $(CXXFLAGS) $(LDFLAGS) 

clean:
	rm $(NAME)


