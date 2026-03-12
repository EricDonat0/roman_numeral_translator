# Modelagem do Transdutor Finito Determinístico

## Objetivo

Este projeto implementa um **Transdutor Finito Determinístico (TFD)** capaz de reconhecer números romanos válidos e convertê-los para sua representação decimal.

O alfabeto reconhecido é:

**Σ = { I, V, X, L, C, D, M }**

Por simplificação, o transdutor reconhece apenas números romanos no intervalo de **1 até 3999**.

---

## Tipo de transdutor utilizado

Foi utilizado um **Transdutor de Mealy**.

### Justificativa

A escolha do modelo de Mealy foi feita porque a saída é emitida durante as **transições** entre estados.

No problema de números romanos, o valor produzido depende do símbolo lido e também do contexto em que ele aparece.

Exemplos:

- `I` seguido de `V` gera saída `4`
- `I` seguido de `X` gera saída `9`
- `C` seguido de `M` gera saída `900`

Portanto, a saída não depende apenas do estado atual, mas da **transição realizada**, o que caracteriza uma máquina de **Mealy**.

---

## Definição formal

O transdutor pode ser representado por:

**T = (Q, Σ, Γ, δ, λ, q0, F)**

Onde:

- **Q** é o conjunto finito de estados
- **Σ** é o alfabeto de entrada
- **Γ** é o alfabeto de saída
- **δ** é a função de transição
- **λ** é a função de saída
- **q0** é o estado inicial
- **F** é o conjunto de estados finais

---

## Alfabeto de entrada

O alfabeto de entrada é formado pelos símbolos romanos:

**Σ = { I, V, X, L, C, D, M }**

---

## Alfabeto de saída

O alfabeto de saída é composto pelos valores emitidos ao longo do processamento:

**Γ = { ε, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 3000 }**

Onde:

- `ε` representa ausência de saída na transição
- os demais valores representam a saída decimal emitida pela aresta

---

## Estado inicial

**q0**

---

## Estados finais

**F = { qF }**

O estado `qF` representa o encerramento correto da leitura da cadeia.

---

## Conjunto de estados

Os estados foram organizados em blocos de acordo com a estrutura canônica dos números romanos.

### Estados de milhares
- `q0`
- `qM1`
- `qM2`
- `qM3`

### Estados de centenas
- `qHC`
- `qHCC`
- `qHCCC`
- `qHD`
- `qHDC`
- `qHDCC`
- `qHDCCC`

### Estados de dezenas
- `qTX`
- `qTXX`
- `qTXXX`
- `qTL`
- `qTLX`
- `qTLXX`
- `qTLXXX`

### Estados de unidades
- `qOI`
- `qOII`
- `qOIII`
- `qOV`
- `qOVI`
- `qOVII`
- `qOVIII`

### Estado final
- `qF`

---

## Estratégia de modelagem

A modelagem foi construída com base na forma canônica dos números romanos até 3999:

- milhares: `"" | M | MM | MMM`
- centenas: `"" | C | CC | CCC | CD | D | DC | DCC | DCCC | CM`
- dezenas: `"" | X | XX | XXX | XL | L | LX | LXX | LXXX | XC`
- unidades: `"" | I | II | III | IV | V | VI | VII | VIII | IX`

Essa separação permite que a máquina:

- reconheça apenas sequências válidas
- rejeite padrões incorretos
- produza o valor decimal durante a leitura

---

## Exemplos de transições sem saída

Algumas transições servem apenas para avançar na leitura da estrutura, sem emitir valor:

- `δ(q0, M) = qM1`, `λ(q0, M) = ε`
- `δ(qM1, M) = qM2`, `λ(qM1, M) = ε`
- `δ(qHC, C) = qHCC`, `λ(qHC, C) = ε`
- `δ(qTX, X) = qTXX`, `λ(qTX, X) = ε`
- `δ(qOI, I) = qOII`, `λ(qOI, I) = ε`

---

## Exemplos de transições com saída

Algumas transições emitem parte do valor decimal:

- `δ(qOI, V) = qF`, `λ(qOI, V) = 4`
- `δ(qOI, X) = qF`, `λ(qOI, X) = 9`
- `δ(qHC, M) = qF`, `λ(qHC, M) = 900`
- `δ(qTX, L) = qF`, `λ(qTX, L) = 40`
- `δ(qM2, X) = qTX`, `λ(qM2, X) = 2000`

---

## Validação de entradas

A validação é feita pelo próprio transdutor, por meio das transições permitidas.

Se um símbolo for lido em um estado onde não existe transição válida, a entrada é rejeitada.

Exemplos de entradas inválidas rejeitadas:

- `IC`
- `VX`
- `IL`
- `XM`
- `IIII`
- `VV`

---

## Exemplos de entradas válidas

| Romano | Decimal |
| --- | ---: |
| III | 3 |
| IV | 4 |
| IX | 9 |
| XIV | 14 |
| XXIX | 29 |
| XLII | 42 |
| LXXXVIII | 88 |
| CXCIV | 194 |
| MCMXC | 1990 |
| MMXXIV | 2024 |
| MMMCMXCIX | 3999 |

---

## Conclusão

O transdutor modelado reconhece números romanos válidos até 3999 e realiza a conversão para decimal por meio de transições de estado com emissão de saída.

A solução segue a proposta de um **Autômato Finito Determinístico com saída**, utilizando o modelo de **Mealy**, já que a saída depende diretamente da transição executada durante a leitura da cadeia.