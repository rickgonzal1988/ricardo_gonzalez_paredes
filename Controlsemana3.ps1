# Definir rutas de origen y destino
$sourcePath = "C:\Respaldos"
$bakDestination = "C:\Respaldos\baks"
$logDestination = "C:\Respaldos\logs"

# Crear carpetas de destino si no existen
if (-Not (Test-Path -Path $bakDestination)) {
    New-Item -ItemType Directory -Path $bakDestination
}
if (-Not (Test-Path -Path $logDestination)) {
    New-Item -ItemType Directory -Path $logDestination
}

# Para mover archivos .bak
Get-ChildItem -Path $sourcePath -Filter "*.bak" | ForEach-Object {
    Move-Item -Path $_.FullName -Destination $bakDestination
}

# Para mover archivos .log
Get-ChildItem -Path $sourcePath -Filter "*.log" | ForEach-Object {
    Move-Item -Path $_.FullName -Destination $logDestination
}

# Crear archivos de ejemplo con mi nombre
New-Item -Path "$sourcePath\Ricardo_Gonzalez.bak" -ItemType File
New-Item -Path "$sourcePath\Ricardo_Gonzalez.log" -ItemType File
