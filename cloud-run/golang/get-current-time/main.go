package main

import (
    "fmt"
    "net/http"
    "time"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        // 日本のタイムゾーンを取得
        loc, err := time.LoadLocation("Asia/Tokyo")
        if err != nil {
            fmt.Fprintf(w, "Error loading location: %s", err)
            return
        }

        // 日本のタイムゾーンで現在時刻を取得
        currentTime := time.Now().In(loc).Format("2006-01-02 15:04:05")
        message := fmt.Sprintf("Current time in Japan is: %s", currentTime)
        fmt.Println(message)
        fmt.Fprintf(w, message)
    })

    http.ListenAndServe(":8080", nil)
}