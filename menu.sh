#!/bin/bash

# ==========================================
# VALIDACIÓN DE LICENCIA AUTOMÁTICA - RUSSO VIP
# ==========================================
# Reemplaza TU_IP_ORACLE con la IP pública de tu VPS Oracle
API_URL="http://TU_IP_ORACLE:8888/validar.php"

clear
echo -e "\033[1;33m==========================================\033[0m"
echo -e "\033[1;36m      SISTEMA DE LICENCIAS RUSSO VIP      \033[0m"
echo -e "\033[1;33m==========================================\033[0m"
echo ""
read -p "Ingresa tu Key de acceso (4 horas): " USER_KEY

if [ -z "$USER_KEY" ]; then
    echo -e "\n\033[1;31m❌ Error: No ingresaste ninguna key. Saliendo...\033[0m"
    exit 1
fi

echo -e "\n\033[1;33m🔄 Verificando licencia con el servidor...\033[0m"

# Consultar a la API local del servidor
RESPONSE=$(curl -s "$API_URL?key=$USER_KEY")

if [ "$RESPONSE" = "OK" ]; then
    echo -e "\033[1;32m✅ ¡Licencia Válida! Iniciando instalación...\033[0m"
    sleep 1.5
else
    echo -e "\033[1;31m❌ Licencia inválida, expirada o ya utilizada.\033[0m"
    exit 1
fi

# ==========================================
# MENÚ PRINCIPAL DEL PANEL
# ==========================================
clear
echo -e "\033[1;32m==========================================\033[0m"
echo -e "\033[1;36m         PANEL RUSSO NETFREE VIP          \033[0m"
echo -e "\033[1;32m==========================================\033[0m"
echo -e " [01] Crear Usuario"
echo -e " [02] Cambiar Contraseña"
echo -e " [03] Eliminar Usuario"
echo -e " [04] Listar Usuarios"
echo -e " [05] Reiniciar WebSocket (Puertos 80 y 8080)"
echo -e " [06] Instalar / Activar Dropbear (Puertos 110/90)"
echo -e " [07] Instalar / Activar SSL Tunnel (Puerto 443)"
echo -e " [08] Instalar / Activar V2Ray en Puerto 8080/80"
echo -e " [09] Obtener Enlace VMess / Información V2Ray"
echo -e " [10] Reiniciar/Activar BadVPN UDPGW (Puerto 7300)"
echo -e " [11] Configurar / Modificar Banner SSH"
echo -e " [12] Activar / Desactivar Auto-inicio del Menú"
echo -e " [00] Salir"
echo -e "\033[1;32m==========================================\033[0m"
echo ""
echo -e "\033[1;32m🚀 Instalación activada correctamente. Disfruta RUSSO NETFREE VIP!\033[0m"
