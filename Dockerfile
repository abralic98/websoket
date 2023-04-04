# Use the official Elixir image as the base image
FROM elixir:latest

# Set the working directory in the container
WORKDIR /root/websocket

# Copy the application files into the container
COPY . .

# Install dependencies
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

# Build the application
RUN mix compile

# Start the application
CMD ["mix", "phx.server" ]
EXPOSE 4000
