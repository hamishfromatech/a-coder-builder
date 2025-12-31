export VSCODE_CLI_APP_NAME="a-coder"
export VSCODE_CLI_BINARY_NAME="a-coder-server"
export VSCODE_CLI_DOWNLOAD_URL="https://github.com/hamishfromatech/A-Coder/releases"
export VSCODE_CLI_QUALITY="stable"
export VSCODE_CLI_UPDATE_URL="https://raw.githubusercontent.com/hamishfromatech/versions/refs/heads/main"

cargo build --release --target aarch64-apple-darwin --bin=code

cp target/aarch64-apple-darwin/release/code "../../VSCode-darwin-arm64/A-Coder.app/Contents/Resources/app/bin/a-coder-tunnel"

"../../VSCode-darwin-arm64/A-Coder.app/Contents/Resources/app/bin/a-coder-tunnel" serve-web