package simd

import "unsafe"

var (
	sumFloat64 func([]float64) float64
)

func SumFloat64(v []float64) float64 {
	return sumFloat64(v)
}

func sum_float64_go(buf []float64) float64 {
	acc := float64(0)
	for i := range buf {
		acc += buf[i]
	}
	return acc
}

func sum_float64_go_unroll4(buf []float64) float64 {
	var (
		acc1, acc2, acc3, acc4 float64
	)
	for i := 0; i < len(buf); i += 4 {
		bb := (*[4]float64)(unsafe.Pointer(&buf[i]))
		acc1 += bb[0]
		acc2 += bb[1]
		acc3 += bb[2]
		acc4 += bb[3]
	}
	return acc1 + acc2 + acc3 + acc4
}

func sum_float64_go_unroll8(buf []float64) float64 {
	var (
		acc0, acc1, acc2, acc3 float64
		acc4, acc5, acc6, acc7 float64
	)
	for i := 0; i < len(buf); i += 8 {
		bb := (*[8]float64)(unsafe.Pointer(&buf[i]))
		acc0 += bb[0]
		acc1 += bb[1]
		acc2 += bb[2]
		acc3 += bb[3]
		acc4 += bb[4]
		acc5 += bb[5]
		acc6 += bb[6]
		acc7 += bb[7]
	}
	return acc0 + acc1 + acc2 + acc3 + acc4 + acc5 + acc6 + acc7
}
