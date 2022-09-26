package main

import (
	"testing"
	"strings"
)

func TestTime(t *testing.T){
    tz := "Europe/Moscow"
    want := "MSK"

    time_old := getTime(tz)
    res := strings.Contains(time_old, want)
    if !res {
        t.Errorf("String %q not inside %q", want, time_old)
    }
}