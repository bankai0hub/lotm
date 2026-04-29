# Sefirah Castle Run Script - starts both Backend and Frontend

Write-Host "Invoking the authority of the Sefirah Castle..." -ForegroundColor Yellow

# Start Backend
Write-Host "Starting Java Backend on port 8080..."
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot/backend'; java -cp 'bin;lib/*' com.lotm.AppServer"

# Start Frontend
Write-Host "Starting React Frontend on port 5173..."
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot/frontend'; npm run dev"

Write-Host "The Grey Fog is rising. Access the Wiki at http://localhost:5173" -ForegroundColor Cyan
