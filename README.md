# Ing-Web
proyecto semestral de ingenieria web

-------------------------------------
Requisitos de funcionamiento
-------------------------------------
- Tener la base de datos creada en phpmyadmin
- Tener instalado PHP version 8.3.x en adelante
- Tener visual Studio Code o otro editor código similar
- Tener instalado Wamp Server

-------------------------------------
Clases
-------------------------------------
Database.php	
Administra la conexión a la base de datos utilizando el patrón Singleton para asegurar una única instancia PDO.

Sanitizer.php	
Proporciona métodos estáticos para la limpieza y validación de datos (sanitización de input, validación de email, contraseña e imágenes).

ErrorHandlerInterface.php	
Define una interfaz para el manejo de errores (métodos estáticos para registrar, mostrar y validar campos requeridos).

Usuario.php	
Gestiona todas las operaciones relacionadas con los usuarios (login, registro, actualización de perfil, puntos, nivel y obtención de ranking).

TemaManager.php	
Administra las operaciones CRUD para Temas y Preguntas (crear, obtener, actualizar, eliminar) y la lógica de verificación de respuestas.

PremioManager.php	
Gestiona las operaciones CRUD para Premios y la lógica para asignar/obtener premios a los usuarios basándose en sus puntos y nivel.
QRManager	QRManager.php	Se encarga de la creación, gestión y obtención de Sets de Preguntas (incluyendo la funcionalidad para generar Códigos QR asociados a cada set).

-------------------------------------
Detalle de Funcionalidades por Clase
-------------------------------------
1. Database (Database.php)
Función: Establece y gestiona la conexión a la base de datos MySQL utilizando PDO.

Método Clave: getInstance() - Devuelve una única instancia de la conexión PDO ($this->connection), siguiendo el patrón Singleton.

2. Sanitizer (Sanitizer.php)
Función: Asegura que los datos de entrada sean seguros y válidos antes de ser procesados o almacenados.

Métodos Clave:

cleanInput($data): Limpia una cadena de texto (trim, stripslashes, htmlspecialchars).

validateEmail($email): Valida el formato de un email.

validateImage($file): Valida el tipo y tamaño de un archivo de imagen.

3. ErrorHandlerInterface (ErrorHandlerInterface.php)
Función: Es una plantilla para las clases que manejen errores, especificando los métodos que deben implementar para un manejo uniforme.

Métodos Clave: logError(), showError(), validateRequired(). (Asumo que una clase externa, quizás llamada ErrorHandler o el propio Sanitizer, implementa estos métodos).

4. Usuario (Usuario.php)
Función: Manejo completo del ciclo de vida del usuario.

Métodos Clave:

login() / registrar(): Autenticación y creación de nuevas cuentas.

actualizarAvatar(): Carga y actualización de la imagen de perfil.

actualizarPuntos() / actualizarNivel(): Lógica de progresión y gamificación.

obtenerRanking(): Consulta los 10 usuarios con más puntos.

5. TemaManager (TemaManager.php)
Función: Gestión del contenido educativo/quiz (Temas y sus Preguntas asociadas).

Métodos Clave:

crearTema() / obtenerTemas(): Gestión de los temas principales.

crearPregunta() / obtenerPreguntas(): Gestión de las preguntas dentro de los temas (serializando opciones a JSON).

verificarRespuesta(): Lógica central para comprobar si una respuesta es correcta y devolver los puntos asociados.

6. PremioManager (PremioManager.php)
Función: Gestión de los premios que los usuarios pueden ganar y reclamar.

Métodos Clave:

crearPremio(): Incluye la lógica para subir la imagen asociada al premio.

obtenerPremios(): Recupera premios, opcionalmente filtrando por nivel.

verificarPremioUsuario(): Determina qué premios puede reclamar un usuario según sus puntos y nivel actual.

asignarPremio(): Registra que un usuario ha obtenido un premio.

7. QRManager (QRManager.php)
Función: Permite a los usuarios crear colecciones de preguntas personalizadas (Sets) y asociarles un código QR para compartirlas y jugarlas.

Métodos Clave:

crearSetPreguntas(): Crea un set con un código único y registra las preguntas.

generarQR(): Utiliza la librería Endroid\QrCode para generar y guardar el código QR como imagen (con un fallback a Google Charts).

obtenerSetPorCodigo(): Recupera un set completo (incluyendo todas sus preguntas) a partir de su código QR.
