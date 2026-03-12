# Transdutor Finito Determinístico para números romanos

## Tipo
Foi utilizado um transdutor de Mealy.

## Justificativa
A saída é produzida nas transições, pois o valor decimal depende do símbolo atual e do contexto.

Exemplos:
- I seguido de V produz 4
- I seguido de X produz 9
- C seguido de M produz 900

## Alfabeto de entrada
Σ = { I, V, X, L, C, D, M }

## Alfabeto de saída
Γ = { ε, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 3000 }

## Faixa reconhecida
Apenas números romanos válidos de 1 até 3999.

## Validação
A máquina rejeita sequências inválidas como:
- IC
- VX
- IL
- XM
- IIII
- VV

## Estratégia
A validação é feita por estados que representam as quatro partes canônicas do numeral romano:

- milhares
- centenas
- dezenas
- unidades

Cada grupo possui somente as combinações válidas da notação romana clássica.
