# Use the official Dart image to build the Flutter web app
FROM dart:stable AS build

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /flutter \
    && /flutter/bin/flutter --version

ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable web support
RUN flutter config --enable-web

# Set working directory
WORKDIR /app

# Copy pubspec files and download dependencies
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of the app
COPY . .

# Build the web release
RUN flutter build web --release

# Use a minimal nginx image to serve the app
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy built web assets from build stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]