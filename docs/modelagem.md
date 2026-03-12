# Modelagem do Transdutor

## Tipo de transdutor
Foi utilizado um Transdutor Finito Determinístico do tipo Mealy.

## Justificativa
A saída é emitida nas transições, pois o valor decimal depende do símbolo lido e do contexto.

## Alfabeto de entrada
Σ = { I, V, X, L, C, D, M }

## Alfabeto de saída
Γ = { ε, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 3000 }

## Estado inicial
q0

## Estado final
qF

## Organização dos estados
- Milhares
- Centenas
- Dezenas
- Unidades

## Exemplos de transições sem saída
- δ(q0, M) = qM1, λ(q0, M) = ε
- δ(qHC, C) = qHCC, λ(qHC, C) = ε

## Exemplos de transições com saída
- δ(qOI, V) = qF, λ(qOI, V) = 4
- δ(qOI, X) = qF, λ(qOI, X) = 9
- δ(qHC, M) = qF, λ(qHC, M) = 900