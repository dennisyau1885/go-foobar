package main

import (
        "fmt"
        "net/http"
        "os"
)

func main() {
        http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
                fmt.Fprintf(w, "FOOBAR: %s", os.Getenv("FOOBAR"))
        })

        port := "8080"
        fmt.Printf("Server is running on :%s\n", port)
        fmt.Println(http.ListenAndServe(":"+port, nil))
}
