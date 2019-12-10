Análisis exploratorio de datos de real state UK
-----------------------------------------------

#### Librerías

    library(tidyverse)

    ## ── Attaching packages ──────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 3.2.1     ✔ purrr   0.3.2
    ## ✔ tibble  2.1.3     ✔ dplyr   0.8.3
    ## ✔ tidyr   0.8.3     ✔ stringr 1.4.0
    ## ✔ readr   1.3.1     ✔ forcats 0.4.0

    ## ── Conflicts ─────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

    library(ggplot2)
    library(gridExtra)

    ## 
    ## Attaching package: 'gridExtra'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     combine

    library(grid)

Lectura de la base de datos de real state de UK.

    realsuk <- read.csv("pp-2019-part1.csv", header = TRUE, sep = ",")

Conversión de los datos a formato *tibble*.

    realsuk <- as_tibble(realsuk)

Primeras observaciones de la base de datos.

    head(realsuk)

    ## # A tibble: 6 x 16
    ##   uid    price date_of_transfer postcode proper_type old_new duration paon 
    ##   <fct>  <int> <fct>            <fct>    <fct>       <fct>   <fct>    <fct>
    ## 1 {919… 245000 12/08/2019 00:00 B17 0LA  T           N       F        104  
    ## 2 {919… 178500 01/08/2019 00:00 B31 5HN  S           N       F        138  
    ## 3 {919… 178000 26/07/2019 00:00 B92 7LN  T           N       F        133  
    ## 4 {919… 170000 08/08/2019 00:00 WS8 6JF  T           N       F        72   
    ## 5 {919… 360000 01/08/2019 00:00 B38 8AJ  D           N       F        6    
    ## 6 {919… 135000 29/07/2019 00:00 B21 8DB  T           N       F        157  
    ## # … with 8 more variables: saon <fct>, street <fct>, locality <fct>,
    ## #   town_city <fct>, district <fct>, county <fct>, ppd_category <fct>,
    ## #   record_status <fct>

Resumen de los datos de Real state.

    glimpse(realsuk)

    ## Observations: 351,017
    ## Variables: 16
    ## $ uid              <fct> {919FEC05-ED72-9A90-E053-6C04A8C0A300}, {919FEC…
    ## $ price            <int> 245000, 178500, 178000, 170000, 360000, 135000,…
    ## $ date_of_transfer <fct> 12/08/2019 00:00, 01/08/2019 00:00, 26/07/2019 …
    ## $ postcode         <fct> B17 0LA, B31 5HN, B92 7LN, WS8 6JF, B38 8AJ, B2…
    ## $ proper_type      <fct> T, S, T, T, D, T, S, F, T, T, T, T, T, D, T, S,…
    ## $ old_new          <fct> N, N, N, N, N, N, N, N, N, N, N, N, N, N, N, N,…
    ## $ duration         <fct> F, F, F, F, F, F, F, L, F, F, L, F, F, F, F, F,…
    ## $ paon             <fct> 104, 138, 133, 72, 6, 157, 17, 409, 23, 51, 12,…
    ## $ saon             <fct> , , , , , , , , , , , , , , , , , , , , , , , , 
    ## $ street           <fct> METCHLEY DRIVE, FARREN ROAD, SCOTT ROAD, MIDDLE…
    ## $ locality         <fct> , , OLTON, , , , WORDSLEY, , , , , , , , , , , …
    ## $ town_city        <fct> BIRMINGHAM, BIRMINGHAM, SOLIHULL, WALSALL, BIRM…
    ## $ district         <fct> BIRMINGHAM, BIRMINGHAM, SOLIHULL, WALSALL, BIRM…
    ## $ county           <fct> WEST MIDLANDS, WEST MIDLANDS, WEST MIDLANDS, WE…
    ## $ ppd_category     <fct> A, A, A, A, A, A, A, A, A, A, A, A, A, A, A, A,…
    ## $ record_status    <fct> A, A, A, A, A, A, A, A, A, A, A, A, A, A, A, A,…

Dispersión de los datos por precio de las viviendas

    ggplot(realsuk, aes(x = date_of_transfer, y = price)) + 
      geom_point()

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-7-1.png)

En las siguientes gráficas se muestra la dispersión del precio por cada
una de las varibles categóricas que tiene la base de datos.

Se pueden observar datos atípicos enen los precios. Estos datos
modifican la visualización de los datos, posteriormente se tratarán.

    box_1 <- ggplot(data = realsuk, mapping = aes(x = old_new , y = price)) +
      geom_boxplot()

    box_2 <- ggplot(data = realsuk, mapping = aes(x = duration  , y = price)) +
      geom_boxplot()

    box_3 <- ggplot(data = realsuk, mapping = aes(x = proper_type  , y = price)) +
      geom_boxplot()

    grid.arrange(box_1, box_2, box_3, ncol = 3)

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-8-1.png)

En la gráfica de inmuebles antiguos contra nuevos, se puede notar que
hay una mayor dispersión en términos de precios.

En cuanto a la duración presentan simulitud en la dispersión del precio
de la vivienda.

Finalmente, se observa que la variable *O* tiene mayor dispersión que
las demás variables.

Pasando al histograma de los precios para conocer la distribución de
estos, se puede apreciar una desviación que no permite la correcta
visualización de los datos. Esto se debe a la existencia de datos
atípicos que arrastran la distribución.

    hist(realsuk$price, col = "lightseagreen", main = "Distribución de precios")

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-9-1.png)

Para observar mejor este fenómeno se realizó un box plot y un histograma
distinto que nos permite apreciar los datos pequeños que no se pueden
notar en la vista pasada.

    ggplot() + geom_histogram(mapping = aes(realsuk$price), bins = 1000, fill = "lightseagreen")

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-10-1.png)

    boxplot(realsuk$price, main = "precio", boxwex = 0.5, col = "salmon") # Boxplot de los precios

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-10-2.png)

    boxplot(realsuk, main = "precio", boxwex = 0.5, col = "salmon") # Boxplot de todas las variables

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-10-3.png)

A continuación, se identificarán y retirarán los outliers que alteran la
información.

    outliers <- boxplot(realsuk$price, plot = FALSE)$out   # Identificación de los outliers dentro de la variable precio
    precios_rs <- realsuk[-which(realsuk$price %in% outliers),] # Eliminación de las observaciones con outliers
    boxplot(precios_rs)

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-11-1.png)

    boxplot(precios_rs$price)

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-11-2.png)

En la gráfica de boxplot se aprecia mejor la indformación y distribución
tanto para todas las variables como para los precios.

Finalmente, se realizan los histogramas para conocer la distribución del
precio.

    hist(precios_rs$price, col = "lightseagreen", main = "Distribución de precios")

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-12-1.png)

    qplot(precios_rs$price, geom="histogram", fill = "salmon")

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-13-1.png)

A contunuación, se realizará un análisis para conocer la situación de
las variables categóricas de la base de datos se realizarán gráficas
para comparar referencias absolutas entre dichas variables.

    barplot(table(precios_rs$old_new), col = c("salmon", "lightseagreen"),
            main = "Frecuencias absolutas\n de la variable \"old_new\"")

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-14-1.png)

    barplot(table(precios_rs$duration), col = c("salmon", "lightseagreen"),
            main = "Frecuencias absolutas\n de la variable \"duration\"")

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-15-1.png)

    barplot(table(precios_rs$proper_type), col = c("salmon", "lightseagreen", "olivedrab2", "lightslateblue", "aquamarine1"),
            main = "Frecuencias absolutas\n de la variable \"proper type\"")

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-16-1.png)

    barplot(table(precios_rs$county), col = c("salmon", "lightseagreen"),
            main = "Frecuencias absolutas\n de la variable \"county\"")

![](EDA_realsuk_files/figure-markdown_strict/unnamed-chunk-17-1.png)
