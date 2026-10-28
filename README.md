# Coursework

Trabajos de la carrera de Ciencias de la Computación e Inteligencia Artificial: talleres y proyectos cortos de HPC, inteligencia artificial, redes neuronales, aprendizaje de máquina, sistemas complejos, toma de decisiones, seguridad y compiladores.

Cada notebook abre con su título y una línea de qué hace, y tiene las salidas guardadas, así que se puede leer en GitHub sin ejecutarlo.

## HPC

| Trabajo | Año | Qué muestra | Autores | |
|---|---|---|---|---|
| [NumPy y Numba frente a Python puro](hpc/numpy-numba-valor-esperado-y-caos.ipynb) | 2023 | Vectorización y compilación JIT con tiempos medidos tras el calentamiento: de 7× a más de 100× sobre Python puro | Santiago Castellanos, Catalina Gutiérrez, Camilo Millán | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/hpc/numpy-numba-valor-esperado-y-caos.ipynb) |

## Inteligencia artificial

| Trabajo | Año | Qué muestra | Autores | |
|---|---|---|---|---|
| [Búsqueda no informada: BFS y DFS](inteligencia-artificial/busqueda-no-informada.ipynb) | 2024 | Ranas, jarras de agua y misioneros y caníbales formulados como problemas de búsqueda; comparación de nodos expandidos y longitud de la solución | Santiago Castellanos, Camilo Millán | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/inteligencia-artificial/busqueda-no-informada.ipynb) |
| [Regresión lineal con gradiente descendente](inteligencia-artificial/regresion-lineal-gradiente-descendente.ipynb) | 2024 | Ecuación normal y gradiente descendente desde cero, efecto de la tasa de aprendizaje y curvas de nivel del costo | Santiago Castellanos | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/inteligencia-artificial/regresion-lineal-gradiente-descendente.ipynb) |

## Redes neuronales

| Trabajo | Año | Qué muestra | Autores | |
|---|---|---|---|---|
| [CNN gatos contra perros](redes-neuronales/cnn-gatos-perros-transfer-learning.ipynb) | 2024 | De una red convolucional pequeña a transfer learning: exactitud de 0,71 a 0,96 | Santiago Castellanos | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/redes-neuronales/cnn-gatos-perros-transfer-learning.ipynb) |
| [Gradiente explosivo en una red de 20 capas](redes-neuronales/gradiente-explosivo-cifar10.ipynb) | 2024 | Inicialización He + ELU, normalización por lotes y SELU en CIFAR-10 con validación separada y parada temprana | Santiago Castellanos | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/redes-neuronales/gradiente-explosivo-cifar10.ipynb) |
| [Redes siamesas con triplet loss](redes-neuronales/red-siamesa-triplet-loss.ipynb) | 2024 | Aprendizaje de métricas: CNN propia en Fashion-MNIST y MobileNetV2 congelada en fotos de flores, evaluadas por vecino más cercano | Santiago Castellanos | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/redes-neuronales/red-siamesa-triplet-loss.ipynb) |

## Aprendizaje de máquina

| Trabajo | Año | Qué muestra | Autores | |
|---|---|---|---|---|
| [SVM con un kernel propio (Jaccard ponderado)](aprendizaje-de-maquina/svm-kernel-jaccard.ipynb) | 2024 | Kernel construido a mano y verificado como semidefinido positivo, Kernel PCA y validación cruzada repetida contra RBF | Santiago Castellanos | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/aprendizaje-de-maquina/svm-kernel-jaccard.ipynb) |
| [Clasificación de textos médicos](aprendizaje-de-maquina/textos-medicos-tfidf-pca.ipynb) | 2024 | Limpieza con NLTK, TF-IDF y SVD truncada; detección de ruido en las etiquetas del conjunto de datos | Santiago Castellanos | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/aprendizaje-de-maquina/textos-medicos-tfidf-pca.ipynb) |

## Aprendizaje supervisado

| Trabajo | Año | Qué muestra | Autores | |
|---|---|---|---|---|
| [Imputación de faltantes y KNN](aprendizaje-supervisado/imputacion-knn-promociones.ipynb) | 2025 | Imputación sin fuga dentro de un pipeline con SMOTE, búsqueda de K y distancia por AUC-PR en datos desbalanceados | Santiago Castellanos | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/aprendizaje-supervisado/imputacion-knn-promociones.ipynb) |

## Sistemas complejos

| Trabajo | Año | Qué muestra | Autores | |
|---|---|---|---|---|
| [Kuramoto contra Winfree](sistemas-complejos/kuramoto-winfree-marcapasos.ipynb) | 2025 | Sincronización de 400 osciladores marcapasos: parámetro de orden, barrido del acoplamiento y contraste con el umbral teórico | Santiago Castellanos, Catalina Gutiérrez, Camilo Millán | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/sistemas-complejos/kuramoto-winfree-marcapasos.ipynb) |

## Toma de decisiones

| Trabajo | Año | Qué muestra | Autores | |
|---|---|---|---|---|
| [Agrupamiento de países](toma-de-decisiones/agrupamiento-paises.ipynb) | 2026 | K-means con selección de k por silueta, clustering jerárquico (Ward) y PCA sobre 167 países | Santiago Castellanos | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/toma-de-decisiones/agrupamiento-paises.ipynb) |
| [Calidad del aire en Bogotá](toma-de-decisiones/calidad-aire-bogota.ipynb) | 2026 | PM2.5 y PM10 de 10 estaciones (2014–2021): series mensuales, comparación con las guías de la OMS y agrupamiento de estaciones | Santiago Castellanos, Sara Romero | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/toma-de-decisiones/calidad-aire-bogota.ipynb) |

## Seguridad

| Trabajo | Año | Qué muestra | Autores | |
|---|---|---|---|---|
| [Autosimilaridad del tráfico de red](seguridad/autosimilaridad-trafico-red.ipynb) | 2025 | Tráfico capturado con tcpdump: conteos a varias escalas, distribuciones y exponente de Hurst por varianza agregada | Camilo Millán, Catalina Gutiérrez, Santiago Castellanos | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Santy012/coursework/blob/main/seguridad/autosimilaridad-trafico-red.ipynb) |

## Compiladores

| Trabajo | Año | Qué muestra | Autores |
|---|---|---|---|
| [Asociatividad y precedencia](compiladores/asociatividad-precedencia/) | 2024 | La misma calculadora en Bison/Flex y en ANTLR 4, en cuatro variantes de precedencia y asociatividad, con la tabla de resultados esperados | Santiago Castellanos, Catalina Gutiérrez |

## Datos

Los datos no se suben al repositorio. Los notebooks los descargan de su fuente pública al ejecutarse: Kaggle mediante `kagglehub` (sin credenciales), `tensorflow_datasets`, Keras o scikit-learn. Las excepciones son la calidad del aire (promedios diarios descargados de la Red de Monitoreo de Calidad del Aire de Bogotá, que se suben a la sesión) y el tráfico de red (captura propia que no se publica; el notebook conserva sus salidas).

## Otros trabajos de la carrera

- [Simulación de semáforos autoorganizados](https://github.com/Santy012/Simulacion_Semaforos_AutoOrganizados)
- [cvv-app](https://github.com/Milocam35/cvv-app)
- [reservaciones-restaurantes](https://github.com/Milocam35/reservaciones-restaurantes)

## Licencia

El código propio se publica con licencia [MIT](LICENSE).
