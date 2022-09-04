# Python app

## Build and Run

### Build with Podman

1. Build

   ```bash
   podman build . -t app_rust
   ```

2. Run

   ```bash
   podman run -p 8080:8080 app_rust
   ```

### Run locally without containers

1. Build the app

   ```bash
   cargo build
   ```

2. Test it

   ```bash
   cargo test
   ```

3. Run

   ```bash
   cargo run
   ```

## Usage

Navigate to our app and see current time in ISO format
