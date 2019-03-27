FROM  golang

WORKDIR /openshift-go

COPY . . 

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build 

EXPOSE 8080 
ENTRYPOINT [ "/openshift-go/openshift-go" ]