CCFLAGS = -I uork/stage/include -DIX -DGCC -DLINUX -DORK_LINUX --std=c++0x
LFLAGS = -L uork/stage/lib -lork.core.ix.release

all:
	g++ $(CCFLAGS) main.cpp -o main.exe $(LFLAGS)

env:
	./uork/ork.build/bin/ork.build.int_env.py

.PHONY: docs

docs: .
	rm -rf docs/ork.*
	doxygen ork.core/doc/doxyfile

clean:
	scons -c -f root.sconstruct 
	rm -rf stage/include/ork

install:
	scons -f root.sconstruct install
