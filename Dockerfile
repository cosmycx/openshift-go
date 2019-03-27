FROM  golang as builder

WORKDIR /openshift-go

COPY . . 

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build 

FROM scratch 

COPY --from=builder /openshift-go/openshift-go /openshift-go/

EXPOSE 8080 
ENTRYPOINT [ "/openshift-go/openshift-go" ]