FROM golang:1.22-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files into the container
COPY go.mod go.sum ./

# Download and install dependencies
RUN go mod download

# Copy the rest of the application source code into the container
COPY . .

# Build the Go app
RUN go build -o api .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./api"]
