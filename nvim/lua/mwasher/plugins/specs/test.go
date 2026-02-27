package main

import (
	"fmt"
	"math"
	"math/rand"
	"strings"
	"time"
)

// TODO: this is a test

type Shape interface {
	Area() float64
	Perimeter() float64
}

type Circle struct {
	Radius float64
}

type Rectangle struct {
	Width, Height float64
}

func (c Circle) Area() float64 {
	return math.Pi * c.Radius * c.Radius
}

func (c Circle) Perimeter() float64 {
	return 2 * math.Pi * c.Radius
}

func (r Rectangle) Area() float64 {
	return r.Width * r.Height
}

func (r Rectangle) Perimeter() float64 {
	return 2 * (r.Width + r.Height)
}

func randomWord(n int) string {
	const letters = "abcdefghijklmnopqrstuvwxyz"
	sb := strings.Builder{}
	for i := 0; i < n; i++ {
		sb.WriteByte(letters[rand.Intn(len(letters))])
	}
	return sb.String()
}

func printShapeInfo(s Shape) {
	fmt.Printf("Area: %.2f | Perimeter: %.2f\n", s.Area(), s.Perimeter())
}

func main() {
	rand.Seed(time.Now().UnixNano())
	shapes := []Shape{
		Circle{Radius: rand.Float64() * 10},
		Rectangle{Width: rand.Float64() * 8, Height: rand.Float64() * 5},
	}
	for _, s := range shapes {
		printShapeInfo(s)
	}
	fmt.Println("Random word:", randomWord(8))
}
