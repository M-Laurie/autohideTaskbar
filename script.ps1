# Activar ocultar automáticamente la barra de tareas
$taskbarPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3'

# Leer la configuración actual
$currentSettings = Get-ItemProperty -Path $taskbarPath -Name 'Settings'

# Modificar el byte correspondiente para habilitar ocultar automáticamente
# El byte que se debe cambiar es el 8vo byte (índice 8) a 3 para habilitar
$newSettings = $currentSettings.Settings
$newSettings[8] = 3  # Cambiar a 3 para habilitar ocultar automáticamente

# Aplicar los nuevos ajustes
Set-ItemProperty -Path $taskbarPath -Name 'Settings' -Value $newSettings

# Reiniciar el Explorador de Windows para aplicar los cambios
Stop-Process -Name explorer -Force