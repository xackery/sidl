package main

import (
	"fmt"

	g "github.com/AllenDang/giu"
	imgui "github.com/AllenDang/cimgui-go"
) 

func onClickMe() {
	fmt.Println("Hello world!")
}

func onImSoCute() {
	fmt.Println("Im sooooooo cute!!")
}

func loop() {
	imgui.ShowDemoWindow()
	/*g.SingleWindow().Layout(
		g.Label("Hello world from giu"),
		g.Row(
			g.Button("Click Me").OnClick(onClickMe),
			g.Button("I'm so cute").OnClick(onImSoCute),
		),
	)*/
}

func main() {
	wnd := g.NewMasterWindow("Hello world", 1024, 768, 0)
	wnd.Run(loop)
}
