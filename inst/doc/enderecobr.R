## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(enderecobr)

enderecos <- data.frame(
  id = 1,
  tipo = "r",
  logradouro = "ns sra da piedade",
  nroLogradouro = 20,
  complemento = "qd 20",
  cep = 25220020,
  bairro = "jd botanico",
  codmun_dom = 3304557,
  uf_dom = "rj"
)

campos <- correspondencia_campos(
  tipo_de_logradouro = "tipo",
  logradouro = "logradouro",
  numero = "nroLogradouro",
  complemento = "complemento",
  cep = "cep",
  bairro = "bairro",
  municipio = "codmun_dom",
  estado = "uf_dom"
)

padronizar_enderecos(enderecos, campos_do_endereco = campos)

## -----------------------------------------------------------------------------
campos <- correspondencia_campos(
  tipo_de_logradouro = "tipo",
  logradouro = "logradouro"
)

padronizar_enderecos(enderecos, campos, manter_cols_extras = TRUE)

padronizar_enderecos(enderecos, campos, manter_cols_extras = FALSE)

## -----------------------------------------------------------------------------
enderecos <- data.frame(
  tipo = "r",
  logradouro = "ns sra da piedade",
  nroLogradouro = 20
)

campos <- correspondencia_campos(
  tipo_de_logradouro = "tipo",
  logradouro = "logradouro",
  numero = "nroLogradouro"
)

padronizar_enderecos(enderecos, campos, combinar_logradouro = FALSE)

padronizar_enderecos(enderecos, campos, combinar_logradouro = TRUE)

## -----------------------------------------------------------------------------
enderecos <- data.frame(
  tipo = "r",
  logradouro = "r ns sra da piedade",
  nroLogradouro = 20
)

padronizar_enderecos(
  enderecos,
  campos,
  combinar_logradouro = TRUE,
  checar_tipos = FALSE
)

padronizar_enderecos(
  enderecos,
  campos,
  combinar_logradouro = TRUE,
  checar_tipos = TRUE
)

## -----------------------------------------------------------------------------
campos <- correspondencia_logradouro(
  tipo_de_logradouro = "tipo",
  nome_do_logradouro = "logradouro",
  numero = "nroLogradouro"
)

padronizar_logradouros_completos(enderecos, campos_do_logradouro = campos)

## -----------------------------------------------------------------------------
estados <- c("21", " 21", "MA", " MA ", "ma", "MARANHÃO")
padronizar_estados(estados)

estados <- c(21, 32)
padronizar_estados(estados)

## -----------------------------------------------------------------------------
municipios <- c(
  "3304557", "003304557", " 3304557 ", "RIO DE JANEIRO", "rio de janeiro",
  "SÃO PAULO"
)
padronizar_municipios(municipios)

municipios <- 3304557
padronizar_municipios(municipios)

municipios <- c("PARATI", "MOJI MIRIM")
padronizar_municipios(municipios)

## -----------------------------------------------------------------------------
bairros <- c(
  "PRQ IND",
  "NSA SEN DE FATIMA",
  "ILHA DO GOV",
  "VL OLIMPICA",
  "NUC RES"
)
padronizar_bairros(bairros)

## ----error=TRUE---------------------------------------------------------------
try({
ceps <- c("22290-140", "22.290-140", "22290 140", "22290140")
padronizar_ceps(ceps)

ceps <- c(22290140, 1000000)
padronizar_ceps(ceps)

padronizar_ceps("2229014a")

padronizar_ceps("022290140")
})

## -----------------------------------------------------------------------------
logradouros <- c(
  "r. gen.. glicério, 137",
  "cond pres j. k., qd 05 lt 02 1",
  "av d pedro I, 020"
)
padronizar_logradouros(logradouros)

## -----------------------------------------------------------------------------
numeros <- c("0210", "001", "1", "S N", "S/N", "SN", "0180  0181")
padronizar_numeros(numeros)

numeros <- c(210, 1, 10000)
padronizar_numeros(numeros)

## -----------------------------------------------------------------------------
tipos <- c("r", "R.", "AVN", "AVE", "JDM", "QD")
padronizar_tipos_de_logradouro(tipos)

## -----------------------------------------------------------------------------
complementos <- c("QD1 LT2 CS3", "APTO. 405", "PRX CX POST 450")
padronizar_complementos(complementos)

