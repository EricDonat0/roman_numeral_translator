# Transdutor Finito Determinístico para Conversão de Números Romanos

## Integrantes

Eric Donato

Paula Martins

Matheus Henrique

## Descrição do projeto

Este projeto implementa um **Transdutor Finito Determinístico (TFD)** para reconhecer números romanos válidos e convertê-los para sua representação decimal indo-arábica.

O trabalho foi desenvolvido com base no modelo de **Autômato Finito Determinístico** apresentado em aula e segue as restrições solicitadas pelo professor:

- uso de **transições de estado**
- sem uso de **gems**
- sem uso de bibliotecas de máquina de estados
- sem uso de **hashes** ou **tabelas** para representar a lógica do autômato
- reconhecimento do alfabeto:
  **Σ = { I, V, X, L, C, D, M }**
- reconhecimento de números romanos válidos até **3999**

Além da implementação, o projeto apresenta a **modelagem formal do transdutor**, o **tipo adotado**, os **alfabetos de entrada e saída**, exemplos de transições com e sem emissão e o **diagrama Mermaid** solicitado.

---

# Objetivo

Construir um tradutor de números romanos para números decimais usando o conceito de **Autômato Finito Determinístico com saída**, isto é, um **transdutor**.

A máquina deve:

1. reconhecer a cadeia de entrada formada por símbolos romanos
2. validar se a sequência é um número romano válido
3. emitir a saída correspondente em decimal
4. rejeitar entradas inválidas como:
   - `IC`
   - `VX`
   - `IL`
   - `XM`
   - `IIII`

---

# Regras dos números romanos

Os símbolos utilizados são:

| Símbolo | Valor |
| --- | ---: |
| I | 1 |
| V | 5 |
| X | 10 |
| L | 50 |
| C | 100 |
| D | 500 |
| M | 1000 |

## Regras principais

- quando um símbolo menor vem **antes** de um maior, ele é **subtraído**
  - `IV = 4`
  - `IX = 9`
  - `XL = 40`
  - `CM = 900`

- quando um símbolo menor vem **depois** de um maior ou igual, ele é **somado**
  - `VI = 6`
  - `XII = 12`
  - `LXXX = 80`

## Faixa adotada

Por simplificação, este projeto reconhece apenas números de **1 até 3999**, que correspondem à notação romana clássica:

- milhares: `"" | M | MM | MMM`
- centenas: `"" | C | CC | CCC | CD | D | DC | DCC | DCCC | CM`
- dezenas: `"" | X | XX | XXX | XL | L | LX | LXX | LXXX | XC`
- unidades: `"" | I | II | III | IV | V | VI | VII | VIII | IX`

---

# Tipo de transdutor adotado

Foi utilizado um **Transdutor de Mealy**.

## Justificativa

Em uma máquina de **Mealy**, a saída é produzida nas **transições**.

Isso é adequado para este problema porque o valor decimal depende do símbolo atual e do contexto da leitura.

Exemplos:

- ao ler `I` seguido de `V`, a transição emite `4`
- ao ler `I` seguido de `X`, a transição emite `9`
- ao ler `C` seguido de `M`, a transição emite `900`

Ou seja, a saída não depende apenas do estado atual, mas também do símbolo lido naquela transição.

---

# Definição formal

O transdutor pode ser definido por:

**T = (Q, Σ, Γ, δ, λ, q0, F)**

Onde:

- **Q** = conjunto finito de estados
- **Σ** = alfabeto de entrada
- **Γ** = alfabeto de saída
- **δ** = função de transição
- **λ** = função de saída
- **q0** = estado inicial
- **F** = conjunto de estados finais

## Alfabeto de entrada

**Σ = { I, V, X, L, C, D, M }**

## Alfabeto de saída

Como a máquina emite valores ao longo do processamento, o alfabeto de saída é:

**Γ = { ε, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 3000 }**

Onde:

- `ε` representa transição sem emissão
- os demais símbolos representam a saída emitida pela aresta

## Estado inicial

**q0**

## Estados finais

**F = { qF }**

## Conjunto de estados

Os estados foram organizados por blocos canônicos da numeração romana:

### Milhares
- `q0`
- `qM1`
- `qM2`
- `qM3`

### Centenas
- `qHC`
- `qHCC`
- `qHCCC`
- `qHD`
- `qHDC`
- `qHDCC`
- `qHDCCC`

### Dezenas
- `qTX`
- `qTXX`
- `qTXXX`
- `qTL`
- `qTLX`
- `qTLXX`
- `qTLXXX`

### Unidades
- `qOI`
- `qOII`
- `qOIII`
- `qOV`
- `qOVI`
- `qOVII`
- `qOVIII`

### Fim
- `qF`

---

# Exemplos de transições

## Transições sem saída

Nessas transições, a máquina apenas avança no reconhecimento da estrutura do número:

- `δ(q0, M) = qM1`, `λ(q0, M) = ε`
- `δ(qM1, M) = qM2`, `λ(qM1, M) = ε`
- `δ(qHC, C) = qHCC`, `λ(qHC, C) = ε`
- `δ(qTX, X) = qTXX`, `λ(qTX, X) = ε`
- `δ(qOI, I) = qOII`, `λ(qOI, I) = ε`

## Transições com saída

Nessas transições, a máquina emite parte do valor decimal:

- `δ(qOI, V) = qF`, `λ(qOI, V) = 4`
- `δ(qOI, X) = qF`, `λ(qOI, X) = 9`
- `δ(qHC, M) = qF`, `λ(qHC, M) = 900`
- `δ(qTX, L) = qF`, `λ(qTX, L) = 40`
- `δ(qM2, X) = qTX`, `λ(qM2, X) = 2000`

---

# Estratégia de reconhecimento

O reconhecimento foi feito separando o número romano em quatro partes:

1. milhares
2. centenas
3. dezenas
4. unidades

Cada grupo possui somente as combinações válidas da notação romana clássica.

Isso permite validar a entrada sem precisar de tabelas auxiliares e sem depender de estruturas como hash. Toda a lógica é feita com:

- estado atual
- símbolo lido
- próxima transição
- emissão opcional de saída

Dessa forma, o programa não apenas converte, mas também **rejeita entradas inválidas**.

---

# Exemplos válidos

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

# Exemplos inválidos

As entradas abaixo devem ser rejeitadas:

| Romano inválido | Motivo |
| --- | --- |
| IC | subtração inválida |
| VX | ordem inválida |
| IL | subtração inválida |
| XM | subtração inválida |
| IIII | repetição inválida |
| VV | repetição inválida |
| IIV | estrutura inválida |

---
