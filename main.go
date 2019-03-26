package main

import (
	"log"
	"net/http"
)

type server struct {
	router *http.ServeMux
} // .server

func main() {

	s := server{router: http.NewServeMux()}

	s.router.HandleFunc("/", home)

	log.Println("Starting server on port :80")
	log.Fatal(http.ListenAndServe(":80", s.router))

} // .main

func home(w http.ResponseWriter, r *http.Request) {

	w.Write([]byte("hello openshift-go"))

} // .home
