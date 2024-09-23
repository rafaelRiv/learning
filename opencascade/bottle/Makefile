CXXFLAGS += -I/usr/local/include/opencascade
LDFLAGS += -lglfw -lTKOpenGl -lTKService -lTKernel -lTKStd -lTKV3d -lTKTopAlgo -lTKPrim -lTKGeomBase -lTKBRep -lTKMath -lTKFillet -lTKBO -lTKG3d -lTKOffset -lTKG2d
NAME = prog

all:
	g++ -o $(NAME) main.cpp GlfwOcctView.cpp GlfwOcctWindow.cpp Bottle.cpp  $(CXXFLAGS) $(LDFLAGS) 

clean:
	rm $(NAME)


