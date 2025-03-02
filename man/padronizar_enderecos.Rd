% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/padronizar_enderecos.R
\name{padronizar_enderecos}
\alias{padronizar_enderecos}
\title{Padronizar endereços}
\usage{
padronizar_enderecos(
  enderecos,
  campos_do_endereco = correspondencia_campos(),
  formato_estados = "por_extenso",
  formato_numeros = "character",
  manter_cols_extras = TRUE,
  combinar_logradouro = FALSE,
  checar_tipos = FALSE
)
}
\arguments{
\item{enderecos}{Um dataframe. Os endereços a serem padronizados. Cada uma de
suas colunas deve corresponder a um campo do endereço (e.g. logradouro,
cidade, bairro, etc).}

\item{campos_do_endereco}{Um vetor nomeado de caracteres. A correspondência
entre os campos a serem padronizados (nomes do vetor) e as colunas que os
representam no dataframe (valores em si). A função
\code{correspondencia_campos()} facilita a criação deste vetor, fazendo também
algumas verificações do conteúdo imputado. Argumentos dessa função com
valor \code{NULL} são ignorados, e ao menos um valor diferente de nulo deve ser
fornecido. Caso deseje criar o vetor manualmente, note que seus nomes devem
ser os mesmos nomes dos parâmetros da função \code{correspondencia_campos()}.}

\item{formato_estados}{Uma string. Como o estado padronizado deve ser
formatado. Por padrão, \code{"por_extenso"}, fazendo com que a função retorne o
nome dos estados por extenso. Se \code{"sigla"}, a função retorna a sigla dos
estados.}

\item{formato_numeros}{Uma string. Como o número padronizado deve ser
formatado. Por padrão, \code{"character"}, fazendo com que a função retorne o
número como caractere. Se \code{"integer"}, a função retorna o número como
inteiro.}

\item{manter_cols_extras}{Um logical. Se colunas não especificadas em
\code{campos_do_endereco} devem ser mantidas ou não (por exemplo, uma coluna de
id do conjunto de dados sendo padronizado). Por padrão, \code{TRUE}.}

\item{combinar_logradouro}{Um logical. Se os campos que descrevem o
logradouro (tipo, nome e número, por exemplo) devem ser combinados em um
único campo de logradouro completo. Nesse caso, o parâmetro \code{logradouro} da
\code{correspondencia_campos()} deve ser interpretado como o nome do logradouro.
Por padrão, \code{FALSE}.}

\item{checar_tipos}{Um logical. Apenas tem efeito quando
\code{combinar_logradouro} é \code{TRUE}. Se a ocorrência de duplicatas entre os
tipos e nomes dos logradouros deve ser verificada ao combiná-los (por
exemplo, quando o tipo é descrito como "RUA" e o nome é descrito como "RUA
BOTAFOGO"). Por padrão, \code{FALSE}.}
}
\value{
Um dataframe com colunas adicionais, representando os campos de
endereço padronizados.
}
\description{
Padroniza simultaneamente os diversos campos de um endereço listados em um
dataframe.
}
\examples{
enderecos <- data.frame(
  id = 1,
  logradouro = "r ns sra da piedade",
  nroLogradouro = 20,
  complemento = "qd 20",
  cep = 25220020,
  bairro = "jd botanico",
  codmun_dom = 3304557,
  uf_dom = "rj"
)

campos <- correspondencia_campos(
  logradouro = "logradouro",
  numero = "nroLogradouro",
  complemento = "complemento",
  cep = "cep",
  bairro = "bairro",
  municipio = "codmun_dom",
  estado = "uf_dom"
)

padronizar_enderecos(enderecos, campos)

padronizar_enderecos(enderecos, campos, manter_cols_extras = FALSE)

padronizar_enderecos(enderecos, campos, combinar_logradouro = TRUE)

ends_tipo_duplicado <- data.frame(tipo = "r", nome = "r ns sra da piedade")

padronizar_enderecos(
  ends_tipo_duplicado,
  campos_do_endereco = correspondencia_campos(
    tipo_de_logradouro = "tipo",
    logradouro = "nome"
  ),
  combinar_logradouro = TRUE,
  checar_tipos = TRUE
)

}
