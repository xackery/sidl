NAME := SIDL

run: 
	go run main.go

build-windows:
	echo 'id ICON "./res/app_win.ico"\nGLFW_ICON ICON "./res/app_win.ico"' > ${NAME}.rc

	x86_64-w64-mingw32-windres ${NAME}.rc -O coff -o ${NAME}.syso
	GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc CXX=x86_64-w64-mingw32-g++ HOST=x86_64-w64-mingw32 go build -ldflags "-s -w -H=windowsgui -extldflags=-static" -p 4 -v -o bin/${NAME}.exe

	rm ${NAME}.syso
	rm ${NAME}.rc

build-darwin:
	GOOS=darwin CGO_ENABLED=1 go build -ldflags "-s -w" -o bin/${NAME}-darwin