
# Download Git
Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.33.0.windows.2/Git-2.33.0.2-64-bit.exe" -OutFile "$env:TEMP\Git-2.33.0.2-64-bit.exe"

# Install Git
Start-Process -FilePath "$env:TEMP\Git-2.33.0.2-64-bit.exe" -ArgumentList "/SILENT" -Wait

# Download Docker Desktop
Invoke-WebRequest -Uri "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe" -OutFile "$env:TEMP\Docker Desktop Installer.exe"

# Install Docker Desktop
Start-Process -FilePath "$env:TEMP\Docker Desktop Installer.exe" -ArgumentList "/S" -Wait

# Download Terraform
Invoke-WebRequest -Uri "https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_windows_amd64.zip" -OutFile "$env:TEMP\terraform.zip"

# Extract Terraform
Expand-Archive -Path "$env:TEMP\terraform.zip" -DestinationPath "$env:ProgramFiles\terraform"

# Add Terraform to PATH
$env:Path += ";$env:ProgramFiles\terraform"
[Environment]::SetEnvironmentVariable("Path", $env:Path, [EnvironmentVariableTarget]::Machine)
