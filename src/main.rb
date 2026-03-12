class ADFRomano
  def initialize(cadeia)
    @cadeia = cadeia.upcase.strip
    @indice = 0
    @max = @cadeia.size
    @saida = 0
  end

  def proximo
    if @indice == @max
      ""
    else
      @cadeia[@indice]
    end
  end

  def emitir(valor)
    @saida = valor
    puts "Saída emitida: #{valor} | acumulado: #{@saida}"
  end

  def aceitar
    puts "Aceito 😀"
    puts "Número decimal: #{@saida}"
  end

  def erro(estado)
    puts "Erro ❌"
    puts "Estado: #{estado}"
    puts "Símbolo lido: '#{proximo}'"
  end

  def iniciar
    estado = "qInicio"

    puts "Máquina iniciou no estado: #{estado}"
    puts "Entrada: #{@cadeia}"

    loop do
      case [proximo, estado]

      # -------- INICIO --------

      in ["M", "qInicio"]
        estado = "qMilhar_M"

      in ["C", "qInicio"]
        estado = "qCentena_C"

      in ["D", "qInicio"]
        estado = "qCentena_D"

      in ["X", "qInicio"]
        estado = "qDezena_X"

      in ["L", "qInicio"]
        estado = "qDezena_L"

      in ["I", "qInicio"]
        estado = "qUnidade_I"

      in ["V", "qInicio"]
        estado = "qUnidade_V"

      in ["", "qInicio"]
        estado = "qfinal"
        break

      # -------- MILHARES --------

      in ["M", "qMilhar_M"]
        estado = "qMilhar_2M"

      in ["C", "qMilhar_M"]
        emitir(1)
        estado = "qCentena_C"

      in ["D", "qMilhar_M"]
        emitir(1)
        estado = "qCentena_D"

      in ["X", "qMilhar_M"]
        emitir(1)
        estado = "qDezena_X"

      in ["L", "qMilhar_M"]
        emitir(1)
        estado = "qDezena_L"

      in ["I", "qMilhar_M"]
        emitir(1)
        estado = "qUnidade_I"

      in ["V", "qMilhar_M"]
        emitir(1)
        estado = "qUnidade_V"

      in ["", "qMilhar_M"]
        emitir(1)
        estado = "qCentena"
        break

      in ["M", "qMilhar_2M"]
        estado = "qMilhar_3M"

      in ["C", "qMilhar_2M"]
        emitir(2)
        estado = "qCentena_C"

      in ["D", "qMilhar_2M"]
        emitir(2)
        estado = "qCentena_D"

      in ["X", "qMilhar_2M"]
        emitir(2)
        estado = "qDezena_X"

      in ["L", "qMilhar_2M"]
        emitir(2)
        estado = "qDezena_L"

      in ["I", "qMilhar_2M"]
        emitir(2)
        estado = "qUnidade_I"

      in ["V", "qMilhar_2M"]
        emitir(2)
        estado = "qUnidade_V"

      in ["", "qMilhar_2M"]
        emitir(2)
        estado = "qCentena"
        break

      in ["C", "qMilhar_3M"]
        emitir(3)
        estado = "qCentena_C"

      in ["D", "qMilhar_3M"]
        emitir(3)
        estado = "qCentena_D"

      in ["X", "qMilhar_3M"]
        emitir(3)
        estado = "qDezena_X"

      in ["L", "qMilhar_3M"]
        emitir(3)
        estado = "qDezena_L"

      in ["I", "qMilhar_3M"]
        emitir(3)
        estado = "qUnidade_I"

      in ["V", "qMilhar_3M"]
        emitir(3)
        estado = "qUnidade_V"

      in ["", "qMilhar_3M"]
        emitir(3)
        estado = "qCentena"
        break

      # Centena

      in ["C", "qCentena_D"]
        estado = "qCentena_6D"

      in ["X", "qCentena_D"]
        emitir(5)
        estado = "qDezena_X"

      in ["L", "qCentena_D"]
        emitir(5)
        estado = "qDezena_L"

      in ["I", "qCentena_D"]
        emitir(5)
        estado = "qUnidade_I"

      in ["V", "qCentena_D"]
        emitir(5)
        estado = "qUnidade_V"

      in ["", "qCentena_D"]
        emitir(5)
        estado = "qDezena"
        break

      in ["C", "qCentena_6D"]
        estado = "qCentena_7D"

      in ["X", "qCentena_6D"]
        emitir(6)
        estado = "qDezena_X"

      in ["L", "qCentena_6D"]
        emitir(6)
        estado = "qDezena_L"

      in ["I", "qCentena_6D"]
        emitir(6)
        estado = "qUnidade_I"

      in ["V", "qCentena_6D"]
        emitir(6)
        estado = "qUnidade_V"

      in ["", "qCentena_6D"]
        emitir(6)
        estado = "qDezena"
        break

      in ["C", "qCentena_7D"]
        estado = "qCentena_8D"

      in ["X", "qCentena_7D"]
        emitir(7)
        estado = "qDezena_X"

      in ["L", "qCentena_7D"]
        emitir(7)
        estado = "qDezena_L"

      in ["I", "qCentena_7D"]
        emitir(7)
        estado = "qUnidade_I"

      in ["V", "qCentena_7D"]
        emitir(7)
        estado = "qUnidade_V"

      in ["", "qCentena_7D"]
        emitir(7)
        estado = "qDezena"
        break

      in ["X", "qCentena_8D"]
        emitir(8)
        estado = "qDezena_X"

      in ["L", "qCentena_8D"]
        emitir(8)
        estado = "qDezena_L"

      in ["I", "qCentena_8D"]
        emitir(8)
        estado = "qUnidade_I"

      in ["V", "qCentena_8D"]
        emitir(8)
        estado = "qUnidade_V"

      in ["", "qCentena_8D"]
        emitir(8)
        estado = "qDezena"
        break

      in ["C", "qCentena_C"]
        estado = "qCentena_2C"

      in ["M", "qCentena_C"]
        estado = "qCentena_CM"

      in ["D", "qCentena_C"]
        estado = "qCentena_CD"

      in ["X", "qCentena_C"]
        emitir(1)
        estado = "qDezena_X"

      in ["L", "qCentena_C"]
        emitir(1)
        estado = "qDezena_L"

      in ["I", "qCentena_C"]
        emitir(1)
        estado = "qUnidade_I"

      in ["V", "qCentena_C"]
        emitir(1)
        estado = "qUnidade_V"

      in ["", "qCentena_C"]
        emitir(1)
        estado = "qDezena"
        break

      in ["C", "qCentena_2C"]
        estado = "qCentena_3C"

      in ["X", "qCentena_2C"]
        emitir(2)
        estado = "qDezena_X"

      in ["L", "qCentena_2C"]
        emitir(2)
        estado = "qDezena_L"

      in ["I", "qCentena_2C"]
        emitir(2)
        estado = "qUnidade_I"

      in ["V", "qCentena_2C"]
        emitir(2)
        estado = "qUnidade_V"

      in ["", "qCentena_2C"]
        emitir(2)
        estado = "qDezena"
        break

      in ["X", "qCentena_3C"]
        emitir(3)
        estado = "qDezena_X"

      in ["L", "qCentena_3C"]
        emitir(3)
        estado = "qDezena_L"

      in ["I", "qCentena_3C"]
        emitir(3)
        estado = "qUnidade_I"

      in ["V", "qCentena_3C"]
        emitir(3)
        estado = "qUnidade_V"

      in ["", "qCentena_3C"]
        emitir(3)
        estado = "qDezena"
        break

        in ["X", "qCentena_CD"]
        emitir(4)
        estado = "qDezena_X"

      in ["L", "qCentena_CD"]
        emitir(4)
        estado = "qDezena_L"

      in ["I", "qCentena_CD"]
        emitir(4)
        estado = "qUnidade_I"

      in ["V", "qCentena_CD"]
        emitir(4)
        estado = "qUnidade_V"

      in ["", "qCentena_CD"]
        emitir(4)
        estado = "qDezena"
        break

        
        in ["X", "qCentena_CM"]
        emitir(9)
        estado = "qDezena_X"

      in ["L", "qCentena_CM"]
        emitir(9)
        estado = "qDezena_L"

      in ["I", "qCentena_CM"]
        emitir(9)
        estado = "qUnidade_I"

      in ["V", "qCentena_CM"]
        emitir(9)
        estado = "qUnidade_V"

      in ["", "qCentena_CM"]
        emitir(9)
        estado = "qDezena"
        break

            # Dezena

      in ["X", "qDezena_L"]
        estado = "qDezena_6L"

      in ["I", "qDezena_L"]
        emitir(5)
        estado = "qUnidade_I"

      in ["V", "qDezena_L"]
        emitir(5)
        estado = "qUnidade_V"

      in ["", "qDezena_L"]
        emitir(5)
        estado = "qUnidade"
        break

      in ["X", "qDezena_6L"]
        estado = "qDezena_7L"

      in ["I", "qDezena_6L"]
        emitir(6)
        estado = "qUnidade_I"

      in ["V", "qDezena_6L"]
        emitir(6)
        estado = "qUnidade_V"

      in ["", "qDezena_6L"]
        emitir(6)
        estado = "qUnidade"
        break

      in ["X", "qDezena_7L"]
        estado = "qDezena_8L"

      in ["I", "qDezena_7L"]
        emitir(7)
        estado = "qUnidade_I"

      in ["V", "qDezena_7L"]
        emitir(7)
        estado = "qUnidade_V"

      in ["", "qDezena_7L"]
        emitir(7)
        estado = "qUnidade"
        break

      in ["I", "qDezena_7L"]
        emitir(8)
        estado = "qUnidade_I"

      in ["V", "qDezena_7L"]
        emitir(8)
        estado = "qUnidade_V"

      in ["", "qDezena_7L"]
        emitir(8)
        estado = "qUnidade"
        break

      in ["X", "qDezena_X"]
        estado = "qDezena_2X"
      
        in ["L", "qDezena_X"]
        estado = "qDezena_XL"
      
      in ["C", "qDezena_X"]
        estado = "qDezena_XC"
      
      in ["I", "qDezena_X"]
        emitir(1)
        estado = "qUnidade_I"

      in ["V", "qDezena_X"]
        emitir(1)
        estado = "qUnidade_V"

      in ["", "qDezena_X"]
        emitir(1)
        estado = "qUnidade"
        break

      in ["X", "qDezena_2X"]
        estado = "qDezena_3X"

      in ["I", "qDezena_2X"]
        emitir(2)
        estado = "qUnidade_I"

      in ["V", "qDezena_2X"]
        emitir(2)
        estado = "qUnidade_V"

      in ["", "qDezena_2X"]
        emitir(2)
        estado = "qUnidade"
        break

      in ["I", "qDezena_3X"]
        emitir(3)
        estado = "qUnidade_I"

      in ["V", "qDezena_3X"]
        emitir(3)
        estado = "qUnidade_V"

      in ["", "qDezena_3X"]
        emitir(3)
        estado = "qUnidade"
        break

      in ["I", "qDezena_XL"]
        emitir(4)
        estado = "qUnidade_I"

      in ["V", "qDezena_XL"]
        emitir(4)
        estado = "qUnidade_V"

      in ["", "qDezena_XL"]
        emitir(4)
        estado = "qUnidade"
        break

      in ["I", "qDezena_XC"]
        emitir(9)
        estado = "qUnidade_I"

      in ["V", "qDezena_XC"]
        emitir(9)
        estado = "qUnidade_V"

      in ["", "qDezena_XC"]
        emitir(9)
        estado = "qUnidade"
        break

      
      in ["X", "qDezena_L"]
        estado = "qDezena_6L"

      in ["I", "qDezena_L"]
        emitir(5)
        estado = "qUnidade_I"

      in ["V", "qDezena_L"]
        emitir(5)
        estado = "qUnidade_V"

      in ["", "qDezena_L"]
        emitir(5)
        estado = "qUnidade"
        break

      in ["X", "qDezena_6L"]
        estado = "qDezena_7L"

      in ["I", "qDezena_6L"]
        emitir(6)
        estado = "qUnidade_I"

      in ["V", "qDezena_6L"]
        emitir(6)
        estado = "qUnidade_V"

      in ["", "qDezena_6L"]
        emitir(6)
        estado = "qUnidade"
        break

      in ["X", "qDezena_7L"]
        estado = "qDezena_8L"

      in ["I", "qDezena_7L"]
        emitir(7)
        estado = "qUnidade_I"

      in ["V", "qDezena_7L"]
        emitir(7)
        estado = "qUnidade_V"

      in ["", "qDezena_7L"]
        emitir(7)
        estado = "qUnidade"
        break

      in ["I", "qDezena_8L"]
        emitir(8)
        estado = "qUnidade_I"

      in ["V", "qDezena_8L"]
        emitir(8)
        estado = "qUnidade_V"

      in ["", "qDezena_8L"]
        emitir(8)
        estado = "qUnidade"
        break

      in ["I", "qUnidade_I"]
        estado = "qUnidade_2I"

      in ["V", "qUnidade_I"]
        emitir(4)
        estado = "qFinal"
        
      in ["X", "qUnidade_I"]
        emitir(9)
        estado = "qFinal"
        

      in ["", "qUnidade_I"]
        emitir(1)
        estado = "qFinal"
        break

      in ["I", "qUnidade_2I"]
        estado = "qUnidade_3I"

      in ["", "qUnidade_2I"]
        emitir(2)
        estado = "qFinal"
        aceitar
        break

      in ["", "qUnidade_3I"]
        emitir(3)
        estado = "qFinal"
        aceitar
        break

      in ["I", "qUnidade_V"]
        estado = "qUnidade_6V"

      in ["", "qUnidade_V"]
        emitir(5)
        estado = "qFinal"
        break

        in ["I", "qUnidade_6V"]
        estado = "qUnidade_7V"

      in ["", "qUnidade_6V"]
        emitir(6)
        estado = "qFinal"
        break

      in ["I", "qUnidade_7V"]
        estado = "qUnidade_8V"

      in ["", "qUnidade_7V"]
        emitir(7)
        estado = "qFinal"
        break

      in ["", "qUnidade_8V"]
        emitir(8)
        estado = "qFinal"
        

      in ["","qCentena"]
        emitir(0)
        estado = "qDezena"
      
      
      in ["C","qDezena"]
        emitir(0)
        estado = "qUnidade"
 
     
      in ["D","qUnidade"]
        emitir(0)
        estado = "qFinal"
        break   
      else
        erro(estado)
        break
      end

      @indice += 1
      puts "Estado: #{estado}"
    end
  end
end

puts "Digite um número romano:"
entrada = gets.chomp

adf = ADFRomano.new(entrada)
adf.iniciar