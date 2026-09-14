# Optimización y Automatización de Pruebas Funcionales en Aplicación iOS

En el desarrollo de aplicaciones móviles iOS, es crucial garantizar que el software sea robusto, eficiente y libre de errores. Para ello, se deben implementar técnicas de pruebas funcionales automatizadas y utilizar herramientas de perfilamiento para optimizar el rendimiento. El objetivo de este reto es que el candidato demuestre su capacidad para aplicar BDD en la creación de pruebas, desarrollar y ejecutar pruebas unitarias (UT), incluyendo aquellas para funcionalidades asíncronas, y utilizar un perfilador para diagnosticar y solucionar problemas de rendimiento en la aplicación.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Técnicas de pruebas funcionales automatizadas y técnicas de perfilamiento de aplicaciones |
| **Nivel** | senior-l2 |
| **Tipo** | mixed |
| **Tiempo estimado** | 8-10 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Implementación de Pruebas Funcionales con BDD

**Objetivo:** Crear un conjunto de pruebas funcionales utilizando BDD que cubran las principales funcionalidades de la aplicación.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identifica las funcionalidades clave de la aplicación que deben ser cubiertas por las pruebas.
- Diseña escenarios de prueba utilizando BDD para validar estas funcionalidades.
- Implementa las pruebas y verifica que se ejecuten correctamente.

**Entregable:** Conjunto de pruebas funcionales implementadas y ejecutadas con éxito.

<details>
<summary>Pistas de conocimiento</summary>

- Las pruebas deben ser legibles y mantener un lenguaje cercano al negocio.
- Considera cómo documentar las pruebas para que sean comprensibles para no técnicos.

</details>

### Fase 2: Desarrollo de Pruebas Unitarias

**Objetivo:** Crear y ejecutar pruebas unitarias para validar la lógica de la aplicación, incluyendo funcionalidades asíncronas.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Identifica las unidades de código que requieren pruebas unitarias.
- Diseña y escribe pruebas unitarias para estas unidades, incluyendo aquellas que involucren funcionalidades asíncronas.
- Ejecuta las pruebas y verifica su correcta funcionalidad.

**Entregable:** Conjunto de pruebas unitarias implementadas y ejecutadas con éxito, incluyendo pruebas para funcionalidades asíncronas.

<details>
<summary>Pistas de conocimiento</summary>

- Las pruebas unitarias deben ser aisladas y ejecutarse rápidamente.
- Considera cómo manejar el estado y las dependencias en las pruebas.

</details>

### Fase 3: Optimización con Perfilamiento de Aplicaciones

**Objetivo:** Utilizar un perfilador para identificar y solucionar problemas de rendimiento en la aplicación.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Configura y ejecuta un perfilador en la aplicación para identificar cuellos de botella y problemas de rendimiento.
- Analiza los resultados del perfilador y propone soluciones para optimizar el rendimiento.
- Implementa las soluciones propuestas y verifica la mejora en el rendimiento.

**Entregable:** Reporte de perfilamiento con identificación de problemas y propuestas de solución, y evidencia de mejora en el rendimiento.

<details>
<summary>Pistas de conocimiento</summary>

- Los perfiladores pueden mostrar información detallada sobre el uso de CPU, memoria y otros recursos.
- Considera cómo comunicar los hallazgos del perfilador al equipo de desarrollo y a los stakeholders.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es BDD y por qué se utiliza en el desarrollo de aplicaciones móviles?
- **paraQueSirve**: ¿Para qué sirven las pruebas unitarias y por qué son importantes en el desarrollo de software?
- **comoSeUsa**: ¿Cómo se utiliza un perfilador para identificar problemas de rendimiento en una aplicación?
- **erroresComunes**: ¿Cuáles son los errores comunes al escribir pruebas unitarias y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el uso de un perfilador para optimizar el rendimiento de una aplicación?

## Criterios de Evaluacion

- Implementación de pruebas funcionales utilizando BDD.
- Desarrollo y ejecución de pruebas unitarias, incluyendo funcionalidades asíncronas.
- Uso de un perfilador para identificar y solucionar problemas de rendimiento.
- Comunicación efectiva de los hallazgos y propuestas de solución al equipo de desarrollo y stakeholders.

## Como trabajar con un asistente de IA

- **AGENTS.md** — instrucciones nativas del repo (Cursor, Codex, Copilot, Gemini, Claude Code). Abrí el proyecto y el agente las carga solo.
- **PROMPT_MEJORA.md** — el mismo prompt, para copiar y pegar en un chat (claude.ai, ChatGPT, etc.).

---

*Reto generado automaticamente por Challenge Generator - Pragma*
