SFML = -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio 
CC = g++
CFLAGS = -c
DEBUG = -g
objects = repulsions.o boidHelpingFunctions.o boids.o simulation.o main.o
all: FlockingBoids link

FlockingBoids: $(objects)

repulsions.o : FlockingBoids/src/repulsions.cpp FlockingBoids/src/repulsions.h
	$(CC) -IsfmlFiles/include $(CFLAGS) FlockingBoids/src/repulsions.cpp

boidHelpingFunctions.o : FlockingBoids/src/boidHelpingFunctions.cpp FlockingBoids/src/boidHelpingFunctions.h
	$(CC) -IsfmlFiles/include $(CFLAGS) FlockingBoids/src/boidHelpingFunctions.cpp

boids.o : FlockingBoids/src/boids.cpp FlockingBoids/src/boids.h
	$(CC) -IsfmlFiles/include $(CFLAGS) FlockingBoids/src/boids.cpp

simulation.o : FlockingBoids/src/simulation.cpp FlockingBoids/src/simulation.h
	$(CC) -IsfmlFiles/include $(CFLAGS) FlockingBoids/src/simulation.cpp

main.o : FlockingBoids/src/main.cpp 
	$(CC) -IsfmlFiles/include $(CFLAGS) FlockingBoids/src/main.cpp

link: 
	$(CC) $(objects) -o run -LsfmlFiles/lib $(SFML)

clean:
	rm edit $(objects)